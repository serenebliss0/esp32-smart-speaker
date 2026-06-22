#include "WebServer.h"

#include <Arduino.h>
#include <SPIFFS.h>

#include "BluetoothA2DPSink.h"
#include "ble/BLEManager.h"
#include "core/Speaker.h"
#include "wifi/WiFiManager.h"

#define DEBUG

extern BluetoothA2DPSink a2dp_sink;

String currentTrack = "Nothing playing";
String currentArtist = "";

bool serverStarted = false; //this is so the WIFI memory leak stops (i hope)

AsyncWebServer server(80);

void startWebServer() {

  SPIFFS.begin(true); // format if first time



  // Serve files
  server.serveStatic("/", SPIFFS, "/").setDefaultFile("index.html");
  server.serveStatic("/styles.css", SPIFFS, "/styles.css");
  server.serveStatic("/script.js",  SPIFFS, "/script.js");
  server.on("/", HTTP_GET, [](AsyncWebServerRequest *r){
    r->redirect("/index.html");
  });


  //i'll be very honest with you, i don't undertsand a single thing that's happening below this comment:
server.on("/play",     HTTP_GET, [](AsyncWebServerRequest *r){ a2dp_sink.set_auto_reconnect(true); r->send(200); });
server.on("/pause",    HTTP_GET, [](AsyncWebServerRequest *r){ a2dp_sink.pause(); r->send(200); });
server.on("/next",     HTTP_GET, [](AsyncWebServerRequest *r){ a2dp_sink.next();  r->send(200); });
server.on("/previous", HTTP_GET, [](AsyncWebServerRequest *r){ a2dp_sink.previous(); r->send(200); });

server.on("/volume", HTTP_GET, [](AsyncWebServerRequest *r){
  if (r->hasParam("v")) {
    int v = r->getParam("v")->value().toInt();
    a2dp_sink.set_volume(constrain(v, 0, 127));
  }
  r->send(200);
});

server.on("/mode", HTTP_GET, [](AsyncWebServerRequest *r){
  if (r->hasParam("m")) {
    int m = r->getParam("m")->value().toInt();
    currentMode = static_cast<SpeakerMode>(m);
    onModeChange(currentMode);
  }
  r->send(200);
});

server.on("/battery", HTTP_GET, [](AsyncWebServerRequest *r){
  r->send(200, "text/plain", String(readBatteryLevel()));
});

server.on("/ping", HTTP_GET, [](AsyncWebServerRequest *r){
  r->send(200, "text/plain", "OK");
});

  Serial.print("Free heap before server: ");
  Serial.println(ESP.getFreeHeap());

  server.begin();

  // DEBUG: list all files on SPIFFS
  #ifdef DEBUG
  File root = SPIFFS.open("/");
  File file = root.openNextFile();
  while(file) {
    Serial.print("SPIFFS file: ");
    Serial.println(file.name());
    file = root.openNextFile();
  }
  #endif
  
}

void getSongMetadata() {
  // add this callback before a2dp_sink.start()
a2dp_sink.set_avrc_metadata_callback([](uint8_t id, const uint8_t* text) {
    if (id == ESP_AVRC_MD_ATTR_TITLE)  currentTrack = String((char*)text);
    if (id == ESP_AVRC_MD_ATTR_ARTIST) currentArtist = String((char*)text);
});

// add a route to expose it
server.on("/nowplaying", HTTP_GET, [](AsyncWebServerRequest *r){
    String json = "{\"track\":\"" + currentTrack + "\",\"artist\":\"" + currentArtist + "\"}";
    r->send(200, "application/json", json);
});
}

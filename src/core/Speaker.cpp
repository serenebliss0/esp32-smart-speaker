#include "Speaker.h"

#include <Arduino.h>
#include <WiFi.h>

#include "audio/AudioManager.h"
#include "web/WebServer.h"
#include "wifi/WiFiManager.h"

#define DEBUG

extern BluetoothA2DPSink a2dp_sink;
extern AudioManager audio;

SpeakerMode currentMode = BLUETOOTH; // default

void on_connected(esp_a2d_connection_state_t state, void* ptr) {
  if (state == ESP_A2D_CONNECTION_STATE_CONNECTED) {
    audio.play_connected_sound();
    audio.buzz(1000,1000);
  }
}

void stopAllRadios() {
  // 1. Stop everything first to clear the radio
  a2dp_sink.end(true);
  delay(300);

  WiFi.disconnect(false);
  WiFi.mode(WIFI_OFF);
  delay(500);
}

void onModeChange(SpeakerMode mode) {

  if (mode == currentMode) return;  //  prevents restart crash

  switch(mode) {
    case BLUETOOTH:
    #ifdef DEBUG
    Serial.println("Entering Bluetooth mode...");
    a2dp_sink.start("ESP32 Speaker");
    #endif

    //stopAllRadios();
    //a2dp_sink.start(deviceName.c_str());
    break;

    case SMART_ASSISTANT:
    #ifdef DEBUG
    Serial.println("Entering Smart Assistant...");
    #endif
      stopAllRadios();
      break;

    case WIFI_STREAM:
    #ifdef DEBUG
    Serial.println("Entering WiFi mode...");
    #endif
      stopAllRadios();
      connectWiFi();
      if (!serverStarted) {        // only start once!!
        startWebServer();
        serverStarted = true;
      }
      break;

    case HEADPHONE_JACK:
    #ifdef DEBUG
    Serial.println("Entering AUX mode...");
    #endif
      stopAllRadios();
      connectWiFi();
      break;
  }
}

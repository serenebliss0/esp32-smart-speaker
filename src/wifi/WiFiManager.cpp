#include "WiFiManager.h"

#include <Arduino.h>
#include <WiFi.h>

#ifdef WAVELET_MAX
#include <ESPmDNS.h>
#endif

const char* staSSID = ""; //im not leaking this again
const char* staPassword = "";

#ifdef WAVELET_MAX
const char* apSSID = "WAVELET_MAX";
const char* apPassword = "12345678"; // needs 8+ chars
#endif

void syncDateTime() {

  configTime(
    0,
    0,
    "pool.ntp.org",
    "time.nist.gov"
);

time_t now = time(nullptr);

#ifdef DEBUG
Serial.print("Waiting for time");
#endif

while (now < 1000000000) {
delay(500);
Serial.print(".");
now = time(nullptr);
}

#ifdef DEBUG
Serial.println("Time synchronized!");
#endif
}

void startmDNS() {
  #ifdef WAVELET_MAX
  if (WiFi.status() == WL_CONNECTED) {
    if (!MDNS.begin("wavelet")) 
    {
      Serial.println("Error starting mDNS!");
    } 
    else 
    {
      Serial.println("mDNS started successfully");
    }
  }

  Serial.println("ESP32 Network created successfully");
  #endif
}

void connectWiFi() {
  //esp_coex_preference_set(ESP_COEX_PREFER_BALANCE); // share radio fairly
  //WiFi.setTxPower(WIFI_POWER_11dBm); // reduce WiFi power to reduce interference
  
  #ifdef WAVELET_MINI
  WiFi.mode(WIFI_AP);
  #endif

  // Start Access Point
  #ifdef WAVELET_MAX
  
  WiFi.softAP(apSSID, apPassword);
  Serial.print("AP Started! IP: ");
  Serial.println(WiFi.softAPIP());
  #endif

  // Connect to home Wi-Fi (Station)
  WiFi.begin(staSSID, staPassword);
  Serial.print("Connecting to Wi-Fi");

  int attempts = 0;
  while (WiFi.status() != WL_CONNECTED && attempts < 20) {
      delay(500);
      Serial.print(".");
      attempts++;
  }

  if(WiFi.status() == WL_CONNECTED) 
  {
      Serial.println();
      Serial.print("STA Connected! IP: ");
      Serial.println(WiFi.localIP());
      // Play connected feedback sound
  } 
  else 
  {
      Serial.println();
      Serial.println("Failed to connect to STA, only AP running.");
      // Play error feedback sound
  }

  syncDateTime();
  
}

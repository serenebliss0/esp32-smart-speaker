#include "WiFiManager.h"

#include <Arduino.h>
#include <WiFi.h>
#include <ESPmDNS.h>

const char* staSSID = "IZEHI_HOTSPOT4"; //im not leaking this again
const char* staPassword = "semire ajayi";

const char* apSSID = "WAVELET_MAX";
const char* apPassword = "12345678"; // needs 8+ chars

void connectWiFi() {
  //esp_coex_preference_set(ESP_COEX_PREFER_BALANCE); // share radio fairly
  //WiFi.setTxPower(WIFI_POWER_11dBm); // reduce WiFi power to reduce interference
  
  WiFi.mode(WIFI_AP_STA);

  // Start Access Point
  WiFi.softAP(apSSID, apPassword);
  Serial.print("AP Started! IP: ");
  Serial.println(WiFi.softAPIP());

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
}

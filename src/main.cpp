/*
 * Project Name: ESP32 Smart Speaker
 * Description: A smart speaker with Bluetooth, and WiFi capabilities
 * Author: Semire Ajayi
 * Date: 12-MAR-2026
 * 
 * Hardware:
 * - ESP32 DevKit V1
 * - MAX98357A I2S Amplifier
 * - 4ohm, 8-Watt Speaker 
 * - Passive Buzzer
 * - 5k-ohm Potentiometer
 * - 5x Push Buttons
 * 
 * Connections:
 * - DIN (MAX98357A)-> Pin 22
 * - BCLK (MAX98357A) -> Pin 26
 * - LRCLK (MAX98357A) -> Pin 25
 * - BUTTONS 1-5 -> Pins [23, 21, 19, 18, 13]
 * - BUZZER -> Pin 27
 * - POTENTIOMETER -> Pin 34
 * - BATTERY PIN -> Pin 35
 * 
 * 
 */

#include <Arduino.h>
#include "BluetoothA2DPSink.h"
#include <WiFi.h>
#include "driver/i2s.h"
#include <Preferences.h>

#include "audio/AudioManager.h"
#include "ble/BLEManager.h"
#include "core/Speaker.h"

#if defined(WAVELET_REGULAR)
#include "input/Buttons.h"
#endif

#include "storage/PreferencesManager.h"

#ifdef WAVELET_MAX
#include "web/WebServer.h"
#include "wifi/WiFiManager.h"
#endif

#ifdef WAVELET_MINI
#include "wifi/WiFiManager.h"
#include "spotify_controller/Spotify.h"
#include "screens/splash/splash.h"
#endif

#include "Config.h"

Preferences prefs;
AudioManager audio(prefs);

BluetoothA2DPSink a2dp_sink;

// comment this line to disable debug
#define DEBUG

//uncomment this line to enable BatteryStats
#define BATTERIES_CONNECTED

#define FIRMWARE_VERSION "1.0.0"

#if defined(WAVELET_MINI) || defined(WAVELET_REGULAR)
#ifdef BATTERIES_CONNECTED
#define BATTERY_PIN 35
#endif
#endif

void setup() {

    #ifdef DEBUG
    Serial.begin(115200);
    #endif

    ledcSetup(0, 2000, 8);
    ledcAttachPin(Config::BUZZER, 0);

    //esp_bt_controller_mem_release(ESP_BT_MODE_BLE);
    /*
    WiFi.disconnect(true);
    WiFi.mode(WIFI_OFF);
    delay(100);
    */

    prefs.begin("app", false); // open once

    #if defined(WAVELET_MINI) || defined(WAVELET_REGULAR)

    pinMode(Config::BUZZER, OUTPUT);
    
    pinMode(Config::PWR_BUTTON, INPUT_PULLUP);
    pinMode(Config::MODE_BUTTON, INPUT_PULLUP);
    pinMode(Config::PREVIOUS_BUTTON, INPUT_PULLUP);
    pinMode(Config::NEXT_BUTTON, INPUT_PULLUP);
    pinMode(Config::PAUSE_BUTTON, INPUT_PULLUP);
    
    #endif
  /*
      // Initialize BLE for battery level
  BLEDevice::init("Serenity's ESP32");
  BLEServer* pServer = BLEDevice::createServer();
  BLEService* pService = pServer->createService(BATTERY_SERVICE_UUID);

  batteryCharacteristic = pService->createCharacteristic(
    BATTERY_CHAR_UUID,
    BLECharacteristic::PROPERTY_READ | BLECharacteristic::PROPERTY_NOTIFY
  );

  batteryCharacteristic->addDescriptor(new BLE2902()); // enable notifications
  pService->start();

  BLEAdvertising* pAdvertising = BLEDevice::getAdvertising();
  pAdvertising->addServiceUUID(BATTERY_SERVICE_UUID);
  pAdvertising->start();
  
  */

  //

    #ifdef DEBUG
    String mac_addr = WiFi.macAddress();
    Serial.println(WiFi.macAddress());
    #endif
    //esp_bt_controller_mem_release(ESP_BT_MODE_BLE);

    i2s_pin_config_t my_pins = {
        .bck_io_num = 26,
        .ws_io_num = 25,
        .data_out_num = 4, //DIN
        .data_in_num = I2S_PIN_NO_CHANGE
    };

    a2dp_sink.set_pin_config(my_pins);
    a2dp_sink.set_on_connection_state_changed(on_connected);
    a2dp_sink.set_auto_reconnect(false);

    #ifdef WAVELET_MAX
    getSongMetadata(); //achieve song info for the web ui
    #endif

    #ifdef WAVELET_MINI
    a2dp_sink.start("Wavelet Mini");
    #endif

    #ifdef WAVELET_REGULAR
    a2dp_sink.start("Wavelet");
    #endif

    #ifdef WAVELET_MAX
    a2dp_sink.start("Wavelet Max");
    #endif

  
    audio.play_startup_sound();

    int rememberedVolume = readRememberedVolume();
    a2dp_sink.set_volume(rememberedVolume);
    //i2s_set_clk(I2S_NUM_0, 44100, I2S_BITS_PER_SAMPLE_16BIT, I2S_CHANNEL_STEREO);
    audio.buzz(1000,1000);

    #ifdef WAVELET_MAX
    connectWiFi();
    delay(5000);
    startWebServer();
    getSongMetadata();
    #endif
}

void loop() {
  String serial_input_args = Serial.readStringUntil('\n');
  serial_input_args.trim(); // remove newline
  audio.updateVolume();

  #if defined(WAVELET_REGULAR) || defined(WAVELET_MINI)
  #ifdef DEBUG
  int battery_level = readBatteryLevel();
  Serial.println(battery_level);
  #endif
  update_battery();
  #endif

  #ifdef WAVELET_REGULAR
  checkModeButton();
  handlePowerButton();
  handlePreviousButton();
  handleNextButton();
  #endif
  //MDNS.update();

  if (serial_input_args == "volume")
  {
    Serial.println(String(rememberedVolume) + "%");
  }
}

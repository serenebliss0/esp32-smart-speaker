#include "BLEManager.h"

#include <Arduino.h>

#define DEBUG
#define BATTERIES_CONNECTED

BLECharacteristic* batteryCharacteristic;

//i haven't gotten some batteries yet. i'll test this part when i do : )
// but for now, here's a simple framework from what i've learnt
int readBatteryLevel() {
  int raw = analogRead(35); // ADC pin for battery
  float voltage = (raw / 4095.0) * 3.3 * 2; // adjust 2 if you have voltage divider
  int batteryPercent = (voltage / 4.2) * 100;
  if (batteryPercent > 100) batteryPercent = 100;
  return batteryPercent;
}

void update_battery() {

  #ifndef BATTERIES_CONNECTED && DEBUG
    return; // fake value until i get some batteries
  #endif

  // Update BLE battery every 2 sec
  static unsigned long lastBatteryUpdate = 0;
  if (millis() - lastBatteryUpdate > 2000) {
    int battery = readBatteryLevel();
    batteryCharacteristic->setValue(battery);
    batteryCharacteristic->notify();
    lastBatteryUpdate = millis();

    #ifdef DEBUG
      Serial.print("Battery Level: ");
      Serial.print(battery);
      Serial.println("%");
    #endif
  }
}

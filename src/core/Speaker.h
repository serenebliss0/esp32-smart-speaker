#pragma once

#include "BluetoothA2DPSink.h"

enum SpeakerMode {
  BLUETOOTH = 0,
  SMART_ASSISTANT,
  WIFI_STREAM,
  HEADPHONE_JACK
};

extern SpeakerMode currentMode;

void stopAllRadios();
void onModeChange(SpeakerMode mode);
void on_connected(esp_a2d_connection_state_t state, void* ptr);

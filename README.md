# ESP32 Smart Speaker (Wavelet)

An ESP32-based smart speaker firmware project that combines Bluetooth A2DP playback, physical controls, battery telemetry, and a browser-based control dashboard served from SPIFFS.

## What this repository contains

This repo is a PlatformIO Arduino project for a multi-mode ESP32 speaker called **Wavelet**.

Current firmware focus:
- Bluetooth audio sink playback (`ESP32-A2DP`)
- Hardware controls (power, mode, previous, next, pause wiring)
- Potentiometer-driven live volume control with persisted volume memory
- Optional Wi-Fi + local dashboard (`ESPAsyncWebServer` + SPIFFS)
- Early BLE battery characteristic support

It also includes:
- KiCad design files for hardware (`/esp32-smart-speaker-schema`)
- UI design iterations (`/webpage_iterations`)
- Dashboard screenshots (`/webpage-screenshots`)

---

## High-level architecture

Main entry point: `/src/main.cpp`

Runtime modules:
- `/src/audio/AudioManager.*`  
  Handles buzzer tone, startup/connected/shutdown sounds over I2S, analog volume read + A2DP volume update, and volume persistence.
- `/src/core/Speaker.*`  
  Defines speaker modes and mode transitions (Bluetooth, Smart Assistant, Wi-Fi stream, AUX).
- `/src/input/Buttons.*`  
  Handles button actions, including long-press deep sleep on power button.
- `/src/web/WebServer.*`  
  Hosts static dashboard assets from SPIFFS and exposes HTTP control endpoints.
- `/src/wifi/WiFiManager.*`  
  Creates AP+STA networking and mDNS host (`wavelet.local`).
- `/src/ble/BLEManager.*`  
  Battery percentage read + BLE characteristic update hooks.
- `/src/storage/PreferencesManager.*`  
  Reads remembered volume from NVS.

Static web app files:
- `/data/index.html`
- `/data/styles.css`
- `/data/script.js`

---

## Speaker modes

Defined in `SpeakerMode` (`/src/core/Speaker.h`):

- `BLUETOOTH` (0)
- `SMART_ASSISTANT` (1)
- `WIFI_STREAM` (2)
- `HEADPHONE_JACK` (3)

Mode button cycles through all four modes in order.

---

## Hardware and pin map

From the project header comments and `Config.h`:

Audio / IO:
- I2S BCLK: GPIO 26
- I2S LRCLK: GPIO 25
- I2S DATA (DIN to amp): GPIO 4
- Buzzer: GPIO 27
- Volume potentiometer: GPIO 34

Buttons:
- Power: GPIO 23
- Mode: GPIO 21
- Previous: GPIO 19
- Next: GPIO 18
- Pause: GPIO 13

Battery:
- ADC read pin: GPIO 35

---

## Build configuration

`/platformio.ini` defines three environments:
- `mini`
- `regular`
- `max`

Common settings:
- Platform: `espressif32`
- Board: `esp32doit-devkit-v1`
- Framework: `arduino`
- Partitions: `min_spiffs.csv`

Feature flags are selected by environment (`WAVELET_MINI`, `WAVELET_REGULAR`, `WAVELET_MAX`, plus optional feature macros).

---

## Getting started

### 1) Prerequisites
- Python 3
- PlatformIO Core or PlatformIO IDE
- ESP32 USB drivers installed on your machine

### 2) Install PlatformIO Core (CLI)
```bash
pip install platformio
```

### 3) Build firmware
```bash
cd <project_root>
python -m platformio run -e mini
```

Use `regular` or `max` instead of `mini` as needed.

### 4) Upload firmware
```bash
python -m platformio run -e mini -t upload
```

### 5) Upload web assets to SPIFFS
```bash
python -m platformio run -e mini -t uploadfs
```

---

## Web dashboard and HTTP API

When Wi-Fi mode is active, the firmware serves a local dashboard and control routes.

Static routes:
- `/` → redirects to `/index.html`
- `/index.html`
- `/styles.css`
- `/script.js`

Control/API routes (`GET`):
- `/play`
- `/pause`
- `/next`
- `/previous`
- `/volume?v=<0..127>`
- `/mode?m=<0..3>`
- `/battery`
- `/nowplaying`

---

## Data persistence

NVS (Preferences) keys currently used:
- Namespace `volume`, key `volume` for remembered playback volume.

---

## Security and configuration notes

This project currently includes hardcoded Wi-Fi credentials in `/src/wifi/WiFiManager.cpp` (STA and AP). Before deploying or sharing binaries:
- Replace with your own values
- Avoid committing personal credentials
- Prefer runtime provisioning or secure storage

---

## Known project state and limitations

- BLE battery service initialization in `main.cpp` is currently commented out.
- The web UI is actively evolving and undergoing active iteration.
- `AudioManager.cpp` embeds large raw sound arrays, so compile times and file size are significant.

---

## Repository layout

- `/src` firmware source
- `/data` SPIFFS web assets
- `/spk-sounds` source audio assets
- `/esp32-smart-speaker-schema` KiCad design files/backups
- `/webpage_iterations` UI concept snapshots
- `/webpage-screenshots` visual reference captures
- `/include`, `/lib`, `/test` default PlatformIO folders

---

## Future improvements (suggested)

- Move credentials to secure provisioning flow
- Align `script.js` behavior with current dashboard HTML
- Add unit tests under `/test`
- Split large embedded audio arrays into generated assets or flash-friendly resource handling
- Add OTA update pipeline and release versioning workflow

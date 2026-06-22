# Wavelet
 
Wavelet is a family of ESP32-based smart speakers designed and developed as a modular audio platform. All three models share a common codebase and firmware philosophy, with features gated at compile time using preprocessor flags — one repository powers the entire family.
 
---
 
## The Wavelet Family
 
| Model | Position | Chip | Audio Config | Power | Networking |
|---|---|---|---|---|---|
| Wavelet Mini | Entry-level | ESP32-WROOM-32 | 1.0 Mono | 5V USB | None (BLE onboarding only) |
| Wavelet | Standard | ESP32-WROOM-32 | 2.0 True Stereo | 18650 Li-ion | BT A2DP |
| Wavelet Max | Flagship | ESP32-S3-DevKitC-1 | 2.1 Hi-Power | 12–24V DC wall | Full Wi-Fi (AP+STA) |
 
### 📻 Wavelet Mini — Entry-level
 
The Mini is the simplest and most portable member of the family. It functions as a compact mono Bluetooth speaker, USB-powered, with physical controls and a small display for clock faces and ambient UI. It keeps memory usage low by disabling Wi-Fi entirely and using NimBLE for lightweight BLE onboarding.
 
- **Audio:** Single MAX98357A configured for mono summation, driving one 2–2.5" speaker (3–5W)
- **Display:** Small screen for clock faces and system info (hardware in progress)
- **BLE:** NimBLE-based discovery and onboarding; saves config to NVS
- **Compile flag:** `WAVELET_MINI`
### 🔊 Wavelet — Standard
 
The standard Wavelet is the core consumer experience: a portable, battery-powered stereo Bluetooth speaker with physical controls and persistent settings.
 
- **Audio:** Two MAX98357A amplifiers in true stereo split (L/R via SD_MODE resistor configuration), driving two 3" speakers (5–10W each)
- **Power:** Single 18650 Li-ion cell with TP4056 + DW01 protection; voltage read via GPIO 35 through a resistive divider
- **Compile flag:** `WAVELET_REGULAR`
### 🧠 Wavelet Max — Flagship
 
The Max is a wall-powered smart home speaker focused on high output audio and full network integration. It moves beyond battery constraints to run a web dashboard, remote controls, and smart assistant features.
 
- **Audio:** MAX98357A as I2S pre-amplifier feeding a TPA3116D2 Class-D power amp, driving a 6.5" 600W coaxial car speaker driver
- **Power:** 12–24V 5A DC adapter; LM2596 buck converter steps down to 5V for the ESP32-S3
- **Networking:** Dual AP+STA Wi-Fi, ESPAsyncWebServer serving a browser dashboard from SPIFFS
- **MCU:** ESP32-S3 for dual-core performance, vector acceleration, and 8MB PSRAM
- **Compile flag:** `WAVELET_MAX`
---
 
## What this repository contains
 
This is a PlatformIO Arduino project targeting all three Wavelet models.
 
Current firmware features:
- Bluetooth audio sink playback via `ESP32-A2DP`
- Physical button controls (power, mode, previous, next, pause)
- Potentiometer-driven volume control with NVS persistence
- Wi-Fi dashboard with HTTP control API (Max only)
- Battery ADC telemetry with voltage divider mapping
- Startup and system feedback tones over I2S/buzzer
Also included:
- KiCad design files (`/esp32-smart-speaker-schema`)
- UI design iterations (`/webpage_iterations`)
- Dashboard screenshots (`/webpage-screenshots`)
---
 
## High-level architecture
 
Main entry point: `/src/main.cpp`
 
| Module | Location | Responsibility |
|---|---|---|
| `AudioManager` | `/src/audio/` | Buzzer tones, startup sounds, volume read + A2DP update, volume persistence |
| `Speaker` | `/src/core/` | Speaker modes and mode transition logic |
| `Buttons` | `/src/input/` | Button actions and long-press deep sleep |
| `WebServer` | `/src/web/` | Serves SPIFFS dashboard and HTTP control endpoints |
| `WiFiManager` | `/src/wifi/` | AP+STA networking and mDNS (`wavelet.local`) |
| `BLEManager` | `/src/ble/` | Battery percentage read and BLE characteristic updates |
| `PreferencesManager` | `/src/storage/` | NVS read/write for persisted settings |
 
Static web app files:
- `/data/index.html`
- `/data/styles.css`
- `/data/script.js`
---
 
## Speaker modes
 
Defined in `SpeakerMode` (`/src/core/Speaker.h`):
 
| Value | Mode |
|---|---|
| 0 | `BLUETOOTH` |
| 1 | `SMART_ASSISTANT` |
| 2 | `WIFI_STREAM` |
| 3 | `HEADPHONE_JACK` |
 
The mode button cycles through all four modes in order.
 
---
 
## Hardware and pin map
 
### Audio / I2S (shared)
 
| Signal | GPIO |
|---|---|
| I2S BCLK | 26 |
| I2S LRCLK | 25 |
| I2S DATA (DIN) | 4 |
| Buzzer | 27 |
| Volume potentiometer | 34 |
 
I2S peripheral: `I2S_NUM_0`
 
### Buttons
 
| Button | GPIO |
|---|---|
| Power | 23 |
| Mode | 21 |
| Previous | 19 |
| Next | 18 |
| Pause | 13 |
 
### Battery
 
| Signal | GPIO |
|---|---|
| ADC read | 35 |
 
---
 
## Build configuration
 
`/platformio.ini` defines three environments: `mini`, `regular`, and `max`.
 
Common settings across all environments:
- Platform: `espressif32`
- Framework: `arduino`
- Partitions: `min_spiffs.csv`
- 
| Environment | Board | Compile flag |
|---|---|---|
| `mini` | `esp32doit-devkit-v1` | `WAVELET_MINI` |
| `regular` | `esp32doit-devkit-v1` | `WAVELET_REGULAR` |
| `max` | `esp32s3box` (S3-DevKitC-1) | `WAVELET_MAX` |
 
---
 
## Getting started
 
### Prerequisites
- Python 3
- PlatformIO Core or PlatformIO IDE
- ESP32 USB drivers
### 1. Install PlatformIO
```bash
pip install platformio
```
 
### 2. Set Wi-Fi credentials
 
Open `/src/wifi/WiFiManager.cpp` and replace the placeholder SSID and password with your own before building or flashing. Do not skip this step.
 
### 3. Build firmware
```bash
cd <project_root>
python -m platformio run -e mini
```
 
Replace `mini` with `regular` or `max` as needed.
 
### 4. Upload firmware
```bash
python -m platformio run -e mini -t upload
```
 
### 5. Upload web assets to SPIFFS (Max only)
```bash
python -m platformio run -e max -t uploadfs
```
 
---
 
## Web dashboard and HTTP API
 
When Wi-Fi mode is active (Wavelet Max), the firmware hosts a browser dashboard and exposes HTTP control endpoints.
 
**Static routes:**
- `/` → redirects to `/index.html`
- `/index.html`, `/styles.css`, `/script.js`
**Control endpoints (GET):**
 
| Endpoint | Description |
|---|---|
| `/play` | Resume playback |
| `/pause` | Pause playback |
| `/next` | Skip to next track |
| `/previous` | Go to previous track |
| `/volume?v=<0..127>` | Set volume |
| `/mode?m=<0..3>` | Set speaker mode |
| `/battery` | Returns battery percent as plain integer (e.g. `78`) |
| `/nowplaying` | Returns `{ "track": "...", "artist": "..." }` |
 
Access the dashboard at `http://wavelet.local` once connected.
 
---
 
## Data persistence
 
NVS via `Preferences.h`:
 
| Namespace | Key | Value |
|---|---|---|
| `volume` | `volume` | Last set playback volume |
 
---
 
## Repository layout
 
```
/src                        Firmware source
/data                       SPIFFS web assets (HTML, CSS, JS)
/spk-sounds                 Source audio assets
/esp32-smart-speaker-schema KiCad design files
/webpage_iterations         UI concept history
/webpage-screenshots        Visual reference captures
/include /lib /test         Default PlatformIO folders
```

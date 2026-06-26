#pragma once

#include <Arduino.h>
#include "SpotifyEsp32.h"

extern const char* SSID;
extern const char* PASSWORD;
extern const char* CLIENT_ID;
extern const char* CLIENT_SECRET;
extern const char* REFRESH_TOKEN;

extern Spotify sp;

extern const int PLAY_BUTTON;
extern const int PREV_BUTTON;
extern const int NXT_BUTTON;

extern volatile bool play_buttonPressed;
extern volatile bool prev_buttonPressed;
extern volatile bool next_buttonPressed;

void IRAM_ATTR play_buttonISR();
void IRAM_ATTR prev_buttonISR();
void IRAM_ATTR next_buttonISR();

extern String lastTrack;
extern String lastArtist;
extern bool lastPlaying;

void initialize();

void getCurrentlyPlaying();
void pauseCurrentlyPlaying();
void playNextSong();
void playPreviousSong();

void setVolume(int volume_level);
void seekToPosition(int position_level);
void enableShuffling();
void disableShuffling();
void enableRepeat();
void disableRepeat();
void repeatOne();

void getAvailableDevices();
void getAlbumCover();
void searchSong(const char* song_name);
void getUserPlaylists();
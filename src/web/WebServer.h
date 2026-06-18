#pragma once

#include <ESPAsyncWebServer.h>

extern AsyncWebServer server;
extern bool serverStarted;
extern String currentTrack;
extern String currentArtist;

void startWebServer();
void getSongMetadata();

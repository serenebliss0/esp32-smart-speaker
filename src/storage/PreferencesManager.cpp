#include "PreferencesManager.h"

#include <Preferences.h>

extern Preferences prefs;

int readRememberedVolume() {
  //read saved preferences
  prefs.begin("volume", true); // read-only
  int rememberedVolume = prefs.getInt("volume", 50);
  prefs.end();

  return rememberedVolume;
}

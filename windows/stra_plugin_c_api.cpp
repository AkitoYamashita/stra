#include "include/stra/stra_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "stra_plugin.h"

void StraPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  stra::StraPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}

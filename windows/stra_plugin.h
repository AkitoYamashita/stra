#ifndef FLUTTER_PLUGIN_STRA_PLUGIN_H_
#define FLUTTER_PLUGIN_STRA_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace stra {

class StraPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  StraPlugin();

  virtual ~StraPlugin();

  // Disallow copy and assign.
  StraPlugin(const StraPlugin&) = delete;
  StraPlugin& operator=(const StraPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace stra

#endif  // FLUTTER_PLUGIN_STRA_PLUGIN_H_

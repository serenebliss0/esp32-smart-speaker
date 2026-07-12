import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BleScanner {
  static const String waveletPrefix = "WVL-";

  static Stream<List<ScanResult>> scan() {
    FlutterBluePlus.startScan(timeout: Duration(seconds: 15));

    return FlutterBluePlus.scanResults.map((results) =>
      results.where((r) =>
        r.device.platformName.startsWith(waveletPrefix)
      ).toList()
    );
  }

  static void stop() => FlutterBluePlus.stopScan();

  // convert RSSI to label
  static String signalLabel(int rssi) {
    if (rssi >= -60) return "Strong";
    if (rssi >= -75) return "Good";
    return "Fair";
  }

  // extract model from device name e.g. "WVL-mini" → "mini"
  static String extractModel(String name) {
    return name.replaceFirst(waveletPrefix, "").toLowerCase();
  }
}
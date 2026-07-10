import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BleScanner {
  // only pick up wavelet devices
  static const String waveletPrefix = "WVL";

  static Stream<List<ScanResult>> startScan() {
    FlutterBluePlus.startScan(timeout: Duration(seconds: 10));
    return FlutterBluePlus.scanResults.map((results) =>
      results.where((r) =>
        r.device.platformName.startsWith(waveletPrefix)
      ).toList()
    );
  }

  static void stopScan() {
    FlutterBluePlus.stopScan();
  }
}
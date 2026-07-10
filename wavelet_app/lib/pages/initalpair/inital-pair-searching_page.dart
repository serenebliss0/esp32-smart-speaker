import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:Wavelet/theme/colors.dart';
import 'package:Wavelet/util/function/ble_scanner.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.toggleTheme});
  final VoidCallback toggleTheme;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ScanResult> devices = [];
  bool isScanning = false;

  @override
  void initState() {
    super.initState();
    startScanning();
  }

  void startScanning() {
    setState(() => isScanning = true);

    BleScanner.startScan().listen((results) {
      setState(() => devices = results);
    });

    Future.delayed(Duration(seconds: 10), () {
      if (mounted) setState(() => isScanning = false);
    });
  }

  @override
  void dispose() {
    BleScanner.stopScan();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WaveletColors.background(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB(24, 71, 24, 8),
            child: Text(
              "Find your Wavelet",
              style: TextStyle(
                color: WaveletColors.textPrimary(context),
                fontFamily: 'Nunito',
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
            child: Text(
              "Make sure your speaker is powered on and nearby.",
              style: TextStyle(
                color: WaveletColors.textSecondary(context),
                fontFamily: 'Inter',
                fontSize: 14,
              ),
            ),
          ),

          // scanning indicator
          if (isScanning)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: WaveletColors.primary(context),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Scanning...",
                    style: TextStyle(
                      color: WaveletColors.textSecondary(context),
                      fontFamily: 'Inter',
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

          SizedBox(height: 16),

          // device list
          Expanded(
            child: devices.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.speaker, 
                        color: WaveletColors.textDisabled(context), 
                        size: 48),
                      SizedBox(height: 12),
                      Text(
                        isScanning 
                          ? "Looking for speakers..." 
                          : "No speakers found",
                        style: TextStyle(
                          color: WaveletColors.textDisabled(context),
                          fontFamily: 'Inter',
                          fontSize: 14,
                        ),
                      ),
                      if (!isScanning) ...[
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: startScanning,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: WaveletColors.primaryButton(context),
                            foregroundColor: WaveletColors.primaryButtonText(context),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text("Scan again"),
                        ),
                      ]
                    ],
                  ),
                )
              : ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemCount: devices.length,
                  separatorBuilder: (_, __) => SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final device = devices[index];
                    return DeviceCard(
                      device: device,
                      toggleTheme: widget.toggleTheme,
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }
}
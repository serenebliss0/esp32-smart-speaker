import 'package:Wavelet/pages/initalpair/devicespecific/max/max-wifi-connect_page.dart';
import 'package:Wavelet/pages/initalpair/devicespecific/mini/mini-wifi-connect_page.dart';
import 'package:Wavelet/pages/initalpair/devicespecific/mini/mini-qrcode-scan_page.dart';
import 'package:Wavelet/pages/initalpair/devicespecific/name-wavelet_page.dart';
import 'package:Wavelet/pages/initalpair/inital-pair-searching_page.dart';
import 'package:Wavelet/pages/initalpair/initial-pair-final_page.dart';
import 'package:Wavelet/util/device_card.dart';
import 'package:Wavelet/util/five_step_navigation.dart';
import 'package:flutter/material.dart';
import 'package:Wavelet/theme/colors.dart';
import 'package:Wavelet/pages/initalpair/inital-pair-searching_page.dart';

class FoundDevices extends StatelessWidget {
  const FoundDevices({super.key, required this.toggleTheme});
  final VoidCallback toggleTheme;

  // dummy devices for now, will be replaced with real BLE results
  final List<Map<String, String>> mockDevices = const [
    {
      "name": "Wavelet Mini",
      "model": "mini",
      "signal": "Strong",
      "image": "assets/images/spk-temp.png",
      "color" : "pink"
    },
    {
      "name": "Wavelet Regular",
      "model": "regular",
      "signal": "Good",
      "image": "assets/images/spk-temp.png",
      "color" : "yellow"
    },

    {
      "name": "Wavelet Max",
      "model": "max",
      "signal": "Fair",
      "image": "assets/images/spk-temp.png",
      "color" : "white"
    },

        {
      "name": "Wavelet Mini",
      "model": "mini",
      "signal": "Strong",
      "image": "assets/images/spk-temp.png",
      "color" : "pink"
    },

        {
      "name": "Wavelet Mini",
      "model": "mini",
      "signal": "Strong",
      "image": "assets/images/spk-temp.png",
      "color" : "pink"
    },
    {
      "name": "Wavelet Regular",
      "model": "regular",
      "signal": "Good",
      "image": "assets/images/spk-temp.png",
      "color" : "yellow"
    },

    {
      "name": "Wavelet Max",
      "model": "max",
      "signal": "Fair",
      "image": "assets/images/spk-temp.png",
      "color" : "white"
    },

        {
      "name": "Wavelet Mini",
      "model": "mini",
      "signal": "Strong",
      "image": "assets/images/spk-temp.png",
      "color" : "pink"
    },
  ];

  void handleDeviceTap(BuildContext context, Map<String, String> device) {
  final model = device["model"]!;

  switch (model) {
    case "mini":
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => MiniWifiPage(
          toggleTheme: toggleTheme,
          deviceName: device["name"]!,
          pageStep: 4,
        ),
      ));
      break;

    case "max":
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => MaxWifiPage(
          toggleTheme: toggleTheme,
          deviceName: device["name"]!,
          pageStep: 4,
        ),
      ));
      break;

//change back to commented ver
      case "regular":
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => FinishedPairPage(
          //toggleTheme: toggleTheme,
          userDeviceName: device["name"]!,
          //model: "regular",
        ),
      ));
      break;

    // case "regular":
    //   Navigator.push(context, MaterialPageRoute(
    //     builder: (_) => NameDevicePage(
    //       toggleTheme: toggleTheme,
    //       deviceName: device["name"]!,
    //       model: "regular",
    //     ),
    //   ));
    //   break;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WaveletColors.background(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB(40, 69, 24, 4),
            child: Text(
              "Devices found",
              style: TextStyle(
                color: WaveletColors.textPrimary(context),
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 24, 43),
            child: Text(
              "Tap the Wavelet you want to set up.",
              style: TextStyle(
                color: WaveletColors.textSecondary(context),
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          // device list
          Expanded(

            child: mockDevices.isEmpty
              ? 
              //device list is empty: no devices found
              Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.speaker,
                        color: WaveletColors.textDisabled(context),
                        size: 48),
                      SizedBox(height: 12),
                      Text(
                        "No speakers found",
                        style: TextStyle(
                          color: WaveletColors.textDisabled(context),
                          fontFamily: 'Inter',
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SearchPage(toggleTheme: toggleTheme),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: WaveletColors.primaryButton(context),
                          foregroundColor: WaveletColors.primaryButtonText(context),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text("Search again"),
                      ),
                    ],
                  ),
                )

                //value if devices found
              : ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemCount: mockDevices.length,
                  separatorBuilder: (_, __) => SizedBox(height: 32),
                  itemBuilder: (context, index) {
                    final d = mockDevices[index];
                    return DeviceCard(
                      deviceName: d["name"]!,
                      deviceModel: d["model"]!,
                      signalStrength: d["signal"]!,
                      deviceImage: d["image"]!,
                      onTap: () => handleDeviceTap(context, d), // add this
                    );
                  },
                ),
          ),

        //step nav
          Center(
            //padding: const EdgeInsets.only(left:118, top:16),
            child: FiveStepNavigation(position: 3),
          ),

          // scan again button at bottom
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SearchPage(toggleTheme: toggleTheme),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: WaveletColors.surface(context),
                foregroundColor: WaveletColors.textSecondary(context),
                minimumSize: Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text("Scan again"),
            ),
          ),

        ],
      ),
    );
  }
}
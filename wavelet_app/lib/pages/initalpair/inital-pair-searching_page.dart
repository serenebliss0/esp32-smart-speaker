import 'package:Wavelet/pages/initalpair/initial-pair-found-devices_page.dart';
import 'package:Wavelet/util/device_card.dart';
import 'package:Wavelet/util/five_step_navigation.dart';
import 'package:Wavelet/util/progress_bar.dart';
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

    body: Column(
      children: [

        SizedBox(height: 344,),
        Center(
          child: Container(
          width: 64,
          height: 64,
          decoration: ShapeDecoration(
              color: const Color(0x21FF4D6D),
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1.60,
                      color: const Color(0xFFFF4D6D),
                  ),
                  borderRadius: BorderRadius.circular(26843500),
              ),
          ),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Container(
                      width: 28,
                      height: 28,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Icon(Icons.bluetooth)
          ,
                  ),
              ],
          ),
              ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 77, bottom: 31),
          child: Text(
            "Make sure your Wavelet is powered on",
            style: TextStyle(
              color: WaveletColors.textPrimary(context),
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w400
            ),
          ),
        ),

      Padding(
        padding: const EdgeInsets.only(left: 119, right: 119),
        child: TimedProgressBar(
            duration: Duration(seconds: 15),
            onComplete: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => FoundDevices(toggleTheme: () {
                  
                },)),
              );
            },
          ),
      ),

        SizedBox(height: 230,),

        FiveStepNavigation(position: 2),

        SizedBox(height: 24,),


//disabled button i added : )
        Container(
          width: 350,
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: ShapeDecoration(
              color: WaveletColors.disabledButton(context) /* Color-System-Buttons-Disabled-Button */,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
              ),
              shadows: [
                  BoxShadow(
                      color: Color(0x44FF4D6D),
                      blurRadius: 20,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                  )
              ],
          ),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                  Text(
                      'Continue',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: WaveletColors.disabledButtonText(context) /* Color-System-Buttons-Disabled-Button-Text */,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 1.43,
                      ),
                  ),
              ],
          ),
      )

      ], //end of column
    ),
 

    );
  }
  }
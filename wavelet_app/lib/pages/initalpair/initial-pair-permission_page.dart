import 'package:Wavelet/util/five_step_navigation.dart';
import 'package:Wavelet/util/permission_dialog.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:Wavelet/theme/colors.dart';

import 'inital-pair-searching_page.dart';


class InitialPairPermissions extends StatefulWidget {
  const InitialPairPermissions({super.key, required this.toggleTheme});
  final VoidCallback toggleTheme;

  @override
  State<InitialPairPermissions> createState() => _InitialPairPermissionsState();
}

class _InitialPairPermissionsState extends State<InitialPairPermissions> {
  //final VoidCallback toggleTheme =() {};

  bool bluetoothGranted = false;
  bool cameraGranted = false;
  bool locationGranted = false;

  //camera
      Future<void> requestCameraPermission() async {
      final status = await Permission.camera.request();

      if (status.isGranted) {
        setState(() => cameraGranted = true);
      } else if (status.isDenied) {
        // ask again or show a message
      } else if (status.isPermanentlyDenied) {
        // user said never ask again, send them to settings
        openAppSettings();
      }
    }

    //bluetooth
    Future<void> requestBluetoothPermissions() async {
      final statuses = await [
        Permission.bluetooth,
        Permission.bluetoothConnect,
        Permission.bluetoothScan,
      ].request();

      if (statuses.values.every((status) => status.isGranted)) {
                setState(() => bluetoothGranted = true);
      } else if (statuses.values.any((status) => status.isPermanentlyDenied)) {
        openAppSettings();
      }
    }

    //location/wifi
    Future<void> requestLocationPermission() async {
      final status = await Permission.location.request();

      if (status.isGranted) {
            setState(() => locationGranted = true);
      } else if (status.isPermanentlyDenied) {
        openAppSettings();
      }
    }
//UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WaveletColors.background(context),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        
          children: [
            Padding(
              padding: const EdgeInsets.only(top:71, left: 40),
              child: Text(
                "Allow access",
                style: TextStyle(
                  color: WaveletColors.textPrimary(context),
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  fontFamily: 'Inter',
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.only(left: 40, right:40),
              child: Text(
                "Wavelet needs a couple of permissions to find and connect to your speaker.",
                style: TextStyle(
                  color: WaveletColors.textSecondary(context),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: 'Inter',
                ),
              ),
            ),
        
        SizedBox(height:50),  
        
            Padding(
        padding: const EdgeInsets.only(left:40, right: 40),
        child: PermissionCard(
          permissionName: "Bluetooth",
          permissionDescription: "Required to discover and pair your Wavelet speaker nearby.",
          icon: Icons.bluetooth,
          permissionState: bluetoothGranted,
          onAllow: () => requestBluetoothPermissions(),
        ),
            ),
        
            SizedBox(height: 25.81,),
        
          Padding(
        padding: const EdgeInsets.only(left:40, right: 40),
            child: PermissionCard(
        permissionName: "Local Network",
        permissionDescription: "Lets Wavelet connect to your Wi-Fi and stream music at home.",
        icon: Icons.wifi,
        permissionState: locationGranted,
        onAllow: () => requestLocationPermission(),
            ),
          ),
        
            SizedBox(height: 25.81,),
        
          Padding(
        padding: const EdgeInsets.only(left:40, right: 40),
            child: PermissionCard(
        permissionName: "Camera",
        permissionDescription: "Required to scan the QR code on your Wavelet speaker.",
        icon: Icons.camera_alt,
        permissionState: cameraGranted,
        onAllow: () => requestCameraPermission(),
            ),
          ),
        
            SizedBox(height: 79.81,),
        
            Center(child: FiveStepNavigation(position: 1)),
        
        //only progress once all three perms are granted
        if (bluetoothGranted && cameraGranted && locationGranted)
          Center(
            child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => SearchPage(toggleTheme: () {
              
            },) ));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: WaveletColors.primaryButton(context),
            foregroundColor: WaveletColors.primaryButtonText(context),
            minimumSize: Size(294, 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Text("Continue"),
        ),
            ),
          ),
        
        
        
        
          ], //end of column
        ),
      ),
    );
  }
}
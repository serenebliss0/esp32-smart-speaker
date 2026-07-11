import 'package:flutter/material.dart';
import 'package:Wavelet/theme/colors.dart';


class NameDevicePage extends StatefulWidget {
  NameDevicePage({
    super.key, 
    required this.toggleTheme, 
    required this.deviceName,
    required this.model,
    
    });

  final VoidCallback toggleTheme;
  String deviceName;
  int pageStep = 5;
  String model;

  @override
  State<NameDevicePage> createState() => _NameDevicePageState();
}

class _NameDevicePageState extends State<NameDevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
import 'package:flutter/material.dart';
import 'package:Wavelet/theme/colors.dart';


class MiniQrScanPage extends StatefulWidget {
  MiniQrScanPage({
    super.key, 
    required this.toggleTheme,
    required this.pageStep,
    required this.ssid,
    required this.password
    
    });

  final VoidCallback toggleTheme;
  int pageStep;
  String ssid = "";
  String password = "";

  @override
  State<MiniQrScanPage> createState() => _MiniQrScanPageState();
}

class _MiniQrScanPageState extends State<MiniQrScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
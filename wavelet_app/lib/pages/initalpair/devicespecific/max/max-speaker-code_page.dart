import 'package:flutter/material.dart';

class MaxSpeakerCodePage extends StatefulWidget {
  MaxSpeakerCodePage({
    super.key,
    required this.toggleTheme,
    required this.ssid,
    required this.password
    });

  final VoidCallback toggleTheme;
  String ssid = "";
  String password = "";
  @override
  State<MaxSpeakerCodePage> createState() => _MaxSpeakerCodePageState();
}

class _MaxSpeakerCodePageState extends State<MaxSpeakerCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
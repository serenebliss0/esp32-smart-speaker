import 'package:Wavelet/theme/colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar(
    {
      super.key,
      required this.toggleTheme
    
    });

    final VoidCallback toggleTheme;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: WaveletColors.surface(context),

      body: 
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: ShapeDecoration(
              color: WaveletColors.surface(context)/* Color-System-Backgrounds-Surface */,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80),
              ),
          ),

          child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 112),
                      child: Container(
                          padding: const EdgeInsets.only(top: 12, bottom: 16),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 4,
                              children: [
                                  Container(
                                      width: 64,
                                      height: 32,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(100),
                                          ),
                                      ),
                                      child: Stack(
                                          children: [
                                              Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: Container(
                                                      width: 64,
                                                      height: 32,
                                                      clipBehavior: Clip.antiAlias,
                                                      decoration: BoxDecoration(),
                                                      child: Stack(
                                                          children: [
                                                              Positioned(
                                                                  left: 20,
                                                                  top: 4,
                                                                  child: Container(
                                                                      width: 24,
                                                                      height: 24,
                                                                      clipBehavior: Clip.antiAlias,
                                                                      decoration: BoxDecoration(),
                                                                      child: Stack(),
                                                                  ),
                                                              ),
                                                          ],
                                                      ),
                                                  ),
                                              ),
                                          ],
                                      ),
                                  ),
                                  Text(
                                      'My Devices',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          fontSize: 12,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          height: 1.33,
                                          letterSpacing: 0.50,
                                      ),
                                  ),
                              ],
                          ),
                      ),
                  ),
                  ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 112),
                      child: Container(
                          padding: const EdgeInsets.only(top: 12, bottom: 16),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 4,
                              children: [
                                  Container(
                                      width: 64,
                                      height: 32,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFF9A8D4) /* Color-System-Brand-Primary */,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(100),
                                          ),
                                      ),
                                      child: Stack(
                                          children: [
                                              Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: Container(
                                                      width: 64,
                                                      height: 32,
                                                      clipBehavior: Clip.antiAlias,
                                                      decoration: BoxDecoration(),
                                                      child: Stack(
                                                          children: [
                                                              Positioned(
                                                                  left: 20,
                                                                  top: 4,
                                                                  child: Container(
                                                                      width: 24,
                                                                      height: 24,
                                                                      clipBehavior: Clip.antiAlias,
                                                                      decoration: BoxDecoration(),
                                                                      child: Stack(),
                                                                  ),
                                                              ),
                                                          ],
                                                      ),
                                                  ),
                                              ),
                                          ],
                                      ),
                                  ),
                                  Text(
                                      'Home',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: const Color(0xFF4ADE80) /* Color-System-Status-Success */,
                                        fontSize: 12,
                                        fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w600,
                                          height: 1.33,
                                          letterSpacing: 0.50,
                                      ),
                                  ),
                              ],
                          ),
                      ),
                  ),
                  ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 112),
                      child: Container(
                          padding: const EdgeInsets.only(top: 12, bottom: 16),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 4,
                              children: [
                                  Container(
                                      width: 64,
                                      height: 32,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(100),
                                          ),
                                      ),
                                      child: Stack(
                                          children: [
                                              Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: Container(
                                                      width: 64,
                                                      height: 32,
                                                      clipBehavior: Clip.antiAlias,
                                                      decoration: BoxDecoration(),
                                                      child: Stack(
                                                          children: [
                                                              Positioned(
                                                                  left: 20,
                                                                  top: 4,
                                                                  child: Container(
                                                                      width: 24,
                                                                      height: 24,
                                                                      clipBehavior: Clip.antiAlias,
                                                                      decoration: BoxDecoration(),
                                                                      child: Stack(),
                                                                  ),
                                                              ),
                                                          ],
                                                      ),
                                                  ),
                                              ),
                                          ],
                                      ),
                                  ),
                                  Text(
                                      'Settings',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: const Color(0xFFC084B0) /* Color-System-Text-Secondary-Text */,
                                          fontSize: 12,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          height: 1.33,
                                          letterSpacing: 0.50,
                                      ),
                                  ),
                              ],
                          ),
                      ),
                  ),
              ],
          ),
      ), //end of container

);
  }
}
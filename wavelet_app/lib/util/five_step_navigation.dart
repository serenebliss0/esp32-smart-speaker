import 'package:flutter/material.dart';

class FiveStepNavigation extends StatelessWidget {
  const FiveStepNavigation({super.key, required this.position});

  final int position;

  @override
  Widget build(BuildContext context) {

    if (position == 1)
      return Container(
      width: 195,
      height: 21,
      child: Stack(
          children: [
              Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                      width: 195,
                      height: 21,
                      child: Stack(
                          children: [
                              Positioned(
                                  left: 0,
                                  top: 2,
                                  child: Container(
                                      width: 71,
                                      height: 18,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(32),
                                          ),
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 81,
                                  top: 0,
                                  child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: OvalBorder(),
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 112,
                                  top: 0,
                                  child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: OvalBorder(),
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 143,
                                  top: 0,
                                  child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: OvalBorder(),
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 174,
                                  top: 0,
                                  child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: OvalBorder(),
                                      ),
                                  ),
                              ),
                          ],
                      ),
                  ),
              ),
          ],
      ),
  );

  else if (position == 2)
    return Container(
      width: 195,
      height: 21,
      child: Stack(
          children: [
              Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                      width: 195,
                      height: 21,
                      child: Stack(
                          children: [
                              Positioned(
                                  left: 31,
                                  top: 2,
                                  child: Container(
                                      width: 71,
                                      height: 18,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(32),
                                          ),
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: OvalBorder(),
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 112,
                                  top: 0,
                                  child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: OvalBorder(),
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 143,
                                  top: 0,
                                  child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: OvalBorder(),
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 174,
                                  top: 0,
                                  child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: OvalBorder(),
                                      ),
                                  ),
                              ),
                          ],
                      ),
                  ),
              ),
          ],
      ),
  );

  else if (position == 3)
    return Container(
      width: 195,
      height: 21,
      child: Stack(
          children: [
              Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                      width: 195,
                      height: 21,
                      child: Stack(
                          children: [
                              Positioned(
                                  left: 62,
                                  top: 2,
                                  child: Container(
                                      width: 71,
                                      height: 18,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(32),
                                          ),
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: OvalBorder(),
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 31,
                                  top: 0,
                                  child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: OvalBorder(),
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 143,
                                  top: 0,
                                  child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: OvalBorder(),
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 174,
                                  top: 0,
                                  child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: OvalBorder(),
                                      ),
                                  ),
                              ),
                          ],
                      ),
                  ),
              ),
          ],
      ),
  );

  else if (position == 4)
    return Container(
      width: 195,
      height: 21,
      child: Stack(
          children: [
              Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                      width: 195,
                      height: 21,
                      child: Stack(
                          children: [
                              Positioned(
                                  left: 93,
                                  top: 2,
                                  child: Container(
                                      width: 71,
                                      height: 18,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(32),
                                          ),
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: OvalBorder(),
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 31,
                                  top: 0,
                                  child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: OvalBorder(),
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 62,
                                  top: 0,
                                  child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: OvalBorder(),
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 174,
                                  top: 0,
                                  child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: OvalBorder(),
                                      ),
                                  ),
                              ),
                          ],
                      ),
                  ),
              ),
          ],
      ),
  );

  else if (position == 5)
    return Container(
      width: 195,
      height: 21,
      child: Stack(
          children: [
              Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                      width: 195,
                      height: 21,
                      child: Stack(
                          children: [
                              Positioned(
                                  left: 124,
                                  top: 2,
                                  child: Container(
                                      width: 71,
                                      height: 18,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(32),
                                          ),
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: OvalBorder(),
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 31,
                                  top: 0,
                                  child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: OvalBorder(),
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 62,
                                  top: 0,
                                  child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: OvalBorder(),
                                      ),
                                  ),
                              ),
                              Positioned(
                                  left: 93,
                                  top: 0,
                                  child: Container(
                                      width: 21,
                                      height: 21,
                                      decoration: ShapeDecoration(
                                          color: const Color(0xFFC084B0) /* Color-System-Brand-Accent */,
                                          shape: OvalBorder(),
                                      ),
                                  ),
                              ),
                          ],
                      ),
                  ),
              ),
          ],
      ),
  );
  else
    return Container();
  }
}
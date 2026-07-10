import 'package:Wavelet/theme/colors.dart';
import 'package:flutter/material.dart';

class DeviceCard extends StatelessWidget {
  DeviceCard({
    super.key,
    required this.deviceName,
    required this.deviceModel,
    required this.signalStrength,
    required this.deviceImage
  });

  String deviceName = "";
  String deviceModel = "";
  String signalStrength = "";
  String deviceImage;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Image.asset(
              deviceImage,
            ),
          ),

          Column(
            children: [
              Text(
                deviceName,
                style: TextStyle(
                  color: WaveletColors.textPrimary(context),
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                ),


              Text(
                signalStrength,
                style: TextStyle(
                  color: signalStrength == 'strong'
                    ? WaveletColors.success(context)
                    : signalStrength == 'good'
                      ? WaveletColors.warning(context)
                      : WaveletColors.error(context), // fair
                ),
              )

            ],
          ) //end of column


        ], //end of row
      )
    );
  }
}
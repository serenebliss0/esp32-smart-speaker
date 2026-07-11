import 'package:Wavelet/theme/colors.dart';
import 'package:flutter/material.dart';

class DeviceCard extends StatelessWidget {
  DeviceCard({
    super.key,
    required this.deviceName,
    required this.deviceModel,
    required this.signalStrength,
    required this.deviceImage,
    required this.onTap, // add this
  });

  String deviceName = "";
  String deviceModel = "";
  String signalStrength = "";
  String deviceImage;
  final VoidCallback onTap; // add this



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
        color: WaveletColors.surfaceVariant(context),
          borderRadius: BorderRadius.circular(24)
        ),
        width: 332,
        height: 76,
        
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Image.asset(
                deviceImage,
                width: 60,
                height: 60,
              ),
            ),
      
            //SizedBox(width: 16,),
      
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
      
                SizedBox(height: 16,),
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
                  "Signal: $signalStrength",
                  style: TextStyle(
                    color: signalStrength == 'Strong'
                      ? WaveletColors.success(context)
                      : signalStrength == 'Good'
                        ? WaveletColors.warning(context)
                        : WaveletColors.error(context), // Fair
      
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                )
      
              ],
            ), //end of column
      
              SizedBox(width: 90.6,),
      
              Container(
                width: 20,
                height: 20,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.60,
                            color: WaveletColors.accent(context)/* Color-System-Brand-Accent */,
                        ),
                        borderRadius: BorderRadius.circular(26843500),
                    ),
                ),
            )
      
          ], //end of row
        )
      ),
    );
  }
}
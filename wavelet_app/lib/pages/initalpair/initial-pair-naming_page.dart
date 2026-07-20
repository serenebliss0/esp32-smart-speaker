import 'package:Wavelet/theme/colors.dart';
import 'package:flutter/material.dart';

class NameDevicePage extends StatefulWidget {
  const NameDevicePage({
    super.key,
    required this.toggleTheme
    
    });

    final VoidCallback toggleTheme;

  @override
  State<NameDevicePage> createState() => _NameDevicePageState();
}

class _NameDevicePageState extends State<NameDevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: WaveletColors.background(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          //name your wavelet
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 78, 173, 6),

            child: Text(
              "Name your wavelet",
              style: TextStyle(
                color: WaveletColors.textPrimary(context),
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter'
              ),
            ),
          ),
          
          //where will it live
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 0, 27),
            child: Text(
              "Where will it live?",
              style: TextStyle(
                color: WaveletColors.textSecondary(context),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter'
              ),
            ),
          ),

          //speaker icon
          Container(
            width: 120,
            height: 120,

            child: Center(
              child: Image.asset(
                'assets/images/spk-temp.png'
              ),
            ),
          ),

                  //device name field
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(36, 33, 44, 24),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Give your wavelet a name",
                    filled: true,
                    fillColor: WaveletColors.surfaceVariant(context),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none, // removes the outline border
                    ),
                  
                  hintStyle: TextStyle(
                    color: WaveletColors.textDisabled(context),
                    // style: Theme.of(context).textTheme.displayLarge
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  )
                  ),
                ),
              ),
            ),

          Padding(
            padding: const EdgeInsets.only(left: 36),
            child: Text(
                "OR PICK A ROOM",
                style: TextStyle(
                  color: WaveletColors.textPrimary(context),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter'
                ),
              ),
          ),







        ], //end of column
      ),
    );
  }
}
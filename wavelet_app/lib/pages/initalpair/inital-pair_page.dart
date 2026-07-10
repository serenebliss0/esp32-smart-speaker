import 'package:Wavelet/pages/initalpair/initial-pair-permission_page.dart';
import 'package:flutter/material.dart';
import 'package:Wavelet/theme/colors.dart';


class InitialPair extends StatelessWidget {
  const InitialPair({super.key, required this.toggleTheme});

  final VoidCallback toggleTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WaveletColors.background(context),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Image.asset('assets/images/spk-temp.png'),
          SizedBox(height: 5.56,),

          Text(
            "Set up your wavelet",
            style: TextStyle(
              color: WaveletColors.textPrimary(context),
              fontFamily: 'Nunito',
              fontSize: 32,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 21,),
          

          Container(
            width: 342,
            child: Text(
              "Pair your smart speaker and unlock numerous features.",
              style: TextStyle(
                color: WaveletColors.textSecondary(context),
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center
            ),
          ),

          SizedBox(height: 40,),

          //start pairing button

    
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => InitialPairPermissions(toggleTheme: () {})));//change later<<
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: WaveletColors.primaryButton(context),
                      foregroundColor: WaveletColors.primaryButtonText(context),
                      minimumSize: Size(294, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    label: Text("Start Pairing"),
                    icon: Icon(Icons.bluetooth),
                  ),
                ),
              ),

          SizedBox(height: 16,),

          Text(
            "Skip for now",
            style: TextStyle(
              color: WaveletColors.destructiveButton(context),
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        

        ], //end of column
      ),
    );
  }
}
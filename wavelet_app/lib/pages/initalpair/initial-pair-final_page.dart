import 'package:Wavelet/pages/home_page.dart';
import 'package:Wavelet/theme/colors.dart';
import 'package:flutter/material.dart';

class FinishedPairPage extends StatelessWidget {
FinishedPairPage({
    
    super.key,
    required this.userDeviceName,
    required this.toggleTheme
    
    });

    String userDeviceName;
    final VoidCallback toggleTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WaveletColors.background(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            Container(
              width: 96,
              height: 96,
              decoration: ShapeDecoration(
                  color: const Color(0x2179BC91),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.60,
                          color: WaveletColors.success(context) /* Color-System-Status-Success */,
                      ),
                      borderRadius: BorderRadius.circular(26843500),
                  ),
                  shadows: [
                      BoxShadow(
                          color: Color(0x444ADE80),
                          blurRadius: 40,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                      )
                  ],
              ),
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Container(
                          width: 44,
                          height: 44,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Icon(Icons.check, size: 44, color: Color(0xFF4ADE80),),
                      ),
                  ],
              ),
          ),
            
            SizedBox(height: 32,),
            
            Text(
              "You're all set!",
              style: TextStyle(
                color: WaveletColors.textSecondary(context),
                fontFamily: 'Nunito',
                fontSize: 24,
                fontWeight: FontWeight.w700
              ),
            ),
        
            SizedBox(height: 8,),
        
        
          Padding(
            padding: const EdgeInsets.only(left: 66, right: 66),
            child: Text(
              "Your $userDeviceName is connected and ready to play",
              style: TextStyle(
                color: WaveletColors.textSecondary(context),
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
        
            SizedBox(height: 32,),
        
            //continue btn
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage(toggleTheme: () {
                        
                      },)));
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: WaveletColors.primaryButton(context),
                      foregroundColor: WaveletColors.primaryButtonText(context),
                      minimumSize: Size(294, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    label: Text("Go to home"),
                    icon: Icon(Icons.home),
                  ),
                ),
              ),
        
        
        
          ], //end of column
        ),
      )
    );
  }
}
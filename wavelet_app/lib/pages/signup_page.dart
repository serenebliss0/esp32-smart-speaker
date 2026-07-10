import 'package:Wavelet/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:Wavelet/theme/colors.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.toggleTheme});

  @override
  State<SignupPage> createState() => _SignupPageState();
  final VoidCallback toggleTheme; // add this
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WaveletColors.background(context),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //wavelet logo
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(146, 62, 146, 41),
              child: Container(
                child: Image.asset(
                  'assets/images/wavelet_logo.png',
                  width: 138,
                  height: 48,
                ),
              ),
            ),
          ),
            //SizedBox(height: 81),

            //text header
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left:35),
              child: Text(
                "Create an account",
                style: TextStyle(
                  color: WaveletColors.textPrimary(context),
                  fontFamily: 'Nunito',
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
                ),
            )
            ),
        
        //text header
            Container(
              width: 308,
              height: 24,
              child: Padding(
              padding: const EdgeInsets.only(left:35),
                child: Text(
                  "Join wavelet to manage your speakers",
                  style: TextStyle(
                    color: WaveletColors.textSecondary(context),
                    fontFamily: 'Nunito',
                    fontSize: 16,
                  fontWeight: FontWeight.w800,
                  ),
                  ),
              ),
            ),


          //username
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(44, 48, 44, 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Your name",
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
        
        //email
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(44, 0, 44, 0.8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Email address",
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
        
        //password
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(44, 16, 44, 0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
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
        
        //forgot password
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(44, 14, 44, 20),
                child: Text(
                  "By creating an account you agree to the Terms of Service and Privacy Policy.",
                  style: TextStyle(
                    color: WaveletColors.secondaryButtonText(context),
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
        
          //signup button
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {}, //change later<<
                  style: ElevatedButton.styleFrom(
                    backgroundColor: WaveletColors.primaryButton(context),
                    foregroundColor: WaveletColors.primaryButtonText(context),
                    minimumSize: Size(294, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text("Create account"),
                ),
              ),
            ),
        
        //line divider
          Padding(
            padding: const EdgeInsets.only(top: 31.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 113,
                  child: Divider(color: WaveletColors.divider(context)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "or continue with",
                    style: TextStyle(
                      color: WaveletColors.textDisabled(context),
                      fontFamily: 'Inter',
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(
                  width: 113,
                  child: Divider(color: WaveletColors.divider(context)),
                ),
              ],
            ),
          ),
        
        //other signin options
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //google
                    ElevatedButton.icon(
                    onPressed: () {}, //change later<<
            
                    icon: Image.asset('assets/images/google.png', width: 24, height: 24,),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: WaveletColors.secondaryButton(context),
                      foregroundColor: WaveletColors.secondaryButtonText(context),
                      minimumSize: Size(165, 53.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
            
                    ),
                    label: Text("Google"),
                  ),
                  SizedBox(width: 12,),
                  //apple
                    ElevatedButton.icon(
                    onPressed: () {}, //change later<<
            
                    icon: Image.asset('assets/images/apple.png', width: 24, height: 24,),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: WaveletColors.secondaryButton(context),
                      foregroundColor: WaveletColors.secondaryButtonText(context),
                      minimumSize: Size(165, 53.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
            
                    ),
                    label: Text("Apple"),
                  ),
            
            
              ],
            ),
          ),
        
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height:136.4),
          
              Text(
              "Already have an account? ",
              style: TextStyle(
                color: WaveletColors.textSecondary(context),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
              )
          ),
          
          SizedBox(width: 23.66,),
          
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage(toggleTheme: () {
                
              },) ));
            },
            child: Text(
                "Log In",
                style: TextStyle(
                  color: WaveletColors.primaryButton(context),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                )
            ),
          )
          
          
            ],
          ),
        
        
          ], //end of column
        ),
      )

    );
  }
}
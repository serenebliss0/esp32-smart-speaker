import 'package:Wavelet/pages/initalpair/initial-pair-final_page.dart';
import 'package:Wavelet/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:Wavelet/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.toggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
  final VoidCallback toggleTheme; // add this
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WaveletColors.background(context),

      body: Column(
        children: [

        ElevatedButton(onPressed: widget.toggleTheme, child: Icon(Icons.dark_mode)),

        FloatingActionButton(onPressed: (){
          Navigator.pop(context);
          Navigator.push(
            context,
          MaterialPageRoute(builder: (_) => LoginPage(toggleTheme: () {
            
          },)),
);
        }),

        SizedBox(height: 200),

                FloatingActionButton(onPressed: (){
          Navigator.pop(context);
          Navigator.push(
            context,
          MaterialPageRoute(builder: (_) => FinishedPairPage(toggleTheme: () {
            
          },
          userDeviceName: "Wavelet Test",

          )
          ),
);
        }),

        ],
        // alignment: Alignment.center,

      ),

bottomNavigationBar: NavigationBar(
    //selectedIndex: currentIndex,
    onDestinationSelected: (index) {
      //setState(() => currentIndex = index);
    },
    destinations: const [
      NavigationDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: 'Home',
      ),
      NavigationDestination(
        icon: Icon(Icons.speaker_outlined),
        selectedIcon: Icon(Icons.speaker),
        label: 'Devices',
      ),
      NavigationDestination(
        icon: Icon(Icons.settings_outlined),
        selectedIcon: Icon(Icons.settings),
        label: 'Settings',
      ),
    ],
  ),


    );
  }
}
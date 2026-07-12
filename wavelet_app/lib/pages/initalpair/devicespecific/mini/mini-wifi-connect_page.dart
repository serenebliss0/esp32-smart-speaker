import 'package:Wavelet/pages/initalpair/devicespecific/max/max-speaker-code_page.dart';
import 'package:Wavelet/pages/initalpair/devicespecific/mini/mini-qrcode-scan_page.dart';
import 'package:Wavelet/util/five_step_navigation.dart';
import 'package:flutter/material.dart';
import 'package:Wavelet/theme/colors.dart';
import 'package:wifi_scan/wifi_scan.dart';
import 'package:wifi_iot/wifi_iot.dart';


class MiniWifiPage extends StatefulWidget {
  MiniWifiPage({
    super.key, 
    required this.toggleTheme, 
    required this.deviceName,
    required this.pageStep,
    });

  final VoidCallback toggleTheme;
  String deviceName;
  int pageStep;


  @override
  State<MiniWifiPage> createState() => _MiniWifiPageState();


}

class _MiniWifiPageState extends State<MiniWifiPage> {
  bool networkSelected = false;
  String? selectedSSID;
  String password = "";
  List<WiFiAccessPoint> networks = [];
  bool isScanning = false;
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    scanNetworks();
    // button activates when password is typed
    _passwordController.addListener(() {
      setState(() => password = _passwordController.text);
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> scanNetworks() async {
    setState(() => isScanning = true);
    await WiFiScan.instance.startScan();
    final results = await WiFiScan.instance.getScannedResults();
    setState(() {
      networks = results;
      isScanning = false;
    });
  }

  // convert signal strength to label
  String signalLabel(int? level) {
    if (level == null) return "Fair";
    if (level >= -60) return "Strong";
    if (level >= -75) return "Good";
    return "Fair";
  }

  Color signalColor(String label) {
    if (label == "Strong") return WaveletColors.success(context);
    if (label == "Good")   return WaveletColors.warning(context);
    return WaveletColors.error(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: WaveletColors.background(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 69, bottom: 4),
            child: Text(
              'Connect to Wi-Fi',
              style: TextStyle(
                color: WaveletColors.textPrimary(context),
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter'
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 40, top: 0, bottom: 27),
            child: Text(
              'Choose your network',
              style: TextStyle(
                color: WaveletColors.textSecondary(context),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter'
              ),
            ),
          ),

          //fill with wifi network cards
Expanded(
  child: isScanning
    ? Center(
        child: CircularProgressIndicator(
          color: WaveletColors.primary(context),
        ),
      )
    : ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24),
        itemCount: networks.length,
        separatorBuilder: (_, __) => SizedBox(height: 10),
        itemBuilder: (context, index) {
          final network = networks[index];
          final ssid = network.ssid;
          final label = signalLabel(network.level);
          final isSelected = selectedSSID == ssid;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSSID = ssid;
                networkSelected = true;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: isSelected
                  ? WaveletColors.primary(context).withOpacity(0.15)
                  : WaveletColors.surfaceVariant(context),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected
                    ? WaveletColors.primary(context)
                    : WaveletColors.border(context),
                  width: isSelected ? 1.5 : 0.8,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.wifi,
                    color: isSelected
                      ? WaveletColors.primary(context)
                      : WaveletColors.textSecondary(context),
                    size: 20,
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      ssid,
                      style: TextStyle(
                        color: WaveletColors.textPrimary(context),
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      color: signalColor(label),
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (isSelected) ...[
                    SizedBox(width: 8),
                    Icon(Icons.check_circle,
                      color: WaveletColors.primary(context),
                      size: 18,
                    ),
                  ]
                ],
              ),
            ),
          );
        },
      ),
),

                  //wifi password
          if (networkSelected)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),

              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Wi-Fi Password",
                  filled: true,
                  fillColor: WaveletColors.surfaceVariant(context),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),

                  
                  hintStyle: TextStyle(
                    color: WaveletColors.textDisabled(context),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),


        SizedBox(height: networkSelected ? 335 : 214.4 ),

        Center(child: FiveStepNavigation(position: 4)),

//continue button
Padding(
  padding: const EdgeInsets.fromLTRB(40, 16, 40, 24),
  child: ElevatedButton(
    onPressed: networkSelected && password.isNotEmpty
      ? () {

          // send to speaker over BLE next
          
          Navigator.push(context, MaterialPageRoute(
            //changes for each model
            builder: (_) => MiniQrScanPage(
              toggleTheme: widget.toggleTheme,
              //ssid: selectedSSID!,
              //password: password,
              pageStep: 4,
            ),
          ));
        }
      : null, // null disables the button automatically
    style: ElevatedButton.styleFrom(
      backgroundColor: WaveletColors.primaryButton(context),
      foregroundColor: WaveletColors.primaryButtonText(context),
      disabledBackgroundColor: WaveletColors.disabledButton(context),
      disabledForegroundColor: WaveletColors.disabledButtonText(context),
      minimumSize: Size(double.infinity, 52),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    child: Text("Continue"),
  ),
),


        ], //end of column
      ),
    );
  }
}
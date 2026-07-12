import 'package:Wavelet/util/five_step_navigation.dart';
import 'package:flutter/material.dart';
import 'package:Wavelet/theme/colors.dart';
import 'package:mobile_scanner/mobile_scanner.dart';


class MiniQrScanPage extends StatefulWidget {
  MiniQrScanPage({
    super.key, 
    required this.toggleTheme,
    required this.pageStep,
    //required this.ssid,
    //required this.password
    
    });

  final VoidCallback toggleTheme;
  int pageStep;
  String ssid = "";
  String password = "";

  @override
  State<MiniQrScanPage> createState() => _MiniQrScanPageState();
}

class _MiniQrScanPageState extends State<MiniQrScanPage> {
  
  bool _handled = false;

  void _handleQr(String raw) {
    debugPrint('Scanned: $raw');

    final uri = Uri.tryParse(raw);

    if (uri == null || uri.scheme != 'wavelet') {
      _showError('Not a Wavelet QR code');
      return;
    }

    final model = uri.queryParameters['model'];
    final id    = uri.queryParameters['id'];
    final token = uri.queryParameters['token'];
    final color = uri.queryParameters['color'];

    debugPrint('Model: $model');
    debugPrint('ID: $id');
    debugPrint('Token: $token');
    debugPrint('Color: $color');

    // TODO: Start BLE scan and connect to this device

    Navigator.pop(context, {
      'model': model,
      'id': id,
      'token': token,
      'color': color,
    });
  }

  void _showError(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );

    setState(() {
      _handled = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WaveletColors.background(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            //header
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 77),
              child: Container(
                // width: 350,
                // height: 122.60,
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Container(
                            width: double.infinity,
                            child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 8,
                                children: [
                                    Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                        decoration: ShapeDecoration(
                                            color: const Color(0x2138BDF8),
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 0.80,
                                                    color: const Color(0x4438BDF8),
                                                ),
                                                borderRadius: BorderRadius.circular(26843500),
                                            ),
                                        ),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                Text(
                                                    'MINI',
                                                    style: TextStyle(
                                                        color: const Color(0xFF38BDF8),
                                                        fontSize: 10,
                                                        fontFamily: 'Inter',
                                                        fontWeight: FontWeight.w700,
                                                        height: 1.50,
                                                        letterSpacing: 0.50,
                                                    ),
                                                ),
                                            ],
                                        ),
                                    ),
                                    Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Text(
                                                'Mini only',
                                                style: TextStyle(
                                                    color: WaveletColors.textSecondary(context) /* Color-System-Text-Secondary-Text */,
                                                    fontSize: 12,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.33,
                                                ),
                                            ),
                                        ],
                                    ),
                                ],
                            ),
                        ),
                        Container(
                            // width: 350,
                            // height: 36,
                            padding: const EdgeInsets.only(top: 4),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                        'Scan QR code',
                                        style: TextStyle(
                                            color: WaveletColors.textPrimary(context) /* Color-System-Text-Primary-Text */,
                                            fontSize: 24,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w700,
                                            height: 1.33,
                                        ),
                                    ),
                                ],
                            ),
                        ),
                        Container(
                            // width: 350,
                            padding: const EdgeInsets.only(top: 6),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    SizedBox(
                                        width: 350,
                                        child: Text(
                                            'Find the QR code on the bottom of your Wavelet Mini and point your camera at it.',
                                            style: TextStyle(
                                                color: WaveletColors.textSecondary(context) /* Color-System-Text-Secondary-Text */,
                                                fontSize: 14,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w400,
                                                height: 1.43,
                                            ),
                                        ),
                                    ),
                                ],
                            ),
                        ),
                    ],
                ),
                      ),
            ),
        
          SizedBox(height: 130,),
        
          //qr code box
          Center(
            child: SizedBox(
              width: 240,
              height: 240,
              child: MobileScanner(
                onDetect: (capture){
                  if (_handled) return;
              
                  final barcode = capture.barcodes.first;
                  final raw = barcode.rawValue;
              
                  if (raw == null) return;
              
                  _handled = true;
                  _handleQr(raw);
                },
              ),
            ),
          ),
        
          SizedBox(height: 201,),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: FiveStepNavigation(position: 4),
            ),
          ),
        
          Center(
            child: Container(
              width: 350 ,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  'Having trouble? Make sure the QR code is well-lit and in frame.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: WaveletColors.textSecondary(context) /* Color-System-Text-Secondary-Text */,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.33,
                  ),
                  ),
              ),
            ),
          ),
        
        //manual code btn
        //might remove later
            Center(
              child: Container(
                width: 350,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                decoration: ShapeDecoration(
                    color: WaveletColors.secondaryButton(context) /* Color-System-Buttons-Secondary-Button */,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 0.80,
                            color: WaveletColors.border(context)/* Color-System-UI-Border */,
                        ),
                        borderRadius: BorderRadius.circular(16),
                    ),
                ),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [
                        Text(
                            'Enter code manually',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: WaveletColors.secondaryButtonText(context) /* Color-System-Buttons-Secondary-Button-Text */,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 1.43,
                            ),
                        ),
                    ],
                ),
                      ),
            ),
        
          
          ], //end of column
        ),
      ) ,
    );
  }
}

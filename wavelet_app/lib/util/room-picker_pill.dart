import 'package:Wavelet/theme/colors.dart';
import 'package:flutter/material.dart';

class ButtonPill extends StatefulWidget {
  ButtonPill({
    super.key,
    required this.itemName
    
    });

    String itemName = "";

    bool selected = false;


  @override
  State<ButtonPill> createState() => _ButtonPillState();
}

class _ButtonPillState extends State<ButtonPill> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){setState(() => widget.selected = true);}, 
    child: 
      Padding(
        padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
        child: Text(
          widget.itemName,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      style: ButtonStyle(
        backgroundColor: widget.selected ? WidgetStatePropertyAll(WaveletColors.primaryButton(context)) : WidgetStatePropertyAll(WaveletColors.surface(context)),
        side: WidgetStatePropertyAll(BorderSide(
          color: widget.selected ? WaveletColors.border(context) : WaveletColors.primaryButtonText(context),
          width: 14,
        ))
      ),
      
    );
  }
}
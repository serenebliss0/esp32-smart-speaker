import 'package:flutter/material.dart';
import 'package:Wavelet/theme/colors.dart';

class PermissionCard extends StatelessWidget {
  final bool permissionState;
  final String permissionName;
  final String permissionDescription;
  final IconData icon;
  final VoidCallback onAllow;

  const PermissionCard({
    super.key,
    required this.permissionState,
    required this.permissionName,
    required this.permissionDescription,
    required this.icon,
    required this.onAllow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: ShapeDecoration(
        color: WaveletColors.surfaceVariant(context),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.80, color: WaveletColors.border(context)),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // icon container
              Container(
                width: 44,
                height: 44,
                decoration: ShapeDecoration(
                  color: WaveletColors.accent(context),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Icon(icon, color: WaveletColors.textPrimary(context), size: 22),
              ),

              // title + description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      permissionName,
                      style: TextStyle(
                        color: WaveletColors.textPrimary(context),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      permissionDescription,
                      style: TextStyle(
                        color: WaveletColors.textSecondary(context),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // allow button — only shows if not granted
          if (!permissionState)
            ElevatedButton(
              onPressed: onAllow,
              style: ElevatedButton.styleFrom(
                backgroundColor: WaveletColors.primaryButton(context),
                foregroundColor: WaveletColors.primaryButtonText(context),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                "Allow $permissionName",
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),

          // granted state
          if (permissionState)
            ElevatedButton(
              onPressed: onAllow,
              style: ElevatedButton.styleFrom(
                backgroundColor: WaveletColors.success(context),
                foregroundColor: WaveletColors.primaryButtonText(context),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                "Permission Granted",
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
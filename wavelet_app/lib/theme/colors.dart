import 'package:flutter/material.dart';

  // ── Dark Mode ─────────────────────────────────────────────────────────────
  class Dark {
    // Backgrounds>>
    static const background     = Color(0xFF0D0A12); 
    static const surface        = Color(0xFF171220); 
    static const surfaceVariant = Color(0xFF211A2D); 

    // Brand>>
    static const primary        = Color(0xFFF9A8D4); 
    static const accent         = Color(0xFFC084B0);

    // Text>>
    static const textPrimary    = Color(0xFFFAF1F9); 
    static const textSecondary  = Color(0xFFC084B0); 
    static const textDisabled   = Color(0xFF6B5570); 

    // UI>>
    static const border         = Color(0xFF2D1F3A); 
    static const divider        = Color(0xFF3D2B4D); 

    // Status>>
    static const success        = Color(0xFF4ADE80);
    static const warning        = Color(0xFFFACC15);
    static const error          = Color(0xFFFF8888); 
    static const info           = Color(0xFF38BDF8);

      //Buttons >>
    static const primaryButton = Color(0xFFFF4D6D);
    static const primaryButtonText = Color(0xFFFAF1F9);
    static const secondaryButton = Color(0xFF211A2D);
    static const secondaryButtonText = Color(0xFFFF4D6D);
    static const disabledButton = Color(0xFF2D1F3A);
    static const disabledButtonText = Color(0xFF6B5570);
    static const destructiveButton = Color(0xFFFF8888);
    static const destructiveButtonText = Color(0xFF1A0A1A);

  }

  // ── Light Mode ────────────────────────────────────────────────────────────
  class Light {
    // Backgrounds >>
    static const background     = Color(0xFFFAF1F9); 
    static const surface        = Color(0xFFFFFFFF);
    static const surfaceVariant = Color(0xFFFFDEF2); 

    // Brand>>
    static const primary        = Color(0xFFC084B0); 
    static const accent         = Color(0xFFF9A8D4); 

    // Text>>
    static const textPrimary    = Color(0xFF1A0A1A); 
    static const textSecondary  = Color(0xFF6B3A6B);
    static const textDisabled   = Color(0xFFC4A8C4); 

    // UI >>
    static const border         = Color(0xFFFDB6E1); 
    static const divider        = Color(0xFFFFD6EE); 

    // Status>>
    static const success        = Color(0xFF16A34A);
    static const warning        = Color(0xFFD97706);
    static const error          = Color(0xFFDC2626);
    static const info           = Color(0xFF0284C7);

  //Buttons >>
    static const primaryButton = Color(0xFFFF4D6D);
    static const primaryButtonText = Color(0xFFFFFFFF);
    static const secondaryButton = Color(0xFFFFDEF2);
    static const secondaryButtonText = Color(0xFFFF4D6D);
    static const disabledButton = Color(0xFFFDB6E1);
    static const disabledButtonText = Color(0xFFC4A8C4);
    static const destructiveButton = Color(0xFFDC2626);
    static const destructiveButtonText = Color(0xFFFFFFFF);

  }

class WaveletColors {

  // ── Backgrounds ───────────────────────────────────────────────────────────
  static Color background(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.background : Light.background;
  }

  static Color surface(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.surface : Light.surface;
  }

  static Color surfaceVariant(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.surfaceVariant : Light.surfaceVariant;
  }

  // ── Brand ─────────────────────────────────────────────────────────────────
  static Color primary(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.primary : Light.primary;
  }

  static Color accent(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.accent : Light.accent;
  }

  // ── Text ──────────────────────────────────────────────────────────────────
  static Color textPrimary(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.textPrimary : Light.textPrimary;
  }

  static Color textSecondary(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.textSecondary : Light.textSecondary;
  }

  static Color textDisabled(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.textDisabled : Light.textDisabled;
  }

  // ── UI ────────────────────────────────────────────────────────────────────
  static Color border(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.border : Light.border;
  }

  static Color divider(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.divider : Light.divider;
  }

  // ── Status ────────────────────────────────────────────────────────────────
  static Color success(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.success : Light.success;
  }

  static Color warning(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.warning : Light.warning;
  }

  static Color error(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.error : Light.error;
  }

  static Color info(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.info : Light.info;
  }

  // ── Buttons ───────────────────────────────────────────────────────────────
  static Color primaryButton(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.primaryButton : Light.primaryButton;
  }

  static Color primaryButtonText(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.primaryButtonText : Light.primaryButtonText;
  }

  static Color secondaryButton(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.secondaryButton : Light.secondaryButton;
  }

  static Color secondaryButtonText(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.secondaryButtonText : Light.secondaryButtonText;
  }

  static Color disabledButton(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.disabledButton : Light.disabledButton;
  }

  static Color disabledButtonText(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.disabledButtonText : Light.disabledButtonText;
  }

  static Color destructiveButton(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.destructiveButton : Light.destructiveButton;
  }

  static Color destructiveButtonText(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Dark.destructiveButtonText : Light.destructiveButtonText;
  }
}
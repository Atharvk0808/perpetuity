import 'dart:math' as math;
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool filled;
  final double? width;
  final double? height;
  final BorderRadiusGeometry borderRadius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final double elevation;

  const ButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
    this.filled = true,
    this.width,
    this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.prefixIcon,
    this.suffixIcon,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.elevation = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final double w = screen.width;
    final double h = screen.height;

    // 🔹 Responsive adjustments
    final double buttonWidth = (width ?? (w * 0.85)).clamp(200, 420);
    final double buttonHeight = (height ?? (h * 0.07)).clamp(48, 65);
    final double fontSize = (w * 0.05).clamp(16, 24);
    final double iconSize = (w * 0.07).clamp(20, 30);
    final double spacing = (w * 0.02).clamp(6, 12);

    final Color defaultGreen = const Color(0xFF1B7A3A);
    final bg = backgroundColor ?? defaultGreen;
    final txt = textColor ?? (filled ? Colors.white : bg);

    final content = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (prefixIcon != null)
          Padding(
            padding: EdgeInsets.only(right: spacing),
            child: IconTheme(
              data: IconThemeData(color: txt, size: iconSize),
              child: prefixIcon!,
            ),
          ),
        Flexible(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: txt,
              fontWeight: FontWeight.w600,
              fontSize: fontSize,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (suffixIcon != null)
          Padding(
            padding: EdgeInsets.only(left: spacing),
            child: IconTheme(
              data: IconThemeData(color: txt, size: iconSize),
              child: suffixIcon!,
            ),
          ),
      ],
    );

    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: filled
          ? ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          elevation: elevation,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          padding: padding ??
              EdgeInsets.symmetric(
                horizontal: math.min(w * 0.05, 24),
                vertical: 0,
              ),
        ),
        child: content,
      )
          : OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: bg, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          backgroundColor: Colors.white,
          padding: padding ??
              EdgeInsets.symmetric(
                horizontal: math.min(w * 0.05, 24),
                vertical: 0,
              ),
        ),
        child: content,
      ),
    );
  }
}

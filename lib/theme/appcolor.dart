import 'package:flutter/material.dart';

class AppColor extends ThemeExtension<AppColor> {
  final Color greenShade;
  final Color white;
  final Color black;
  final Color background;
  final Color card;

  const AppColor({
    required this.greenShade,
    required this.white,
    required this.black,
    required this.background,
    required this.card,
  });

  @override
  AppColor copyWith({
    Color? greenShade,
    Color? white,
    Color? black,
    Color? background,
    Color? card,
  }) {
    return AppColor(
      greenShade: greenShade ?? this.greenShade,
      white: white ?? this.white,
      black: black ?? this.black,
      background: background ?? this.background,
      card: card ?? this.card,
    );
  }

  @override
  AppColor lerp(ThemeExtension<AppColor>? other, double t) {
    if (other is! AppColor) return this;

    return AppColor(
      greenShade: Color.lerp(greenShade, other.greenShade, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      background: Color.lerp(background, other.background, t)!,
      card: Color.lerp(card, other.card, t)!,
    );
  }
}



// import 'package:flutter/material.dart';
//
// class AppColor {
//   static const Color green_shade = Color(0xFFB9E5C4);
//   static const Color white = Colors.white;
//   static const Color black = Colors.black;
//
// }
//
// // import 'package:flutter/material.dart';
// //
// // class AppColor extends ThemeExtension<AppColor> {
// //   final Color greenShade;
// //   final Color white;
// //   final Color black;
// //   final Color background;
// //   final Color card;
// //
// //   const AppColor({
// //     required this.greenShade,
// //     required this.white,
// //     required this.black,
// //     required this.background,
// //     required this.card,
// //   });
// //
// //   @override
// //   AppColor copyWith({
// //     Color? greenShade,
// //     Color? white,
// //     Color? black,
// //     Color? background,
// //     Color? card,
// //   }) {
// //     return AppColor(
// //       greenShade: greenShade ?? this.greenShade,
// //       white: white ?? this.white,
// //       black: black ?? this.black,
// //       background: background ?? this.background,
// //       card: card ?? this.card,
// //     );
// //   }
// //
// //   @override
// //   AppColor lerp(ThemeExtension<AppColor>? other, double t) {
// //     if (other is! AppColor) return this;
// //     return AppColor(
// //       greenShade: Color.lerp(greenShade, other.greenShade, t)!,
// //       white: Color.lerp(white, other.white, t)!,
// //       black: Color.lerp(black, other.black, t)!,
// //       background: Color.lerp(background, other.background, t)!,
// //       card: Color.lerp(card, other.card, t)!,
// //     );
// //   }
// //
// //   // Light theme
// //   static const light = AppColor(
// //     greenShade: Color(0xFFB9E5C4),
// //     white: Colors.white,
// //     black: Colors.black,
// //     background: Colors.white,
// //     card: Color(0xfff1f1f1),
// //   );
// //
// //   // Dark theme
// //   static const dark = AppColor(
// //     greenShade: Color(0xFF4CAF50),
// //     white: Colors.black,
// //     black: Colors.white,
// //     background: Color(0xFF0E0E0E),
// //     card: Color(0xFF1E1E1E),
// //   );
// // }

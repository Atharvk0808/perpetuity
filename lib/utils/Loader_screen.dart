import 'dart:ui';
import 'package:flutter/material.dart';

showLoader(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.4),
    builder: (_) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              'assets/Loader_1.gif',
              width: 120,
              height: 120,
            ),
          ),
        ),
      );
    },
  );
}

hideLoader(BuildContext context) {
  Navigator.pop(context);
}



// import 'package:flutter/material.dart';
//
// showLoader(BuildContext context) {
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     barrierColor: Colors.black.withOpacity(0.2),
//     builder: (_) {
//       return Center(
//         child: Image.asset(
//           //'assets/Loader.png',
//           'assets/Loader_1.gif',
//           width: 150,
//           height: 150,
//         ),
//       );
//     },
//   );
// }
//
// hideLoader(BuildContext context) {
//   Navigator.pop(context);
// }


/// asdfawrfaq
//import 'package:flutter/material.dart';
//
// class AppColor extends ThemeExtension<AppColor> {
//   final Color green_shade;
//   final Color white;
//   final Color black;
//   final Color background;
//   final Color card;
//
//   const AppColor({
//     required this.green_shade,
//     required this.white,
//     required this.black,
//     required this.background,
//     required this.card,
//   });
//
//   @override
//   AppColor copyWith({
//     Color? green_shade,
//     Color? white,
//     Color? black,
//     Color? background,
//     Color? card,
//   }) {
//     return AppColor(
//       green_shade: green_shade ?? this.green_shade,
//       white: white ?? this.white,
//       black: black ?? this.black,
//       background: background ?? this.background,
//       card: card ?? this.card,
//     );
//   }
//
//   @override
//   AppColor lerp(ThemeExtension<AppColor>? other, double t) {
//     if (other is! AppColor) return this;
//     return AppColor(
//       green_shade: Color.lerp(green_shade, other.green_shade, t)!,
//       white: Color.lerp(white, other.white, t)!,
//       black: Color.lerp(black, other.black, t)!,
//       background: Color.lerp(background, other.background, t)!,
//       card: Color.lerp(card, other.card, t)!,
//     );
//   }
//
//   // Light theme
//   static const light = AppColor(
//     green_shade: Color(0xFFB9E5C4),
//     white: Colors.white,
//     black: Colors.black,
//     background: Colors.white,
//     card: Color(0xfff1f1f1),
//   );
//
//   // Dark theme
//   static const dark = AppColor(
//     green_shade: Color(0xFF4CAF50),
//     white: Colors.black,
//     black: Colors.white,
//     background: Color(0xFF0E0E0E),
//     card: Color(0xFF1E1E1E),
//   );
// }


// class appColor {
//   appColor._();
//
//   Static const  green_shade= Color(0xFFB9E5C4);
//   Static const  white=Color(0xffffffff);
//   Static const  black=Color(0xfffffff);
//   Static const   background=Color(0xFF0E0E0E);
//   Static const or card=Color(0xFF1E1E1E);
// }
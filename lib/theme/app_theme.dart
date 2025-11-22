import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'appcolor.dart';

enum AppTheme { light, dark }

ValueNotifier<AppTheme> appTheme = ValueNotifier(AppTheme.light);

extension ThemeDataExtension on AppTheme {
  ThemeData get themeData {
    switch (this) {
      case AppTheme.light:
        return ThemeData.light().copyWith(
          brightness: Brightness.light,


          extensions: const [
            AppColor(
              greenShade: Color(0xFFB9E5C4),
              white: Colors.white,
              black: Colors.black,
              background: Color(0xFFFFFDF5),
              card: Color(0xFFE8F5E9),
            ),
          ],

          // MAIN COLORS
          scaffoldBackgroundColor: Colors.white,
          cardColor: Colors.green[100],
          primaryColor: Colors.green,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),

          // TEXTS
          textTheme: GoogleFonts.poppinsTextTheme().copyWith(
            bodyMedium: const TextStyle(color: Colors.black),
            bodyLarge: const TextStyle(color: Colors.black),
            titleLarge: const TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),

          // ICONS
          iconTheme: const IconThemeData(color: Colors.black),

          //APPBAR
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),

          // INPUT FIELDS
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            hintStyle: const TextStyle(color: Colors.grey),
            labelStyle: const TextStyle(color: Colors.black),
          ),

          //BUTTONS
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          // BOTTOM NAV
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.black54,
          ),
        );

    // ---------------------- DARK THEME ----------------------
      case AppTheme.dark:
        return ThemeData.dark().copyWith(
          brightness: Brightness.dark,

          extensions: const [
            AppColor(
              greenShade: Color(0xFF4CAF50),
              white: Colors.black,
              black: Colors.white,
              background: Color(0xFF121212),
              card: Color(0xFFE8F5E9),
              //card: Colors.green[400],
            ),
          ],

          // MAIN COLORS
          scaffoldBackgroundColor: const Color(0xFF121212),
          cardColor: const Color(0xFF1E1E1E),

          primaryColor: Colors.green,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            brightness: Brightness.dark,
          ),

          // TEXTS
          textTheme: GoogleFonts.poppinsTextTheme().copyWith(
            bodyMedium: const TextStyle(color: Colors.white),
            bodyLarge: const TextStyle(color: Colors.white),
            titleLarge: const TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),

          //ICON
          iconTheme: const IconThemeData(color: Colors.white),

          // APPBAR
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF1E1E1E),
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),

          // INPUT FIELDS
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: const Color(0xFF222222),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            hintStyle: const TextStyle(color: Colors.white70),
            labelStyle: const TextStyle(color: Colors.white),
          ),

          // BUTTONS
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          // BOTTOM NAV
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color(0xFF1E1E1E),
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.white54,
          ),
        );
    }
  }
}


// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// enum AppTheme { light, dark }
//
// ValueNotifier<AppTheme> appTheme = ValueNotifier(AppTheme.light);
//
// extension ThemeDataExtension on AppTheme {
//   ThemeData get themeData {
//     switch (this) {
//       case AppTheme.light:
//         return ThemeData.light().copyWith(
//           brightness: Brightness.light,
//
//           // MAIN COLORS
//           scaffoldBackgroundColor: Colors.white,
//           cardColor: Colors.green[100],
//           primaryColor: Colors.green,
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
//
//           // TEXTS
//           textTheme: GoogleFonts.poppinsTextTheme().copyWith(
//             bodyMedium: const TextStyle(color: Colors.black87),
//             bodyLarge: const TextStyle(color: Colors.black),
//             titleLarge: const TextStyle(
//               fontSize: 22,
//               color: Colors.black,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//
//           // ICONS
//           iconTheme: const IconThemeData(color: Colors.black),
//
//           // APPBAR
//           appBarTheme: const AppBarTheme(
//             backgroundColor: Colors.white,
//             elevation: 0,
//             iconTheme: IconThemeData(color: Colors.black),
//             titleTextStyle: TextStyle(
//               color: Colors.black,
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//
//           // INPUT FIELDS
//           inputDecorationTheme: InputDecorationTheme(
//             filled: true,
//             fillColor: Colors.white,
//             border: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.grey.shade400),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             hintStyle: const TextStyle(color: Colors.grey),
//             labelStyle: const TextStyle(color: Colors.black),
//           ),
//
//           // BUTTONS
//           elevatedButtonTheme: ElevatedButtonThemeData(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.green,
//               foregroundColor: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//           ),
//
//           // BOTTOM NAV
//           bottomNavigationBarTheme: BottomNavigationBarThemeData(
//             backgroundColor: Colors.white,
//             selectedItemColor: Colors.green,
//             unselectedItemColor: Colors.black54,
//           ),
//         );
//
//       case AppTheme.dark:
//         return ThemeData.dark().copyWith(
//           brightness: Brightness.dark,
//
//           // MAIN COLORS
//           scaffoldBackgroundColor: const Color(0xFF121212),
//           cardColor: const Color(0xFF1E1E1E),
//           primaryColor: Colors.green,
//           colorScheme: ColorScheme.fromSeed(
//             seedColor: Colors.green,
//             brightness: Brightness.dark,
//           ),
//
//           // TEXTS
//           textTheme: GoogleFonts.poppinsTextTheme().copyWith(
//             bodyMedium: const TextStyle(color: Colors.white70),
//             bodyLarge: const TextStyle(color: Colors.white),
//             titleLarge: const TextStyle(
//               fontSize: 22,
//               color: Colors.white,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//
//           // ICONS
//           iconTheme: const IconThemeData(color: Colors.white),
//
//           // APPBAR
//           appBarTheme: const AppBarTheme(
//             backgroundColor: Color(0xFF1E1E1E),
//             elevation: 0,
//             iconTheme: IconThemeData(color: Colors.white),
//             titleTextStyle: TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//
//           // INPUT FIELDS
//           inputDecorationTheme: InputDecorationTheme(
//             filled: true,
//             fillColor: const Color(0xFF222222),
//             border: OutlineInputBorder(
//               borderSide: const BorderSide(color: Colors.white),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             hintStyle: const TextStyle(color: Colors.white70),
//             labelStyle: const TextStyle(color: Colors.white),
//           ),
//
//           // BUTTONS
//           elevatedButtonTheme: ElevatedButtonThemeData(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.green,
//               foregroundColor: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//           ),
//
//           // BOTTOM NAV
//           bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//             backgroundColor: Color(0xFF1E1E1E),
//             selectedItemColor: Colors.green,
//             unselectedItemColor: Colors.white54,
//           ),
//         );
//     }
//   }
// }

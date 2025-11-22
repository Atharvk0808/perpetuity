import 'package:flutter/material.dart';
import 'Screen/splash_screen.dart';
import 'Screen/second_screen.dart';
import '../theme/app_theme.dart';
import '../theme/theme_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // LOAD SAVED THEME
  bool isDark = await ThemePref.loadTheme();
  appTheme.value = isDark ? AppTheme.dark : AppTheme.light;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppTheme>(
      valueListenable: appTheme,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'The Perpetuity',
          theme: value.themeData,
          initialRoute: '/splash',
          routes: {
            '/splash': (context) => const SplashScreen(),
            '/second': (context) => const SecondScreen(),
          },
        );
      },
    );
  }
}


// import 'package:flutter/material.dart';
// import 'Screen/splash_screen.dart';
// import 'Screen/second_screen.dart';
// import '../theme/app_theme.dart';
//
// ValueNotifier<bool> isDarkMode = ValueNotifier(false);
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'The Perpetuity',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         fontFamily: 'Poppins',
//       ),
//       initialRoute: '/splash',
//     routes: {
//     '/splash': (context) => const SplashScreen(),
//     '/second': (context) => const SecondScreen(),
//     },
//     );
//   }
// }
//
//

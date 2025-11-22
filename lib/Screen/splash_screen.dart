import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/appcolor.dart';
import 'second_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _topSlideAnimation;
  late Animation<Offset> _bottomSlideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
    );

    _topSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
      ),
    );

    _bottomSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
      ),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 900),
          pageBuilder: (_, animation, __) => const SecondScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return ScaleTransition(
              scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutExpo,
                ),
              ),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColor>()!;

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final circleDiameter = screenWidth * 0.8;
    final imageHeight = screenHeight * 0.28;

    return Scaffold(
      backgroundColor: colors.background,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // 🔹 Top Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SlideTransition(
              position: _topSlideAnimation,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(screenWidth * 0.45),
                  bottomRight: Radius.circular(screenWidth * 0.45),
                ),
                child: Image.asset(
                  'assets/vegetables.png',
                  height: imageHeight,
                  width: screenWidth,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // 🔹 Bottom Image
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SlideTransition(
              position: _bottomSlideAnimation,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(screenWidth * 0.45),
                  topRight: Radius.circular(screenWidth * 0.45),
                ),
                child: Image.asset(
                  'assets/vegetables.png',
                  width: screenWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Center(
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  width: circleDiameter,
                  height: circleDiameter,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "The Perpetuity",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplay(
                      fontWeight: FontWeight.w700,
                      fontSize: screenWidth * 0.085,
                      color: colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'second_screen.dart';
//
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _topSlideAnimation;
//   late Animation<Offset> _bottomSlideAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );
//
//     _scaleAnimation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.elasticInOut,
//     );
//
//     _fadeAnimation = CurvedAnimation(
//       parent: _controller,
//       curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
//     );
//
//     _topSlideAnimation = Tween<Offset>(
//       begin: const Offset(0, -1.0),
//       end: Offset.zero,
//     ).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
//       ),
//     );
//
//     _bottomSlideAnimation = Tween<Offset>(
//       begin: const Offset(0, 1.0),
//       end: Offset.zero,
//     ).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
//       ),
//     );
//
//     _controller.forward();
//
//     Future.delayed(const Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         PageRouteBuilder(
//           transitionDuration: const Duration(milliseconds: 900),
//           pageBuilder: (_, animation, __) => const SecondScreen(),
//           transitionsBuilder: (_, animation, __, child) {
//             // Circular reveal-style effect from center
//             return ScaleTransition(
//               scale: Tween<double>(begin: 0.0, end: 1.0).animate(
//                 CurvedAnimation(
//                   parent: animation,
//                   curve: Curves.easeOutExpo,
//                 ),
//               ),
//               child: FadeTransition(
//                 opacity: animation,
//                 child: child,
//               ),
//             );
//           },
//         ),
//       );
//     });
//
//   }
//
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     // Responsive factors
//     final circleDiameter = screenWidth * 0.8; // 80% of width
//     final topOffset = screenHeight * 0.3; // 30% from top
//     final imageHeight = screenHeight * 0.28; // 28% of screen height
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           // 🔹 Top Image
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: SlideTransition(
//               position: _topSlideAnimation,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(screenWidth * 0.45),
//                   bottomRight: Radius.circular(screenWidth * 0.45),
//                 ),
//                 child: Image.asset(
//                   'assets/vegetables.png',
//                   height: imageHeight,
//                   width: screenWidth,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//
//           // 🔹 Bottom Image
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: SlideTransition(
//               position: _bottomSlideAnimation,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(screenWidth * 0.45),
//                   topRight: Radius.circular(screenWidth * 0.45),
//                 ),
//                 child: Image.asset(
//                   'assets/vegetables.png',
//                   width: screenWidth,
//                   height: imageHeight,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           Center(
//             child: ScaleTransition(
//               scale: _scaleAnimation,
//               child: FadeTransition(
//                 opacity: _fadeAnimation,
//                 child: Container(
//                   width: circleDiameter,
//                   height: circleDiameter,
//                   decoration: const BoxDecoration(
//                     color: Color(0xFF007A2D),
//                     shape: BoxShape.circle,
//                   ),
//                   alignment: Alignment.center,
//                   child: Text(
//                     "The Perpetuity",
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.playfairDisplay(
//                       fontWeight: FontWeight.w700,
//                       fontSize: screenWidth * 0.085,
//                       color: Colors.white,
//                       letterSpacing: 1.5,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }

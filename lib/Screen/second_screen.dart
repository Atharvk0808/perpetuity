import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../widgets/button_widget.dart';
import 'signin1.dart';
import '../theme/appcolor.dart';
import 'sign_up.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final PageController _controller = PageController(viewportFraction: 0.85);
  int _currentPage = 0;

  final List<String> images = [
    'assets/A.png',
    'assets/B.png',
    'assets/C.png',
    'assets/E.png',
    'assets/F.png',
  ];

  @override
  void initState() {
    super.initState();
    _autoScroll();
  }

  void _autoScroll() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      if (_controller.hasClients) {
        _currentPage = (_currentPage + 1) % images.length;
        _controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColor>()!;

    final Size screen = MediaQuery.of(context).size;
    final double w = screen.width;
    final double h = screen.height;
    final bool isPortrait = screen.height > screen.width;

    final double pageViewHeight = math.min(260, h * 0.34);
    final double titleFont = (w * 0.055).clamp(16, 26);
    final double bodyFont = (w * 0.036).clamp(12, 16);
    final double verticalSpacing = (h * 0.02).clamp(8, 40);
    final double buttonWidth = math.min(420, w * 0.8);
    final double sidePadding = math.max(12, w * 0.05);

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: sidePadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: pageViewHeight,
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(images[index], fit: BoxFit.cover),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: verticalSpacing),
                  Text(
                    "Built for Champions. 💪",
                    style: TextStyle(
                      fontSize: titleFont,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Plan, perform, and progress with personalized tournament\nand nutrition tracking tools.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colors.black.withOpacity(0.7),
                      fontSize: bodyFont,
                      height: 1.25,
                    ),
                  ),
                  SizedBox(height: verticalSpacing),
                  SizedBox(
                    width: buttonWidth,
                    child: ButtonWidget(
                      label: "Sign In",
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 1500),
                            pageBuilder: (_, animation, __) => const SignIn1(),
                            transitionsBuilder: (_, animation, __, child) {
                              final rotate = Tween(begin: math.pi, end: 0.0).animate(
                                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
                              );
                              return AnimatedBuilder(
                                animation: rotate,
                                builder: (_, __) {
                                  return Transform(
                                    transform: Matrix4.rotationY(rotate.value),
                                    alignment: Alignment.center,
                                    child: child,
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: buttonWidth,
                    child: ButtonWidget(
                      label: "Sign Up",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
                      },
                      filled: false,
                    ),
                  ),

                  SizedBox(height: isPortrait ? 24 : 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import '../widgets/button_widget.dart';
// import 'signin1.dart';
//
// class SecondScreen extends StatefulWidget {
//   const SecondScreen({super.key});
//
//   @override
//   State<SecondScreen> createState() => _SecondScreenState();
// }
//
// class _SecondScreenState extends State<SecondScreen> {
//   // keep controller as before
//   final PageController _controller = PageController(viewportFraction: 0.85);
//   int _currentPage = 0;
//
//   final List<String> images = [
//     'assets/A.png',
//     'assets/B.png',
//     'assets/C.png',
//     'assets/E.png',
//     'assets/F.png',
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _autoScroll();
//   }
//
//   void _autoScroll() async {
//     while (true) {
//       await Future.delayed(const Duration(seconds: 2));
//       if (_controller.hasClients) {
//         _currentPage = (_currentPage + 1) % images.length;
//         _controller.animateToPage(
//           _currentPage,
//           duration: const Duration(milliseconds: 600),
//           curve: Curves.easeInOut,
//         );
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // MediaQuery values
//     final Size screen = MediaQuery.of(context).size;
//     final double w = screen.width;
//     final double h = screen.height;
//     final bool isPortrait = screen.height > screen.width;
//
//     // Responsive sizes (tweak the multipliers as you like)
//     final double pageViewHeight = math.min(260, h * 0.34); // caps at 260
//     final double titleFont = (w * 0.055).clamp(16, 26); // responsive font
//     final double bodyFont = (w * 0.036).clamp(12, 16);
//     final double verticalSpacing = (h * 0.02).clamp(8, 40);
//     final double buttonWidth = math.min(420, w * 0.8); // caps width for very large screens
//     final double sidePadding = math.max(12, w * 0.05);
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFFFFDF5),
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: sidePadding),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: pageViewHeight,
//                     child: PageView.builder(
//                       controller: _controller,
//                       itemCount: images.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(20),
//                             child: Image.asset(images[index], fit: BoxFit.cover),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   SizedBox(height: verticalSpacing),
//                   Text(
//                     "Built for Champions. 💪",
//                     style: TextStyle(
//                       fontSize: titleFont,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     "Plan, perform, and progress with personalized tournament\nand nutrition tracking tools.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.black54,
//                       fontSize: bodyFont,
//                       height: 1.25,
//                     ),
//                   ),
//                   SizedBox(height: verticalSpacing),
//                   // buttons - wrapped in SizedBox to control width
//                   SizedBox(
//                     width: buttonWidth,
//                     child: ButtonWidget(
//                       label: "Sign In",
//                       //Circular Reveal Animation (from button center)
//                       // onPressed: () {
//                       //   Navigator.push(
//                       //     context,
//                       //     PageRouteBuilder(
//                       //       transitionDuration: const Duration(milliseconds: 600),
//                       //       pageBuilder: (_, animation, __) => const SignIn1(),
//                       //       transitionsBuilder: (_, animation, __, child) {
//                       //         final offsetAnimation = Tween<Offset>(
//                       //           begin: const Offset(1.0, 0.0), // starts from right
//                       //           end: Offset.zero,
//                       //         ).animate(CurvedAnimation(
//                       //           parent: animation,
//                       //           curve: Curves.easeInOut,
//                       //         ));
//                       //         return SlideTransition(position: offsetAnimation, child: child);
//                       //       },
//                       //     ),
//                       //   );
//                       // },
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           PageRouteBuilder(
//                             transitionDuration: const Duration(milliseconds: 1500),
//                             pageBuilder: (_, animation, __) => const SignIn1(),
//                             transitionsBuilder: (_, animation, __, child) {
//                               final rotate = Tween(begin: math.pi, end: 0.0).animate(
//                                 CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
//                               );
//                               return AnimatedBuilder(
//                                 animation: rotate,
//                                 builder: (_, __) {
//                                   final isUnder = (rotate.value < math.pi / 2);
//                                   return Transform(
//                                     transform: Matrix4.rotationY(rotate.value),
//                                     alignment: Alignment.center,
//                                     child: child,
//                                   );
//                                 },
//                               );
//                             },
//                           ),
//                         );
//                       },
//
//                       filled: true,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   SizedBox(
//                     width: buttonWidth,
//                     child: ButtonWidget(
//                       label: "Sign Up",
//                       onPressed: () {},
//                       filled: false,
//                     ),
//                   ),
//                   SizedBox(height: isPortrait ? 24 : 12),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

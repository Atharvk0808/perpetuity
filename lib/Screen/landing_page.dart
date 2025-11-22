import 'package:flutter/material.dart';
import '../theme/appcolor.dart';
import 'home.dart';
import 'account.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> leftAnim;
  late Animation<Offset> rightAnim;
  late Animation<Offset> bottomAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    leftAnim = Tween<Offset>(
      begin: const Offset(-1.2, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    rightAnim = Tween<Offset>(
      begin: const Offset(1.2, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    bottomAnim = Tween<Offset>(
      begin: const Offset(0, 1.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    /// --- GET COLORS FROM THEME ---
    final colors = Theme.of(context).extension<AppColor>()!;

    double width = MediaQuery.of(context).size.width;
    final double availableWidth = width - 65;

    return Scaffold(
      backgroundColor: colors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "The Perpetuity",
                      style: TextStyle(
                        fontSize: width * 0.07,
                        fontWeight: FontWeight.w600,
                        color: colors.black,
                      ),
                    ),
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/landing_1.png'),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Text(
                  "Tools",
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: colors.black,
                  ),
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _customToolCard("Nutrition Snap", Icons.camera_alt, colors),
                    _customToolCard("BMI Calculator", Icons.calculate, colors),
                  ],
                ),

                const SizedBox(height: 25),

                Text(
                  "Services",
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: colors.black,
                  ),
                ),

                const SizedBox(height: 25),

                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SlideTransition(
                          position: leftAnim,
                          child: SizedBox(
                            width: availableWidth / 2,
                            child: Column(
                              children: [
                                _customServiceCard(
                                  context,
                                  "Health Checkup",
                                  "assets/Layer_1.png",
                                  colors,
                                  bigCard: true,
                                ),
                                const SizedBox(height: 10),
                                _customServiceCard(
                                  context,
                                  "Orega Meal",
                                  "assets/Layer_3.png",
                                  colors,
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        SlideTransition(
                          position: rightAnim,
                          child: SizedBox(
                            width: availableWidth / 2,
                            child: Column(
                              children: [
                                _customServiceCard(
                                  context,
                                  "Medical Consultant",
                                  "assets/Layer_2.png",
                                  colors,
                                ),
                                const SizedBox(height: 10),
                                _customServiceCard(
                                  context,
                                  "Fitness Center",
                                  "assets/Layer_4.png",
                                  colors,
                                  bigCard: true,
                                  onTap: () {
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        transitionDuration:
                                        const Duration(milliseconds: 2000),
                                        pageBuilder: (context, animation, _) {
                                          return const HomePage();
                                        },
                                        transitionsBuilder: (context, animation,
                                            _, child) {
                                          return AnimatedBuilder(
                                            animation: animation,
                                            builder: (_, __) {
                                              double radius =
                                                  animation.value * 2000;
                                              return ClipOval(
                                                clipper: _CircularRevealClipper(
                                                    radius),
                                                child: child,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    SlideTransition(
                      position: bottomAnim,
                      child: Container(
                        height: 110,
                        width: availableWidth - 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colors.greenShade,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "Appointement",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Image.asset("assets/Layer_5.png",
                                  height: 96.85),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  // SERVICE CARD

  Widget _customServiceCard(
      BuildContext context,
      String title,
      String image,
      AppColor colors,
      {bool bigCard = false, VoidCallback? onTap}
      ) {
    final screenHeight = MediaQuery.of(context).size.height;
    final cardHeight = bigCard ? screenHeight * 0.28 : screenHeight * 0.15;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: colors.greenShade,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),

            //  Responsive Image Section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  // TOOL CARD

  Widget _customToolCard(String title, IconData icon, AppColor colors) {
    return Container(
      height: 60,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colors.greenShade.withOpacity(0.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: colors.black),
          const SizedBox(width: 10),
          Text(title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: colors.black,
              )),
        ],
      ),
    );
  }
}


class _CircularRevealClipper extends CustomClipper<Rect> {
  final double radius;
  _CircularRevealClipper(this.radius);

  @override
  Rect getClip(Size size) =>
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius);

  @override
  bool shouldReclip(_CircularRevealClipper oldClipper) =>
      radius != oldClipper.radius;
}


// import 'package:flutter/material.dart';
// import '../theme/appcolor.dart';
// import 'home.dart';
// import 'account.dart';
//
// class LandingPage extends StatefulWidget {
//   const LandingPage({super.key});
//
//   @override
//   State<LandingPage> createState() => _LandingPageState();
// }
//
// class _LandingPageState extends State<LandingPage> with SingleTickerProviderStateMixin {
//
//   late AnimationController _controller;
//   late Animation<Offset> leftAnim;
//   late Animation<Offset> rightAnim;
//   late Animation<Offset> bottomAnim;
//
//
//   int selectedIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     );
//
//     leftAnim = Tween<Offset>(
//       begin: const Offset(-1.2, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeOut
//     ));
//
//     rightAnim = Tween<Offset>(
//       begin: const Offset(1.2, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeOut
//     ));
//
//     bottomAnim = Tween<Offset>(
//       begin: const Offset(0, 1.2),
//       end: Offset.zero,
//     ).animate(
//         CurvedAnimation(parent: _controller, curve: Curves.easeOut)
//     );
//
//
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     final double availableWidth = MediaQuery.of(context).size.width - 65;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             padding: const EdgeInsets.fromLTRB(20, 50, 20, 120),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 30),
//
//                 // HEADER
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "The Perpetuity",
//                       style: TextStyle(
//                         fontSize: width * 0.07,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const CircleAvatar(
//                       radius: 20,
//                       backgroundImage: AssetImage('assets/landing_1.png'),
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 Text("Tools",
//                     style: TextStyle(
//                       fontSize: width * 0.04,
//                     )),
//
//                 const SizedBox(height: 25),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     _customToolCard("Nutrition Snap", Icons.camera_alt),
//                     _customToolCard("BMI Calculator", Icons.calculate),
//                   ],
//                 ),
//
//                 const SizedBox(height: 25),
//
//                 Text(
//                   "Services",
//                   style: TextStyle(
//                     fontSize: width * 0.04,
//                   ),
//                 ),
//
//                 const SizedBox(height: 25),
//
//                 // SERVICES SECTION
//                 Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//
//                         SlideTransition(
//                           position: leftAnim,
//                           child: SizedBox(
//                             width: availableWidth / 2,
//                             child: Column(
//                               children: [
//                                 _customServiceCard(
//                                   context,
//                                   "health_checkup",
//                                   "assets/Layer_1.png",
//                                   bigCard: true,
//                                 ),
//
//                                 const SizedBox(height: 10),
//                                 _customServiceCard(
//                                   context,
//                                   "orega_meal",
//                                   "assets/Layer_3.png",
//                                   bigCard: false,
//                                 ),
//
//                               ],
//                             ),
//                           ),
//                         ),
//
//                         const SizedBox(width: 10),
//
//
//                         SlideTransition(
//                           position: rightAnim,
//                           child: SizedBox(
//                             width: availableWidth /2,
//                             child: Column(
//                               children: [
//                                 _customServiceCard(
//                                   context,
//                                   "medical_consultant",
//                                   "assets/Layer_2.png",
//                                   bigCard: false,
//                                 ),
//
//                                 const SizedBox(height: 10),
//                                 _customServiceCard(
//                                   context,
//                                   "fitness_center",
//                                   "assets/Layer_4.png",
//                                   bigCard: true,
//                                   onTap: () {
//                                     Navigator.of(context).push(
//                                       PageRouteBuilder(
//                                         transitionDuration:
//                                         const Duration(milliseconds: 2000),
//                                         pageBuilder: (context, animation, secondaryAnimation) {
//                                           return const HomePage();
//                                         },
//                                         transitionsBuilder:
//                                             (context, animation, secondaryAnimation, child) {
//                                           return AnimatedBuilder(
//                                             animation: animation,
//                                             builder: (context, widget) {
//                                               double radius = animation.value * 2000;
//                                               return Stack(
//                                                 children: [
//                                                   Positioned.fill(
//                                                     child: ClipOval(
//                                                       clipper: _CircularRevealClipper(radius),
//                                                       child: child,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               );
//                                             },
//                                           );
//                                         },
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     const SizedBox(height: 12),
//
//                     // APPOINTMENT CARD
//                     SlideTransition(
//                       position: bottomAnim,
//                       child: Container(
//                         height: 110,
//                         width: availableWidth - 5,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: AppColor.green_shade,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
//                               child: Text(
//                                 "appointment",
//                                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                                   color: Theme.of(context).brightness == Brightness.dark
//                                       ? AppColor.white
//                                       : AppColor.black,
//                                   fontWeight: FontWeight.w900,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.fromLTRB(0, 13, 0, 0),
//                               child: Image.asset("assets/Layer_5.png", height: 96.85),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Custom service card
//   Widget _customServiceCard(
//       BuildContext context,
//       String title,
//       String image,
//       {bool bigCard = false, VoidCallback? onTap}) {
//
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     // Responsive height
//     final double cardHeight = bigCard ? screenHeight * 0.28 : screenHeight * 0.15;
//
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: cardHeight,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: AppColor.green_shade,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//               child: Text(
//                 title,
//                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                   color: Theme.of(context).brightness == Brightness.dark
//                       ? AppColor.white
//                       : AppColor.black,
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//             ),
//
//             // Responsive image
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 18),
//               child: Image.asset(
//                 image,
//                 height: bigCard ? cardHeight * 0.55 : cardHeight * 0.60,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   Widget _customToolCard(String title, IconData icon) {
//     return Container(
//       height: 60,
//       width: 160,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: AppColor.green_shade.withOpacity(0.3),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, color: Colors.black54),
//           const SizedBox(width: 10),
//           Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
//         ],
//       ),
//     );
//   }
// }
//
// class _CircularRevealClipper extends CustomClipper<Rect> {
//   final double radius;
//   _CircularRevealClipper(this.radius);
//
//   @override
//   Rect getClip(Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     return Rect.fromCircle(center: center, radius: radius);
//   }
//
//   @override
//   bool shouldReclip(_CircularRevealClipper oldClipper) {
//     return radius != oldClipper.radius;
//   }
// }

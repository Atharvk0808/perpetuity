import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../widgets/button_widget.dart';
import 'signin2.dart';
import '../utils/Loader_screen.dart';
import '../theme/appcolor.dart';

class SignIn1 extends StatelessWidget {
  const SignIn1({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final colors = Theme.of(context).extension<AppColor>()!;

    final double spacing = height * 0.02;
    final double titleFont = (width * 0.07).clamp(22, 30);
    final double labelFont = (width * 0.04).clamp(14, 18);

    TextEditingController numberController = TextEditingController();

    return Scaffold(
      // backgroundColor: Colors.black,
      backgroundColor: colors.background,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Stack(
            children: [

              // BOTTOM Section
              Positioned(
                bottom: 0,
                child: Container(
                  height: height * 0.5,
                  width: width,
                  decoration: BoxDecoration(
                    color: colors.card,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.08,
                      vertical: spacing * 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: (width * 0.055).clamp(18, 24),
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        SizedBox(height: spacing),
                        Text(
                          "Enter Your Number",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: labelFont,
                          ),
                        ),
                        SizedBox(height: spacing),

                        TextField(
                          controller: numberController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: colors.white,
                            prefixIcon: const Icon(Icons.flag),
                            hintText: "+91 | 90866542100",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        SizedBox(height: spacing * 2),

                        Center(
                          child: ButtonWidget(
                            label: "Get OTP",
                            suffixIcon: Icon(Icons.arrow_circle_right_sharp, color: colors.white),
                            onPressed: () async {
                              showLoader(context);

                              await Future.delayed(const Duration(seconds: 2));

                              hideLoader(context);

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const SignIn2()),
                              );
                            },
                          ),
                        ),

                        SizedBox(height: spacing * 1.5),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: labelFont,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: labelFont,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // TOP Section
              Padding(
                padding: EdgeInsets.only(top: spacing * 3),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Perpetuity",
                        style: TextStyle(
                          fontSize: titleFont,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    SizedBox(height: spacing * 2),

                    Center(
                      child: Image.asset(
                        'assets/signin1.png',
                        width: width * 0.92,
                        height: height * 0.32,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import '../widgets/button_widget.dart';
// import 'signin2.dart';
// import '../utils/Loader_screen.dart';
//
//
//
//
// class SignIn1 extends StatelessWidget {
//   const SignIn1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final height = size.height;
//     final width = size.width;
//
//     final double spacing = height * 0.02;
//     final double titleFont = (width * 0.07).clamp(22, 30);
//     final double labelFont = (width * 0.04).clamp(14, 18);
//
//     TextEditingController numberController = TextEditingController();
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFFFFDF5),
//       resizeToAvoidBottomInset: true,
//       body: SingleChildScrollView(
//           child: SizedBox(
//             height: height,
//             child: Stack(
//               children: [
//
//                 // BOTTOM Section
//                 Positioned(
//                   bottom: 0,
//                   child: Container(
//                     height: height * 0.5,
//                     width: width,
//                     decoration: const BoxDecoration(
//                       color: Color(0xFFEFFFEE),
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(50),
//                         topRight: Radius.circular(50),
//                       ),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: width * 0.08,
//                         vertical: spacing * 2,
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Sign In",
//                             style: TextStyle(
//                               fontSize: (width * 0.055).clamp(18, 24),
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black87,
//                             ),
//                           ),
//
//                           SizedBox(height: spacing),
//                           Text(
//                             "Enter your Number",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: labelFont,
//                             ),
//                           ),
//                           SizedBox(height: spacing),
//
//                           TextField(
//                             controller: numberController,
//                             keyboardType: TextInputType.phone,
//                             decoration: InputDecoration(
//                               filled: true,
//                               fillColor: Colors.white,
//                               prefixIcon: const Icon(Icons.flag),
//                               hintText: "+91 | 90866542100",
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                             ),
//                           ),
//
//                           SizedBox(height: spacing * 2),
//
//                           Center(
//                             child: ButtonWidget(
//                               label: "Get OTP",
//                               suffixIcon:
//                               const Icon(Icons.arrow_circle_right_sharp),
//
//                               // onPressed: () {
// //   Navigator.push(
// //     context,
// //     PageRouteBuilder(
// //       transitionDuration:
// //       const Duration(milliseconds: 900),
// //       pageBuilder: (_, animation, __) =>
// //       const SignIn2(),
// //       transitionsBuilder: (_, animation, __, child) {
// //         final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
// //             CurvedAnimation(parent: animation, curve: Curves.easeOut)
// //         );
// //
// //         final scale = Tween<double>(begin: 0.8, end: 1.0).animate(
// //             CurvedAnimation(parent: animation, curve: Curves.easeOutBack)
// //         );
// //
// //         return FadeTransition(
// //           opacity: fade,
// //           child: ScaleTransition(
// //             scale: scale,
// //             child: child,
// //           ),
// //         );
// //       },
// //
// //     ),
// //   );
// // },
//                               onPressed: () async {
//                                 showLoader(context);
//
//                                 await Future.delayed(const Duration(seconds: 2));
//
//                                 hideLoader(context);
//
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (_) => const SignIn2()),
//                                 );
//                               },
//                             ),
//                           ),
//
//                           SizedBox(height: spacing * 1.5),
//
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Don't have an account? ",
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: labelFont,
//                                 ),
//                               ),
//                               GestureDetector(
//                                 onTap: () {},
//                                 child: Text(
//                                   "Sign Up",
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: labelFont,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // TOP Section
//                 Padding(
//                   padding: EdgeInsets.only(top: spacing * 3),
//                   child: Column(
//                     children: [
//                       Center(
//                         child: Text(
//                           "Perpetuity",
//                           style: TextStyle(
//                             fontSize: titleFont,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//
//                       SizedBox(height: spacing * 2),
//
//                       Center(
//                         child: Image.asset(
//                           'assets/signin1.png',
//                           width: width * 0.92,
//                           height: height * 0.32,
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//
//     );
//
//   }
// }

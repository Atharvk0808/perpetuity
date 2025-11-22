import 'package:flutter/material.dart';
import '../widgets/button_widget.dart';
import '../theme/appcolor.dart';
import 'Otp.dart';
import 'dart:math' as math;

class SignIn2 extends StatelessWidget {
  const SignIn2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final colors = Theme.of(context).extension<AppColor>()!;

    TextEditingController numberController = TextEditingController();

    // Dynamic scaling factors
    final double spacing = height * 0.02;
    final double titleFont = (width * 0.07).clamp(22, 30);
    final double labelFont = (width * 0.045).clamp(16, 20);

    return Scaffold(
      backgroundColor: colors.background,
      //backgroundColor: Colors.black,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.35,
            child: Image.asset(
              'assets/signin2.png',
              fit: BoxFit.cover,
              height: height,
              width: width,
            ),
          ),

          // 🔝 Title Section (Perpetuity + Sign In)
          Positioned(
            top: height * 0.08,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  "Perpetuity",
                  style: TextStyle(
                    fontSize: titleFont,
                    fontWeight: FontWeight.w600,
                    color: colors.black,
                  ),
                ),
                SizedBox(height: spacing * 2),
                Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: (width * 0.06).clamp(20, 26),
                    fontWeight: FontWeight.w500,
                    color: colors.black,
                  ),
                ),
              ],
            ),
          ),

          // 🟢 Bottom Rounded Container
          Positioned(
            top: height * 0.35, // covers 65% from bottom
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.65,
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
                  vertical: spacing * 1.5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: spacing),
                    Text(
                      "Enter Your Number",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: labelFont,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: spacing * 1.2),

                    // 📞 Phone TextField
                    TextField(
                      controller: numberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: colors.white,
                        prefixIcon: const Icon(Icons.flag),
                        hintText: "+91 | ",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    SizedBox(height: spacing * 1.5),

                    // 🔹 Get OTP Button
                    ButtonWidget(
                      label: "Get OTP",
                      suffixIcon: Icon(Icons.arrow_circle_right_sharp, color: colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 900),
                            pageBuilder: (_, animation, __) => const Otp(),
                            transitionsBuilder: (_, animation, __, child) {
                              final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
                                  CurvedAnimation(parent: animation, curve: Curves.easeOut));

                              final scale = Tween<double>(begin: 0.8, end: 1.0).animate(
                                  CurvedAnimation(parent: animation, curve: Curves.easeOutBack));

                              return FadeTransition(
                                opacity: fade,
                                child: ScaleTransition(
                                  scale: scale,
                                  child: child,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),

                    //SizedBox(height: spacing * 1.2),

                    // 🔢 Responsive Numpad Section
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildNumberRow(["1", "2", "3"], width, colors),
                            buildNumberRow(["4", "5", "6"], width, colors),
                            buildNumberRow(["7", "8", "9"], width, colors),
                            buildNumberRow([".", "0", "*"], width, colors),
                          ],
                        ),
                      ),
                    ),
                    //SizedBox(height: spacing), // extra space in bottom
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //  Numpad Row Builder
  Widget buildNumberRow(List<String> numbers, double width, AppColor colors) {
    double boxSize = (width * 0.17).clamp(55, 70); // Button size scales

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: numbers.map((num) {
        if (num == "*") {
          return IconButton(
            onPressed: () {},
            icon: Icon(Icons.backspace_outlined, color: Colors.black),
            iconSize: boxSize * 0.45,
          );
        } else {
          return Container(
            width: boxSize,
            height: boxSize,
            alignment: Alignment.center,
            child: Text(
              num,
              style: TextStyle(
                fontSize: boxSize * 0.4,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          );
        }
      }).toList(),
    );
  }
}


// import 'package:flutter/material.dart';
// import '../widgets/button_widget.dart';
// import 'Otp.dart';
// import 'dart:math' as math;
//
//
// class SignIn2 extends StatelessWidget {
//   const SignIn2({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final height = size.height;
//     final width = size.width;
//
//     TextEditingController numberController = TextEditingController();
//
//     // Dynamic scaling factors
//     final double spacing = height * 0.02;
//     final double titleFont = (width * 0.07).clamp(22, 30);
//     final double labelFont = (width * 0.045).clamp(16, 20);
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFFFFDF5),
//       body: Stack(
//         children: [
//           Opacity(
//             opacity: 0.35,
//             child: Image.asset(
//               'assets/signin2.png',
//               fit: BoxFit.cover,
//               height: height,
//               width: width,
//             ),
//           ),
//
//           // 🔝 Title Section (Perpetuity + Sign In)
//           Positioned(
//             top: height * 0.08,
//             left: 0,
//             right: 0,
//             child: Column(
//               children: [
//                 Text(
//                   "Perpetuity",
//                   style: TextStyle(
//                     fontSize: titleFont,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: spacing * 2),
//                 Text(
//                   "Sign In",
//                   style: TextStyle(
//                     fontSize: (width * 0.06).clamp(20, 26),
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // 🟢 Bottom Rounded Container
//           Positioned(
//             top: height * 0.35, // covers 65% from bottom
//             left: 0,
//             right: 0,
//             child: Container(
//               height: height * 0.65,
//               width: width,
//               decoration: const BoxDecoration(
//                 color: Color(0xFFEFFFEE),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(50),
//                   topRight: Radius.circular(50),
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: width * 0.08,
//                   vertical: spacing * 1.5,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: spacing),
//                     Text(
//                       "Enter your Number",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: labelFont,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     SizedBox(height: spacing * 1.2),
//
//                     // 📞 Phone TextField
//                     TextField(
//                       controller: numberController,
//                       keyboardType: TextInputType.phone,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         prefixIcon: const Icon(Icons.flag),
//                         hintText: "+91 | ",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),
//
//                     SizedBox(height: spacing * 1.5),
//
//                     // 🔹 Get OTP Button
//                     ButtonWidget(
//                       label: "Get OTP",
//                       suffixIcon:
//                       const Icon(Icons.arrow_circle_right_sharp),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           PageRouteBuilder(
//                             transitionDuration:
//                             const Duration(milliseconds: 900),
//                             pageBuilder: (_, animation, __) =>
//                             const Otp(),
//                             transitionsBuilder: (_, animation, __, child) {
//                               final fade = Tween<double>(begin: 0.0, end: 1.0).animate(
//                                   CurvedAnimation(parent: animation, curve: Curves.easeOut)
//                               );
//
//                               final scale = Tween<double>(begin: 0.8, end: 1.0).animate(
//                                   CurvedAnimation(parent: animation, curve: Curves.easeOutBack)
//                               );
//
//                               return FadeTransition(
//                                 opacity: fade,
//                                 child: ScaleTransition(
//                                   scale: scale,
//                                   child: child,
//                                 ),
//                               );
//                             },
//
//                           ),
//                         );
//                       },
//
//                     ),
//
//                     SizedBox(height: spacing * 1.5),
//
//                     // 🔢 Responsive Numpad Section
//                     Expanded(
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: width * 0.08),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             buildNumberRow(["1", "2", "3"], width),
//                             buildNumberRow(["4", "5", "6"], width),
//                             buildNumberRow(["7", "8", "9"], width),
//                             buildNumberRow([".", "0", "*"], width),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // 🔹 Numpad Row Builder (Responsive)
//   Widget buildNumberRow(List<String> numbers, double width) {
//     double boxSize = (width * 0.17).clamp(55, 70); // Button size scales
//
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: numbers.map((num) {
//         if (num == "*") {
//           return IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.backspace_outlined),
//             iconSize: boxSize * 0.45,
//           );
//         } else {
//           return Container(
//             width: boxSize,
//             height: boxSize,
//             alignment: Alignment.center,
//             child: Text(
//               num,
//               style: TextStyle(
//                 fontSize: boxSize * 0.4,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//           );
//         }
//       }).toList(),
//     );
//   }
// }

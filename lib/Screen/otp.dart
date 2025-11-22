import 'package:flutter/material.dart';
import '../widgets/button_widget.dart';
import '../theme/appcolor.dart';
import 'sign_up.dart';
import 'dart:math' as math;

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final List<TextEditingController> _otpControllers =
  List.generate(4, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final colors = Theme.of(context).extension<AppColor>()!;

    return Scaffold(
      backgroundColor: colors.background,
      //backgroundColor: const Color(0xFFFFFDF5),
      body: Stack(
        children: [
          // 🔹 Top content
          Column(
            children: [
              SizedBox(height: height * 0.1),
              Text(
                "Perpetuity",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: colors.black,
                ),
              ),
              SizedBox(height: height * 0.05),
              Text(
                "Enter 4 digit code",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: colors.black,
                ),
              ),
              SizedBox(height: height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: width * 0.13,
                    height: height * 0.07,
                    child: TextField(
                      controller: _otpControllers[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        counterText: "",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 3) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  );
                }),
              ),
              SizedBox(height: height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Didn’t receive the code? ",
                      style: TextStyle(color: colors.black)),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Resend Code",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // 🔹 Bottom rounded container
          Positioned(
            top: height * 0.55, // starts around 55% of screen height
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.45, // bottom part responsive height
              decoration: BoxDecoration(
                color: colors.card,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    //  Verify Button
                    ButtonWidget(
                      label: "Verify",
                      suffixIcon: Icon(Icons.arrow_circle_right_sharp, color: colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 900),
                            pageBuilder: (_, animation, __) => const SignUp(),
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
                    const SizedBox(height: 20),

                    //  Fixed numpad
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildNumberRow(["1", "2", "3"], colors),
                          buildNumberRow(["4", "5", "6"], colors),
                          buildNumberRow(["7", "8", "9"], colors),
                          buildNumberRow([".", "0", "*"], colors),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Helper Widget for numpad rows
  Widget buildNumberRow(List<String> numbers, AppColor colors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: numbers.map((num) {
        if (num == "*") {
          return IconButton(
            onPressed: () {},
            icon: Icon(Icons.backspace_outlined, color: Colors.black),
            iconSize: 26,
          );
        } else {
          return Container(
            width: 60,
            height: 50,
            alignment: Alignment.center,
            child: Text(
              num,
              style: TextStyle(
                fontSize: 22,
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
// import 'sign_up.dart';
// import 'dart:math' as math;
//
// class Otp extends StatefulWidget {
//   const Otp({super.key});
//
//   @override
//   State<Otp> createState() => _OtpState();
// }
//
// class _OtpState extends State<Otp> {
//   final List<TextEditingController> _otpControllers =
//   List.generate(4, (_) => TextEditingController());
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFFFFDF5),
//       body: Stack(
//         children: [
//           // 🔹 Top content
//           Column(
//             children: [
//               SizedBox(height: height * 0.1),
//               Text(
//                 "Perpetuity",
//                 style: const TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(height: height * 0.05),
//               Text(
//                 "Enter 4 digit code",
//                 style: const TextStyle(
//                   fontSize: 26,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(height: height * 0.03),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(4, (index) {
//                   return Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 8),
//                     width: width * 0.13,
//                     height: height * 0.07,
//                     child: TextField(
//                       controller: _otpControllers[index],
//                       keyboardType: TextInputType.number,
//                       textAlign: TextAlign.center,
//                       maxLength: 1,
//                       style: const TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       decoration: InputDecoration(
//                         counterText: "",
//                         filled: true,
//                         fillColor: Colors.white,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       onChanged: (value) {
//                         if (value.isNotEmpty && index < 3) {
//                           FocusScope.of(context).nextFocus();
//                         }
//                       },
//                     ),
//                   );
//                 }),
//               ),
//               SizedBox(height: height * 0.03),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Didn’t receive the code? ",
//                       style: TextStyle(color: Colors.black)),
//                   GestureDetector(
//                     onTap: () {},
//                     child: const Text(
//                       "Resend Code",
//                       style: TextStyle(
//                         color: Colors.green,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//
//           // 🔹 Bottom rounded container
//           Positioned(
//             top: height * 0.55, // starts around 55% of screen height
//             left: 0,
//             right: 0,
//             child: Container(
//               height: height * 0.45, // bottom part responsive height
//               decoration: const BoxDecoration(
//                 color: Color(0xFFEFFFEE),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(50),
//                   topRight: Radius.circular(50),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   children: [
//                     // 🔸 Verify Button
//                     ButtonWidget(
//                       label: "Verify",
//                       suffixIcon: const Icon(Icons.arrow_circle_right_sharp),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           PageRouteBuilder(
//                             transitionDuration:
//                             const Duration(milliseconds: 900),
//                             pageBuilder: (_, animation, __) =>
//                             const SignUp(),
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
//                     ),
//                     const SizedBox(height: 20),
//
//                     //🔸 Fixed numpad
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           buildNumberRow(["1", "2", "3"]),
//                           buildNumberRow(["4", "5", "6"]),
//                           buildNumberRow(["7", "8", "9"]),
//                           buildNumberRow([".", "0", "*"]),
//                         ],
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
//   // 🔹 Helper Widget for numpad rows
//   Widget buildNumberRow(List<String> numbers) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: numbers.map((num) {
//         if (num == "*") {
//           return IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.backspace_outlined),
//             iconSize: 26,
//           );
//         } else {
//           return Container(
//             width: 60,
//             height: 60,
//             alignment: Alignment.center,
//             child: Text(
//               num,
//               style: const TextStyle(
//                 fontSize: 22,
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

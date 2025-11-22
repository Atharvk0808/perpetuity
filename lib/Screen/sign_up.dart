import 'package:flutter/material.dart';
import '../widgets/button_widget.dart';
import '../theme/appcolor.dart';
import 'landing_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();
  final _communityController = TextEditingController();

  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final colors = Theme.of(context).extension<AppColor>()!;

    return Scaffold(
      backgroundColor: colors.background,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 60),

                Text(
                  "Perpetuity",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: colors.black,
                  ),
                ),

                const SizedBox(height: 320),

                Stack(
                  children: [
                    SizedBox(
                      //height: 950,
                      child: ClipRRect(
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/Rectangle_signup.png',
                              width: width,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 60),

                          // Name
                          Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 6),
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: "Enter your Name",
                              filled: true,
                              fillColor: colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Email
                          Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 6),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: "Enter your email",
                              filled: true,
                              fillColor: colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 16),

                          // DOB
                          Text(
                            "DOB",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 6),
                          TextField(
                            controller: _dobController,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: "DD/MM/YYYY",
                              filled: true,
                              fillColor: colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.calendar_month,
                                  color: colors.greenShade,
                                ),
                                onPressed: () async {
                                  DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime(2100),
                                  );
                                  if (picked != null) {
                                    _dobController.text =
                                    "${picked.day}/${picked.month}/${picked.year}";
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Gender
                          Text(
                            "Gender",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 6),
                          DropdownButtonFormField<String>(
                            value: _selectedGender,
                            decoration: InputDecoration(
                              hintText: "Gender",
                              filled: true,
                              fillColor: colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                            items: ["Male", "Female", "Other"]
                                .map(
                                  (e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: TextStyle(color: colors.black),
                                ),
                              ),
                            )
                                .toList(),
                            onChanged: (value) => setState(() {
                              _selectedGender = value;
                            }),
                          ),
                          const SizedBox(height: 16),

                          // Community code
                          Text(
                            "Community code",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 6),
                          TextField(
                            controller: _communityController,
                            decoration: InputDecoration(
                              hintText: "Enter Community code",
                              filled: true,
                              fillColor: colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14)),
                            ),
                          ),

                          const SizedBox(height: 25),

                          SizedBox(
                            width: double.infinity,
                            child: Center(
                              child: ButtonWidget(
                                label: "Submit",
                                suffixIcon: Icon(
                                  Icons.arrow_circle_right_sharp,
                                  color: colors.white,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                      const Duration(milliseconds: 900),
                                      pageBuilder: (_, animation, __) =>
                                      const LandingPage(),
                                      transitionsBuilder:
                                          (_, animation, __, child) {
                                        final fade = Tween<double>(
                                            begin: 0.0, end: 1.0)
                                            .animate(CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.easeOut));
                                        final scale = Tween<double>(
                                            begin: 0.8, end: 1.0)
                                            .animate(CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.easeOutBack));
                                        return FadeTransition(
                                          opacity: fade,
                                          child: ScaleTransition(
                                              scale: scale, child: child),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Transform.translate(
              offset: const Offset(0, -55),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 112, 63, 0),
                child: Image.asset("assets/signin1.png", height: 460),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import '../widgets/button_widget.dart';
// import 'landing_page.dart';
//
//
// class SignUp extends StatefulWidget {
//   const SignUp({super.key});
//
//   @override
//   State<SignUp> createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _dobController = TextEditingController();
//   final _communityController = TextEditingController();
//
//   String? _selectedGender;
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//
//                 const SizedBox(height: 60),
//
//                 const Text(
//                   "Perpetuity",
//                   style: TextStyle(
//                     fontSize: 26,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//
//                 const SizedBox(height: 320),
//
//                 Stack(
//                   children: [
//                     Container(
//                       height: 750,
//                       child: ClipRRect(
//                         child: Image.asset(
//                           'assets/Rectangle_signup.png',
//                           width: width,
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     ),
//
//                     Padding(
//                       padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 100),
//
//                           Text("Name",
//                               style: TextStyle(
//                                   fontSize: 14, fontWeight: FontWeight.w600)),
//                           const SizedBox(height: 6),
//                           TextField(
//                             controller: _nameController,
//                             decoration: InputDecoration(
//                               hintText: "Enter your Name",
//                               filled: true,
//                               fillColor: Colors.white,
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(14)),
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//
//
//                           Text("Email",
//                               style: TextStyle(
//                                   fontSize: 14, fontWeight: FontWeight.w600)),
//                           const SizedBox(height: 6),
//                           TextField(
//                             controller: _emailController,
//                             decoration: InputDecoration(
//                               hintText: "Enter your email",
//                               filled: true,
//                               fillColor: Colors.white,
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(14)),
//                             ),
//                             keyboardType: TextInputType.emailAddress,
//                           ),
//                           const SizedBox(height: 16),
//
//
//                           Text("DOB",
//                               style: TextStyle(
//                                   fontSize: 14, fontWeight: FontWeight.w600)),
//                           const SizedBox(height: 6),
//                           TextField(
//                             controller: _dobController,
//                             readOnly: true,
//                             decoration: InputDecoration(
//                               hintText: "DD/MM/YYYY",
//                               filled: true,
//                               fillColor: Colors.white,
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(14)),
//                               suffixIcon: IconButton(
//                                 icon: const Icon(Icons.calendar_month,
//                                     color: Colors.green),
//                                 onPressed: () async {
//                                   DateTime? picked = await showDatePicker(
//                                     context: context,
//                                     initialDate: DateTime.now(),
//                                     firstDate: DateTime(1950),
//                                     lastDate: DateTime(2100),
//                                   );
//                                   if (picked != null) {
//                                     _dobController.text =
//                                     "${picked.day}/${picked.month}/${picked.year}";
//                                   }
//                                 },
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//
//
//                           Text("Gender",
//                               style: TextStyle(
//                                   fontSize: 14, fontWeight: FontWeight.w600)),
//                           const SizedBox(height: 6),
//                           DropdownButtonFormField<String>(
//                             value: _selectedGender,
//                             decoration: InputDecoration(
//                               filled: true,
//                               fillColor: Colors.white,
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(14)),
//                             ),
//                             items: ["Male", "Female", "Other"]
//                                 .map((e) => DropdownMenuItem(
//                               value: e,
//                               child: Text(e),
//                             ))
//                                 .toList(),
//                             onChanged: (value) => setState(() {
//                               _selectedGender = value;
//                             }),
//                           ),
//                           const SizedBox(height: 16),
//
//
//                           Text("Community code",
//                               style: TextStyle(
//                                   fontSize: 14, fontWeight: FontWeight.w600)),
//                           const SizedBox(height: 6),
//                           TextField(
//                             controller: _communityController,
//                             decoration: InputDecoration(
//                               hintText: "Enter Community code",
//                               filled: true,
//                               fillColor: Colors.white,
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(14)),
//                             ),
//                           ),
//
//                           const SizedBox(height: 25),
//
//
//                           SizedBox(
//                             width: double.infinity,
//                             child: Center(
//                               child: ButtonWidget(
//                                 label: "Submit",
//                                 suffixIcon: const Icon(Icons.arrow_circle_right_sharp),
//                                 onPressed: () {
//                                   Navigator.push(
//                                     context,
//                                     PageRouteBuilder(
//                                       transitionDuration: Duration(milliseconds: 900),
//                                       pageBuilder: (_, animation, __) => const LandingPage(),
//                                       transitionsBuilder: (_, animation, __, child) {
//                                         final fade = Tween<double>(begin: 0.0, end: 1.0)
//                                             .animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
//
//                                         final scale = Tween<double>(begin: 0.8, end: 1.0)
//                                             .animate(CurvedAnimation(parent: animation, curve: Curves.easeOutBack));
//
//                                         return FadeTransition(
//                                           opacity: fade,
//                                           child: ScaleTransition(scale: scale, child: child),
//                                         );
//                                       },
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//
//
//                           // const SizedBox(height: 20),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//
//
//
//                 // const SizedBox(height: 68),
//
//
//
//               ],
//             ),
//             Transform.translate(
//                 offset: Offset(0,-55),
//               child: Padding(
//                   padding: EdgeInsetsGeometry.fromLTRB(0,112,63,0),
//                 child: Image.asset("assets/signin1.png", height: 476,),
//               )
//             )
//           ],
//         )
//       ),
//     );
//   }
// }

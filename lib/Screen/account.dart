import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../theme/theme_pref.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int selectedNavIndex = 3;

  // ------------------- ROW ITEM -------------------
  Widget buildRow(IconData icon, String text) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: theme.cardColor, // <<<<<< THEME COLOR
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: theme.iconTheme.color), // THEME
          Expanded(
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: theme.textTheme.bodyLarge!.color, // THEME
                ),
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios,
              size: 18, color: theme.iconTheme.color), // THEME
        ],
      ),
    );
  }

  // ------------------- NAV ICON -------------------
  Widget _buildNavIcon(IconData icon, int index) {
    final theme = Theme.of(context);
    bool isSelected = selectedNavIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedNavIndex = index;
        });
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? theme.cardColor : Colors.transparent, // THEME
        ),
        child: Icon(
          icon,
          color: isSelected ? theme.iconTheme.color : Colors.grey, // THEME
        ),
      ),
    );
  }

  //  DARK MODE TOGGLE
  Widget buildDarkModeRow() {
    final theme = Theme.of(context);

    return ValueListenableBuilder(
      valueListenable: appTheme,
      builder: (context, value, child) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: theme.cardColor, // THEME
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.dark_mode, color: theme.iconTheme.color), // THEME
              Text(
                "Dark Mode",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: theme.textTheme.bodyLarge!.color, // THEME
                ),
              ),
              Switch(
                value: appTheme.value == AppTheme.dark,
                activeColor: theme.primaryColor,
                onChanged: (v) {
                  appTheme.value = v ? AppTheme.dark : AppTheme.light;
                  ThemePref.saveTheme(v);
                },
              )
            ],
          ),
        );
      },
    );
  }

  //  UI
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor, // THEME
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // BACK + TITLE
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: theme.iconTheme.color, // THEME
                            size: width * 0.045,
                          ),
                        ),
                        Text(
                          "Profile",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: theme.textTheme.bodyLarge!.color, // THEME
                          ),
                        ),
                        const SizedBox(width: 30),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // PROFILE PHOTO
                  CircleAvatar(
                    radius: size.width * 0.18,
                    backgroundImage:
                    const AssetImage('assets/landing_1.png'),
                  ),

                  const SizedBox(height: 12),

                  // NAME
                  Text(
                    "John Doe",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: theme.textTheme.bodyLarge!.color, // THEME
                    ),
                  ),

                  const SizedBox(height: 6),

                  // EMAIL
                  Text(
                    "john.doe@example.com",
                    style: GoogleFonts.poppins(
                      color: theme.textTheme.bodyMedium!.color, // THEME
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // GREEN LOYALTY ROW
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 16),
                    decoration: BoxDecoration(
                      color: theme.primaryColor, // THEME GREEN
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.star, color: Colors.white),
                        Text(
                          "Loyalty Points",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "20",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // PROFILE SETTINGS
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Profile Settings",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: theme.textTheme.bodyLarge!.color, // THEME
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  buildRow(Icons.account_box, "Personal Information"),
                  buildRow(Icons.notifications, "Notifications"),
                  buildDarkModeRow(),

                  const SizedBox(height: 20),

                  // SUPPORT
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Support",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: theme.textTheme.bodyLarge!.color, // THEME
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  buildRow(Icons.compare_arrows_outlined, "Transactions"),
                  buildRow(Icons.document_scanner, "Terms & Conditions"),
                  buildRow(Icons.privacy_tip, "Privacy Policy"),
                  buildRow(Icons.help, "Help"),
                  buildRow(Icons.logout, "Logout"),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../theme/app_theme.dart';
//
//
// class AccountScreen extends StatefulWidget {
//   const AccountScreen({super.key});
//
//   @override
//   State<AccountScreen> createState() => _AccountScreenState();
// }
//
// class _AccountScreenState extends State<AccountScreen> {
//   int selectedNavIndex = 3; // Profile icon default selected
//
//   Widget buildRow(IconData icon, String text) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//       decoration: BoxDecoration(
//         color: Colors.green[100],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Icon(icon, color: Colors.black),
//           Expanded(
//             child: Center(
//               child: Text(
//                 text,
//                 style: GoogleFonts.poppins(fontSize: 15),
//               ),
//             ),
//           ),
//           const Icon(Icons.arrow_forward_ios, size: 18),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildNavIcon(IconData icon, int index) {
//     bool isSelected = selectedNavIndex == index;
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedNavIndex = index;
//         });
//       },
//       child: Container(
//         width: 40,
//         height: 40,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: isSelected ? Colors.white : Colors.transparent,
//         ),
//         child: Icon(
//           icon,
//           color: isSelected ? Colors.black : Colors.grey,
//         ),
//       ),
//     );
//   }
//
//   Widget buildDarkModeRow() {
//     return ValueListenableBuilder(
//       valueListenable: appTheme,
//       builder: (context, value, child) {
//         return Container(
//           margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//           decoration: BoxDecoration(
//             color: Colors.green[100],
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Icon(Icons.dark_mode, color: Colors.black),
//               Text(
//                 "Dark Mode",
//                 style: GoogleFonts.poppins(fontSize: 15),
//               ),
//               Switch(
//                 value: appTheme.value == AppTheme.dark,
//                 onChanged: (v) {
//                   appTheme.value = v ? AppTheme.dark : AppTheme.light;
//                 },
//               )
//
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final width = size.width;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Stack(
//           children: [
//
//             SingleChildScrollView(
//               child: Column(
//                 children: [
//
//                   Padding(
//                     padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         GestureDetector(
//                           onTap: () => Navigator.pop(context),
//                           child: Icon(Icons.arrow_back_ios_new,
//                               color: Colors.black, size: width * 0.045),
//                         ),
//                         Text(
//                           "Profile",
//                           style: GoogleFonts.poppins(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         const SizedBox(width: 30),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   //  Profile Photo
//                   CircleAvatar(
//                     radius: size.width * 0.18,
//                     backgroundImage: const AssetImage('assets/landing_1.png'),
//                   ),
//
//                   const SizedBox(height: 12),
//
//                   //  Name
//                   Text(
//                     "John Doe",
//                     style: GoogleFonts.poppins(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//
//                   const SizedBox(height: 6),
//
//                   //  Email
//                   Text(
//                     "john.doe@example.com",
//                     style: GoogleFonts.poppins(
//                       color: Colors.grey[700],
//                       fontSize: 14,
//                     ),
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   // 🔹 Green Row
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 20),
//                     padding:
//                     const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
//                     decoration: BoxDecoration(
//                       color: Colors.green,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Icon(Icons.star, color: Colors.white),
//                         Text(
//                           "Loyalty Points",
//                           style: GoogleFonts.poppins(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         Text(
//                           "20",
//                           style: GoogleFonts.poppins(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   // 🔹 Settings Title
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Profile Settings",
//                         style: GoogleFonts.poppins(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(height: 10),
//                   buildRow(Icons.account_box, "Personal Information"),
//                   buildRow(Icons.notifications, "Notifications"),
//                  // buildRow(Icons.dark_mode, "Dark Mode"),
//                   buildDarkModeRow(),
//
//                   const SizedBox(height: 20),
//
//
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Support",
//                         style: GoogleFonts.poppins(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(height: 10),
//                   buildRow(Icons.compare_arrows_outlined, "Transactions"),
//                   buildRow(Icons.document_scanner, "Terms & Conditions"),
//                   buildRow(Icons.privacy_tip, "Privacy Policy"),
//                   buildRow(Icons.help, "Help"),
//                   buildRow(Icons.logout, "Logout"),
//
//                   const SizedBox(height: 100), // leave space for navbar
//                 ],
//               ),
//             ),
//
//             // Floating Bottom Navbar
//             // Positioned(
//             //   bottom: 30,
//             //   left: (width - 229) / 2,
//             //   child: Container(
//             //     width: 229,
//             //     height: 57,
//             //     decoration: BoxDecoration(
//             //       color: Colors.black,
//             //       borderRadius: BorderRadius.circular(186),
//             //       boxShadow: [
//             //         BoxShadow(
//             //           color: Colors.black.withOpacity(0.2),
//             //           blurRadius: 8,
//             //           offset: const Offset(0, 4),
//             //         )
//             //       ],
//             //     ),
//             //     child: Row(
//             //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             //       children: [
//             //         _buildNavIcon(Icons.home, 0),
//             //         _buildNavIcon(Icons.list, 1),
//             //         _buildNavIcon(Icons.emoji_events, 2),
//             //         _buildNavIcon(Icons.account_circle, 3),
//             //       ],
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//

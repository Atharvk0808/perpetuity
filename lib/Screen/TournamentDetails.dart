import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../widgets/button_widget.dart';
import 'LeaderBoard.dart';
import 'home.dart';
import 'all_tournaments.dart';
import 'account.dart';

class TournamentDetails extends StatefulWidget {
  const TournamentDetails({super.key});

  @override
  State<TournamentDetails> createState() => _TournamentDetailsState();
}

class _TournamentDetailsState extends State<TournamentDetails> {
  int selectedNavIndex = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.015,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ----------------- HEADER ------------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back_ios_new,
                            color: theme.iconTheme.color, size: width * 0.045),
                      ),
                      Text(
                        "Tournament Details",
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontSize: width * 0.05,
                        ),
                      ),
                      SizedBox(width: width * 0.05),
                    ],
                  ),
                  SizedBox(height: height * 0.02),

                  // ----------------- DATE BOXES ------------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _dateBox("4 Nov 7:00 A.M", width, height, theme),
                      _dateBox("7 Nov 7:00 A.M", width, height, theme),
                    ],
                  ),
                  SizedBox(height: height * 0.02),

                  // ----------------- IMAGE ------------------
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/home_2.png',
                      width: width,
                      height: height * 0.25,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: height * 0.015),

                  // ----------------- TITLE ------------------
                  Text(
                    "Mother Teressa Memorial 2nd year Cricket",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: height * 0.008),

                  // ----------------- LOCATION ------------------
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          size: width * 0.04,
                          color: theme.colorScheme.primary),
                      SizedBox(width: width * 0.015),
                      Expanded(
                        child: Text(
                          "B Commercial Square, Thane Road, Pune",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: width * 0.035,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.015),

                  // ----------------- DESCRIPTION BOX ------------------
                  DottedBorder(
                    color: theme.colorScheme.primary,
                    strokeWidth: 1,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(8),
                    dashPattern: const [6, 4],
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.03),
                      child: Text(
                        "This tournament will be held at B Commercial Square, Thane Road, Pune. "
                            "Each team includes 6 players, competing in knockout rounds. "
                            "To join the tournament, make sure to follow assigned nutrition and food menu during match days.",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: width * 0.034,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),

                  // ----------------- INFO ROWS ------------------
                  _infoRow("Joining Fees", "2000/-", width, theme),
                  SizedBox(height: height * 0.015),
                  _infoRow("No. of Teams", "6", width, theme),
                  SizedBox(height: height * 0.02),

                  // ----------------- PRICE DETAILS ------------------
                  Text(
                    "Price Details",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: width * 0.043,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  _infoRow("1st Prize", "2000/-", width, theme,
                      color: theme.colorScheme.primary),
                  Divider(),
                  _infoRow("2nd Prize", "1000/-", width, theme,
                      color: theme.colorScheme.primary),
                  Divider(),
                  _infoRow("3rd Prize", "500/-", width, theme,
                      color: theme.colorScheme.primary),
                  SizedBox(height: height * 0.02),

                  Text(
                    "Additional Details",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: width * 0.043,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    "All matches will be played under the T10 format, with each team consisting of six players... umpire decisions will be final...",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: width * 0.034,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: height * 0.02),

                  Text(
                    "Rules & Regulations",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: width * 0.043,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.01),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ruleItem("Each team must consist of 6 registered players only.", theme),
                      SizedBox(height: 10),
                      _ruleItem("All matches will follow T10 format with standard rules.", theme),
                      SizedBox(height: 10),
                      _ruleItem("Players must wear proper team jerseys and sports shoes.", theme),
                      SizedBox(height: 10),
                      _ruleItem("Umpire decisions are final — maintain fair play.", theme),
                    ],
                  ),

                  SizedBox(height: height * 0.03),

                  // ----------------- BUTTON ------------------
                  Center(
                    child: SizedBox(
                      width: width * 0.7,
                      child: ButtonWidget(
                        label: "Join Now",
                        suffixIcon: Icon(Icons.arrow_circle_right_sharp,
                            size: width * 0.06),
                        onPressed: () {},
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.12),
                ],
              ),
            ),

            // ----------------- BOTTOM NAV ------------------
            Positioned(
              bottom: height * 0.04,
              left: (width - width * 0.60) / 2,
              child: Container(
                width: width * 0.60,
                height: height * 0.07,
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(186),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavIcon(Icons.home, 0, HomePage(), theme),
                    _buildNavIcon(Icons.list, 1, AllTournaments(), theme),
                    _buildNavIcon(Icons.emoji_events, 2, LeaderBoardScreen(), theme),
                    _buildNavIcon(Icons.account_circle, 3, AccountScreen(), theme),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------ DATE BOX ------------------
  Widget _dateBox(String text, double width, double height, ThemeData theme) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.008,
      ),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.calendar_today,
              size: width * 0.04, color: theme.iconTheme.color),
          SizedBox(width: width * 0.015),
          Text(text, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }

  // ------------------ INFO ROW ------------------
  Widget _infoRow(String label, String value, double width, ThemeData theme,
      {Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: theme.textTheme.bodyMedium?.copyWith(fontSize: width * 0.038)),
        Text(
          value,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontSize: width * 0.040,
            fontWeight: FontWeight.w600,
            color: color ?? theme.textTheme.bodyLarge?.color,
          ),
        ),
      ],
    );
  }

  // ------------------ NAV ICON ------------------
  Widget _buildNavIcon(IconData icon, int index, Widget page, ThemeData theme) {
    bool isSelected = selectedNavIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() => selectedNavIndex = index);

        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 350),
            pageBuilder: (_, animation, __) => page,
            transitionsBuilder: (_, animation, __, child) {
              final offsetAnimation = Tween<Offset>(
                begin: Offset(index > selectedNavIndex ? 1.0 : -1.0, 0),
                end: Offset.zero,
              ).animate(animation);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          ),
        );
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? theme.scaffoldBackgroundColor : Colors.transparent,
        ),
        child: Icon(
          icon,
          color: isSelected ? theme.colorScheme.primary : theme.iconTheme.color,
          size: 24,
        ),
      ),
    );
  }

  // ------------------ RULE ITEM ------------------
  Widget _ruleItem(String text, ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 6),
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodyMedium?.copyWith(height: 1.3),
          ),
        ),
      ],
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:dotted_border/dotted_border.dart';
// import '../widgets/button_widget.dart';
// import 'LeaderBoard.dart';
// import 'home.dart';
// import 'all_tournaments.dart';
// import 'account.dart';
//
// class TournamentDetails extends StatefulWidget {
//   const TournamentDetails({super.key});
//
//   @override
//   State<TournamentDetails> createState() => _TournamentDetailsState();
// }
//
// class _TournamentDetailsState extends State<TournamentDetails> {
//   int selectedNavIndex = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFFFFDF5),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             SingleChildScrollView(
//               padding: EdgeInsets.symmetric(
//                 horizontal: width * 0.04,
//                 vertical: height * 0.015,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       GestureDetector(
//                         onTap: () => Navigator.pop(context),
//                         child: Icon(Icons.arrow_back_ios_new,
//                             color: Colors.black, size: width * 0.045),
//                       ),
//                       Text(
//                         "Tournament Details",
//                         style: TextStyle(
//                           fontSize: width * 0.05,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       SizedBox(width: width * 0.05),
//                     ],
//                   ),
//                   SizedBox(height: height * 0.02),
//
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       _dateBox("4 Nov 7:00 A.M", width, height),
//                       _dateBox("7 Nov 7:00 A.M", width, height),
//                     ],
//                   ),
//                   SizedBox(height: height * 0.02),
//
//
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: Image.asset(
//                       'assets/home_2.png',
//                       width: width,
//                       height: height * 0.25,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   SizedBox(height: height * 0.015),
//
//
//                   Text(
//                     "Mother Teressa Memorial 2nd year Cricket",
//                     style: TextStyle(
//                       fontSize: width * 0.045,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   SizedBox(height: height * 0.008),
//
//
//                   Row(
//                     children: [
//                       Icon(Icons.location_on,
//                           size: width * 0.04, color: Colors.green),
//                       SizedBox(width: width * 0.015),
//                       Expanded(
//                         child: Text(
//                           "B Commercial Square, Thane Road, Pune",
//                           style: TextStyle(
//                             fontSize: width * 0.035,
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: height * 0.015),
//
//
//                   DottedBorder(
//                     color: Colors.green,
//                     strokeWidth: 1,
//                     borderType: BorderType.RRect,
//                     radius: Radius.circular(8),
//                     dashPattern: const [6, 4],
//                     child: Padding(
//                       padding: EdgeInsets.all(width * 0.03),
//                       child: Text(
//                         "This tournament will be held at B Commercial Square, Thane Road, Pune. "
//                             "Each team includes 6 players, competing in knockout rounds. "
//                             "To join the tournament, make sure to follow assigned nutrition and food menu during match days.",
//                         style: TextStyle(
//                           fontSize: width * 0.034,
//                           height: 1.4,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: height * 0.02),
//
//                   _infoRow("Joining Fees", "2000/-", width),
//                   SizedBox(height: height * 0.015),
//                   _infoRow("No. of Teams", "6", width),
//                   SizedBox(height: height * 0.02),
//
//                   Text(
//                     "Price Details",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: width * 0.043,
//                     ),
//                   ),
//                   SizedBox(height: height * 0.01),
//                   _infoRow("1st Prize", "2000/-", width, color: Colors.green),
//                   Divider(),
//                   _infoRow("2nd Prize", "1000/-", width, color: Colors.green),
//                   Divider(),
//                   _infoRow("3rd Prize", "500/-", width, color: Colors.green),
//                   SizedBox(height: height * 0.02),
//
//                   Text(
//                     "Additional Details",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: width * 0.043,
//                     ),
//                   ),
//                   SizedBox(height: height * 0.01),
//                   Text(
//                     "All matches will be played under the T10 format, with each team consisting of six players..."
//                         " umpire decisions will be final...",
//                     style: TextStyle(fontSize: width * 0.034, height: 1.5),
//                   ),
//                   SizedBox(height: height * 0.02),
//
//                   Text(
//                     "Rules & Regulations",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: width * 0.043,
//                     ),
//                   ),
//                   SizedBox(height: height * 0.01),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _ruleItem("Each team must consist of 6 registered players only."),
//                       SizedBox(height: 10),
//                       _ruleItem("All matches will follow T10 format with standard rules."),
//                       SizedBox(height: 10),
//                       _ruleItem("Players must wear proper team jerseys and sports shoes."),
//                       SizedBox(height: 10),
//                       _ruleItem("Umpire decisions are final — maintain fair play."),
//                     ],
//                   ),
//
//                   SizedBox(height: height * 0.03),
//
//
//                   Center(
//                     child: SizedBox(
//                       width: width * 0.7,
//                       child: ButtonWidget(
//                         label: "Join Now",
//                         suffixIcon:
//                         Icon(Icons.arrow_circle_right_sharp, size: width * 0.06),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ),
//
//                   SizedBox(height: height * 0.12),
//                 ],
//               ),
//             ),
//
//
//             Positioned(
//               bottom: height * 0.04,
//               left: (width - width * 0.60) / 2,
//               child: Container(
//                 width: width * 0.60,
//                 height: height * 0.07,
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(186),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       blurRadius: 8,
//                       offset: const Offset(0, 4),
//                     )
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     _buildNavIcon(Icons.home, 0, HomePage()),          // Home
//                     _buildNavIcon(Icons.list, 1, AllTournaments()),    // List Page
//                     _buildNavIcon(Icons.emoji_events, 2, LeaderBoardScreen()), // Leaderboard
//                     _buildNavIcon(Icons.account_circle, 3, AccountScreen()),      // Account
//                   ],
//                 ),
//
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
//
//   Widget _dateBox(String text, double width, double height) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: width * 0.03,
//         vertical: height * 0.008,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           Icon(Icons.calendar_today, size: width * 0.04),
//           SizedBox(width: width * 0.015),
//           Text(text, style: TextStyle(fontSize: width * 0.033)),
//         ],
//       ),
//     );
//   }
//
//   Widget _infoRow(String label, String value, double width,
//       {Color color = Colors.black}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(label, style: TextStyle(fontSize: width * 0.038)),
//         Text(
//           value,
//           style: TextStyle(
//               fontWeight: FontWeight.w600, color: color, fontSize: width * 0.040),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildNavIcon(IconData icon, int index, Widget page) {
//     bool isSelected = selectedNavIndex == index;
//
//     return GestureDetector(
//       onTap: () {
//         setState(() => selectedNavIndex = index);
//
//         Navigator.push(
//           context,
//           PageRouteBuilder(
//             transitionDuration: const Duration(milliseconds: 350),
//             pageBuilder: (_, animation, __) => page,
//             transitionsBuilder: (_, animation, __, child) {
//               final offsetAnimation = Tween<Offset>(
//                 begin: Offset(index > selectedNavIndex ? 1.0 : -1.0, 0),
//                 end: Offset.zero,
//               ).animate(animation);
//
//               return SlideTransition(
//                 position: offsetAnimation,
//                 child: child,
//               );
//             },
//           ),
//         );
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
//           size: 24,
//         ),
//       ),
//     );
//   }
//
//
//   Widget _ruleItem(String text) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           margin: const EdgeInsets.only(top: 6),
//           height: 8,
//           width: 8,
//           decoration: const BoxDecoration(
//             color: Colors.green,
//             shape: BoxShape.circle,
//           ),
//         ),
//         const SizedBox(width: 8),
//         Expanded(
//           child: Text(
//             text,
//             style: const TextStyle(fontSize: 14, height: 1.3),
//           ),
//         ),
//       ],
//     );
//   }
//
// }

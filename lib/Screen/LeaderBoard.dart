import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/appcolor.dart';
import 'account.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({super.key});

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen>
    with TickerProviderStateMixin {
  String selectedGroup = 'Group A';
  final List<String> groups = ['Group A', 'Group B', 'Group C'];
  int selectedNavIndex = 1;

  late AnimationController _controller;
  late Animation<Offset> anim1;
  late Animation<Offset> anim2;
  late Animation<Offset> anim3;

  late Animation<Offset> p1;
  late Animation<Offset> p2;
  late Animation<Offset> p3;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    anim1 = Tween(begin: const Offset(0, -0.4), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    anim2 = Tween(begin: const Offset(0, -0.4), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.7, curve: Curves.easeOut),
      ),
    );

    anim3 = Tween(begin: const Offset(0, -0.4), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
      ),
    );

    p1 = Tween(begin: const Offset(0, 0.6), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.40, curve: Curves.easeOut),
      ),
    );

    p2 = Tween(begin: const Offset(0, 0.6), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.20, 0.60, curve: Curves.easeOut),
      ),
    );

    p3 = Tween(begin: const Offset(0, 0.6), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.30, 0.65, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColor>()!;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colors.background,
      body: Stack(
        children: [
          // BG IMAGE
          // BG IMAGE
          Container(
            width: width,
            height: height,
            child: Stack(
              children: [
                Image.asset(
                  "assets/Lead_Bg.png",
                  width: width,
                  height: height,
                  fit: BoxFit.cover,
                ),
                if (Theme.of(context).brightness == Brightness.dark)
                  Container(
                    width: width,
                    height: height,
                    color: Colors.black.withOpacity(0.8),
                  ),
              ],
            ),
          ),


          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: height * 0.045,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.arrow_back_ios_new,
                              color: colors.black, size: width * 0.045),
                        ),
                      ),
                      Text(
                        "LeaderBoard",
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w600,
                          color: colors.black,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedGroup,
                            dropdownColor: colors.background,
                            icon: Icon(Icons.keyboard_arrow_down, size: width * 0.05, color: colors.black),
                            style: GoogleFonts.poppins(
                              fontSize: width * 0.035,
                              color: colors.black,
                            ),
                            items: groups.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) =>
                                setState(() => selectedGroup = newValue!),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.02),

                // 3 PILLARS
                SizedBox(
                  height: height * 0.48,
                  width: width,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: height * 0.03,
                        child: SlideTransition(
                          position: p1,
                          child: _buildTeamColumn(
                            width: width * 0.24,
                            height: height * 0.33,
                            team: "Team 3",
                            points: "7 Points",
                            rank: "1",
                            imagePath: "assets/Lead_1.png",
                            colors: colors,
                          ),
                        ),
                      ),
                      Positioned(
                        left: width * 0.10,
                        bottom: height * 0.03,
                        child: SlideTransition(
                          position: p2,
                          child: _buildTeamColumn(
                            width: width * 0.24,
                            height: height * 0.26,
                            team: "Team 1",
                            points: "6 Points",
                            rank: "2",
                            imagePath: "assets/Lead_2.png",
                            colors: colors,
                          ),
                        ),
                      ),
                      Positioned(
                        right: width * 0.10,
                        bottom: height * 0.04,
                        child: SlideTransition(
                          position: p3,
                          child: _buildTeamColumn(
                            width: width * 0.24,
                            height: height * 0.20,
                            team: "Team 2",
                            points: "5 Points",
                            rank: "3",
                            imagePath: "assets/Lead_2.png",
                            colors: colors,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.02),
              ],
            ),
          ),

          // TEAM DETAILS
          Positioned(
            top: height * 0.55,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.45,
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              decoration: BoxDecoration(
                color: colors.background.withOpacity(0.6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.02),
                  Text(
                    "Team Details",
                    style: GoogleFonts.poppins(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.w600,
                        color: colors.black),
                  ),
                  SizedBox(height: height * 0.02),
                  SlideTransition(
                    position: anim1,
                    child: _buildTeamCard(4, "Team 4", "2 Points", colors),
                  ),
                  SizedBox(height: height * 0.02),
                  SlideTransition(
                    position: anim2,
                    child: _buildTeamCard(5, "Team 5", "2 Points", colors),
                  ),
                  SizedBox(height: height * 0.02),
                  SlideTransition(
                    position: anim3,
                    child: _buildTeamCard(6, "Team 6", "2 Points", colors),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamColumn({
    required double width,
    required double height,
    required String team,
    required String points,
    required String rank,
    required String imagePath,
    required AppColor colors,
  }) {
    return Column(
      children: [
        CircleAvatar(backgroundImage: AssetImage(imagePath), radius: 22),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: colors.greenShade,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(points,
              style: const TextStyle(color: Colors.white, fontSize: 12)),
        ),
        const SizedBox(height: 6),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colors.greenShade.withOpacity(0.8),
                colors.background.withOpacity(0.8),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(70),
              topRight: Radius.circular(70),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(team,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: colors.black)),
              Text(rank,
                  style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: colors.black)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTeamCard(int rank, String team, String points, AppColor colors) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: colors.greenShade.withOpacity(0.8),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Text(rank.toString(),
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: colors.black)),
          const SizedBox(width: 15),
          CircleAvatar(
              backgroundImage: const AssetImage("assets/Lead_4.png"),
              radius: 18),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(team,
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: colors.black)),
                Text(points,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: colors.black.withOpacity(0.7))),
              ],
            ),
          ),
          Icon(Icons.keyboard_arrow_down, color: colors.black),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'account.dart';
//
// class LeaderBoardScreen extends StatefulWidget {
//   const LeaderBoardScreen({super.key});
//
//   @override
//   State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
// }
//
// class _LeaderBoardScreenState extends State<LeaderBoardScreen>
//     with TickerProviderStateMixin {
//   String selectedGroup = 'Group A';
//   final List<String> groups = ['Group A', 'Group B', 'Group C'];
//   int selectedNavIndex = 1;
//
//   //  Animation Variables
//   late AnimationController _controller;
//   late Animation<Offset> anim1;
//   late Animation<Offset> anim2;
//   late Animation<Offset> anim3;
//
//   late Animation<Offset> p1;
//   late Animation<Offset> p2;
//   late Animation<Offset> p3;
//
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 2000),
//     );
//
//     anim1 = Tween(begin: const Offset(0, -0.4), end: Offset.zero).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
//       ),
//     );
//
//     anim2 = Tween(begin: const Offset(0, -0.4), end: Offset.zero).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: const Interval(0.2, 0.7, curve: Curves.easeOut),
//       ),
//     );
//
//     anim3 = Tween(begin: const Offset(0, -0.4), end: Offset.zero).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
//       ),
//     );
//
//     p1 = Tween(begin: const Offset(0, 0.6), end: Offset.zero).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: const Interval(0.0, 0.40, curve: Curves.easeOut),
//       ),
//     );
//
//     p2 = Tween(begin: const Offset(0, 0.6), end: Offset.zero).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: const Interval(0.20, 0.60, curve: Curves.easeOut),
//       ),
//     );
//
//     p3 = Tween(begin: const Offset(0, 0.6), end: Offset.zero).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: const Interval(0.30, 0.65, curve: Curves.easeOut),
//       ),
//     );
//
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
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFFFFDF5),
//       body: Stack(
//         children: [
//           // BG IMAGE
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/Lead_Bg.png"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: width * 0.04,
//                     vertical: height * 0.045,
//                   ),
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: GestureDetector(
//                           onTap: () => Navigator.pop(context),
//                           child: Icon(Icons.arrow_back_ios_new,
//                               color: Colors.black, size: width * 0.045),
//                         ),
//                       ),
//
//                       // TITLE
//                       Text(
//                         "LeaderBoard",
//                         style: TextStyle(
//                           fontSize: width * 0.05,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//
//                       // DROPDOWN
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: DropdownButtonHideUnderline(
//                           child: DropdownButton<String>(
//                             value: selectedGroup,
//                             dropdownColor: const Color(0xFFFFFDF5),
//                             icon: Icon(Icons.keyboard_arrow_down, size: width * 0.05),
//                             style: GoogleFonts.poppins(
//                               fontSize: width * 0.035,
//                               color: Colors.black,
//                             ),
//                             items: groups.map((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(value),
//                               );
//                             }).toList(),
//                             onChanged: (newValue) =>
//                                 setState(() => selectedGroup = newValue!),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 SizedBox(height: height * 0.02),
//
//                 // 3 PILLARS
//                 SizedBox(
//                   height: height * 0.48,
//                   width: width,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Positioned(
//                         top: height * 0.03,
//                         child: SlideTransition(
//                           position: p1,
//                           child: _buildTeamColumn(
//                             width: width * 0.24,
//                             height: height * 0.33,
//                             team: "Team 3",
//                             points: "7 Points",
//                             rank: "1",
//                             imagePath: "assets/Lead_1.png",
//                           ),
//                         ),
//                       ),
//
//
//                       Positioned(
//                         left: width * 0.10,
//                         bottom: height * 0.03,
//                         child: SlideTransition(
//                           position: p2,
//                           child: _buildTeamColumn(
//                             width: width * 0.24,
//                             height: height * 0.26,
//                             team: "Team 1",
//                             points: "6 Points",
//                             rank: "2",
//                             imagePath: "assets/Lead_2.png",
//                           ),
//                         ),
//                       ),
//
//
//                       Positioned(
//                         right: width * 0.10,
//                         bottom: height * 0.04,
//                         child: SlideTransition(
//                           position: p3,
//                           child: _buildTeamColumn(
//                             width: width * 0.24,
//                             height: height * 0.20,
//                             team: "Team 2",
//                             points: "5 Points",
//                             rank: "3",
//                             imagePath: "assets/Lead_2.png",
//                           ),
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//
//                 SizedBox(height: height * 0.02),
//               ],
//             ),
//           ),
//
//           // TEAM DETAILS
//           Positioned(
//             top: height * 0.55,
//             left: 0,
//             right: 0,
//             child: Container(
//               height: height * 0.45,
//               padding: EdgeInsets.symmetric(horizontal: width * 0.06),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFFFFDF5).withOpacity(0.5),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: height * 0.02),
//
//                   Text(
//                     "Team Details",
//                     style: GoogleFonts.poppins(
//                         fontSize: width * 0.045,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   SizedBox(height: height * 0.02),
//
//                   //  ANIMATED CARDS
//                   SlideTransition(
//                     position: anim1,
//                     child: _buildTeamCard(4, "Team 4", "2 Points"),
//                   ),
//                   SizedBox(height: height * 0.02),
//
//                   SlideTransition(
//                     position: anim2,
//                     child: _buildTeamCard(5, "Team 5", "2 Points"),
//                   ),
//                   SizedBox(height: height * 0.02),
//
//                   SlideTransition(
//                     position: anim3,
//                     child: _buildTeamCard(6, "Team 6", "2 Points"),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // TEAM PILLAR WIDGET
//   Widget _buildTeamColumn({
//     required double width,
//     required double height,
//     required String team,
//     required String points,
//     required String rank,
//     required String imagePath,
//     //required Animation<Offset> animation,
//   }) {
//     return Column(
//       children: [
//         CircleAvatar(backgroundImage: AssetImage(imagePath), radius: 22),
//         const SizedBox(height: 6),
//
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//           decoration: BoxDecoration(
//             color: Colors.green[700],
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Text(points,
//               style: const TextStyle(color: Colors.white, fontSize: 12)),
//         ),
//
//         const SizedBox(height: 6),
//
//         Container(
//           width: width,
//           height: height,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromRGBO(24, 133, 16, 0.39),
//                 Color.fromRGBO(255, 255, 255, 0.39),
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(70),
//               topRight: Radius.circular(70),
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(team,
//                   style: GoogleFonts.poppins(
//                       fontSize: 14, fontWeight: FontWeight.w500)),
//               Text(rank,
//                   style: GoogleFonts.poppins(
//                       fontSize: 22, fontWeight: FontWeight.bold)),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   // TEAM CARD WIDGET
//   Widget _buildTeamCard(int rank, String team, String points) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//       decoration: BoxDecoration(
//         color: Colors.green[100],
//         borderRadius: BorderRadius.circular(14),
//       ),
//       child: Row(
//         children: [
//           Text(rank.toString(),
//               style: GoogleFonts.poppins(
//                   fontSize: 16, fontWeight: FontWeight.w500)),
//           const SizedBox(width: 15),
//
//           const CircleAvatar(
//               backgroundImage: AssetImage("assets/Lead_4.png"), radius: 18),
//
//           const SizedBox(width: 15),
//
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(team,
//                     style: GoogleFonts.poppins(
//                         fontSize: 15, fontWeight: FontWeight.w600)),
//                 Text(points,
//                     style: GoogleFonts.poppins(
//                         fontSize: 13, color: Colors.black54)),
//               ],
//             ),
//           ),
//
//           const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
//         ],
//       ),
//     );
//   }
// }

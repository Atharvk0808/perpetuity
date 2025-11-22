import 'package:flutter/material.dart';
import '../theme/appcolor.dart';
import 'TournamentDetails.dart';

class AllTournaments extends StatefulWidget {
  const AllTournaments({super.key});

  @override
  State<AllTournaments> createState() => _AllTournamentsState();
}

class _AllTournamentsState extends State<AllTournaments> {
  int selectedCategory = 0;
  int selectedNavIndex = 1;

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.sports_cricket, 'name': 'Cricket'},
    {'icon': Icons.sports_soccer, 'name': 'Football'},
    {'icon': Icons.sports_basketball, 'name': 'Basketball'},
    {'icon': Icons.sports_tennis, 'name': 'Badminton'},
    {'icon': Icons.sports_hockey, 'name': 'Hockey'},
  ];

  final List<Map<String, dynamic>> tournaments = [
    {
      'image': "assets/home_2.png",
      'title': 'City Cricket Tournament',
      'location': 'B Commercial Square, Thane Road Pune',
      'time': '4 Nov, 7:00 A.M',
      'joined': true,
    },
    {
      'image': 'assets/home_3.png',
      'title': 'State Cricket Tournament',
      'location': 'B Commercial Square, Thane Road Pune',
      'time': '4 Nov, 7:00 A.M',
      'joined': false,
    },
    {
      'image': 'assets/home_4.png',
      'title': 'City Cricket Tournament',
      'location': 'B Commercial Square, Thane Road Pune',
      'time': '4 Nov, 7:00 A.M',
      'joined': false,
    },
    {
      'image': 'assets/home_2.png',
      'title': 'City Cricket Tournament',
      'location': 'B Commercial Square, Thane Road Pune',
      'time': '4 Nov, 7:00 A.M',
      'joined': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColor>()!;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final cardImageSize = width * 0.22;

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Column(
          children: [
            /// HEADER
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.015,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: colors.black,
                      size: width * 0.045,
                    ),
                  ),
                  Text(
                    "All Tournament",
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w600,
                      color: colors.black,
                    ),
                  ),
                  SizedBox(width: width * 0.05),
                ],
              ),
            ),

            /// CATEGORY LIST
            SizedBox(
              height: height * 0.20,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  bool isSelected = index == selectedCategory;

                  return GestureDetector(
                    onTap: () => setState(() => selectedCategory = index),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.04,
                        vertical: height * 0.03,
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(width * 0.02),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                              isSelected ? colors.greenShade.withOpacity(0.1) : Colors.transparent,
                              border: Border.all(
                                color: isSelected
                                    ? colors.greenShade
                                    : colors.black.withOpacity(0.3),
                              ),
                            ),
                            child: Icon(
                              categories[index]['icon'],
                              size: width * 0.08,
                              color: colors.black,
                            ),
                          ),
                          SizedBox(height: height * 0.008),
                          Text(
                            categories[index]['name'],
                            style: TextStyle(
                              fontSize: width * 0.032,
                              color: colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            /// TOURNAMENT LIST
            Expanded(
              child: ListView.builder(
                itemCount: tournaments.length,
                itemBuilder: (context, index) {
                  final t = tournaments[index];

                  return Column(
                    children: [
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            t['image'],
                            width: cardImageSize,
                            height: cardImageSize * 0.8,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          t['title'],
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.045,
                            color: colors.black,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              t['location'],
                              style: TextStyle(
                                fontSize: width * 0.032,
                                color: colors.black.withOpacity(0.7),
                              ),
                            ),
                            Text(
                              t['time'],
                              style: TextStyle(
                                fontSize: width * 0.032,
                                color: colors.black.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),

                        trailing: (t['joined'])
                            ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TournamentDetails(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: height * 0.007,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Joined",
                              style: TextStyle(
                                fontSize: width * 0.034,
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                            : null,
                      ),

                      Divider(
                        color: colors.black.withOpacity(0.15),
                        indent: width * 0.04,
                        endIndent: width * 0.04,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'TournamentDetails.dart';
//
// class AllTournaments extends StatefulWidget {
//   const AllTournaments({super.key});
//
//   @override
//   State<AllTournaments> createState() => _AllTournamentsState();
// }
//
// class _AllTournamentsState extends State<AllTournaments> {
//   int selectedCategory = 0;
//   int selectedNavIndex = 1;
//
//   final List<Map<String, dynamic>> categories = [
//     {'icon': Icons.sports_cricket, 'name': 'Cricket'},
//     {'icon': Icons.sports_soccer, 'name': 'Football'},
//     {'icon': Icons.sports_basketball, 'name': 'Basketball'},
//     {'icon': Icons.sports_tennis, 'name': 'Badminton'},
//     {'icon': Icons.sports_hockey, 'name': 'Hockey'},
//   ];
//
//   final List<Map<String, dynamic>> tournaments = [
//     {
//       'image': "assets/home_2.png",
//       'title': 'City Cricket Tournament',
//       'location': 'B Commercial Square, Thane Road Pune',
//       'time': '4 Nov, 7:00 A.M',
//       'joined': true,
//     },
//     {
//       'image': 'assets/home_3.png',
//       'title': 'State Cricket Tournament',
//       'location': 'B Commercial Square, Thane Road Pune',
//       'time': '4 Nov, 7:00 A.M',
//       'joined': false,
//     },
//     {
//       'image': 'assets/home_4.png',
//       'title': 'City Cricket Tournament',
//       'location': 'B Commercial Square, Thane Road Pune',
//       'time': '4 Nov, 7:00 A.M',
//       'joined': false,
//     },
//     {
//       'image': 'assets/home_2.png',
//       'title': 'City Cricket Tournament',
//       'location': 'B Commercial Square, Thane Road Pune',
//       'time': '4 Nov, 7:00 A.M',
//       'joined': false,
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     final cardImageSize = width * 0.22;
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFFDFDFD),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: width * 0.04,
//                 vertical: height * 0.015,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Icon(Icons.arrow_back_ios_new,
//                         color: Colors.black, size: width * 0.045),
//                   ),
//                   Text(
//                     "All Tournament",
//                     style: TextStyle(
//                       fontSize: width * 0.05,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   SizedBox(width: width * 0.05),
//                 ],
//               ),
//             ),
//
//
//             SizedBox(
//               height: height * 0.20,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 padding: EdgeInsets.symmetric(horizontal: width * 0.02),
//                 itemCount: categories.length,
//                 itemBuilder: (context, index) {
//                   bool isSelected = index == selectedCategory;
//
//                   return GestureDetector(
//                     onTap: () => setState(() => selectedCategory = index),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: width * 0.04,
//                         vertical: height * 0.03,
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.all(width * 0.02),
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: isSelected
//                                   ? Colors.green.shade100
//                                   : Colors.transparent,
//                               border: Border.all(
//                                 color: isSelected
//                                     ? Colors.green
//                                     : Colors.grey.shade400,
//                               ),
//                             ),
//                             child: Icon(
//                               categories[index]['icon'],
//                               size: width * 0.08,
//                               color: Colors.black,
//                             ),
//                           ),
//                           SizedBox(height: height * 0.008),
//                           Text(
//                             categories[index]['name'],
//                             style: TextStyle(fontSize: width * 0.032),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//
//
//             Expanded(
//               child: ListView.builder(
//                 itemCount: tournaments.length,
//                 itemBuilder: (context, index) {
//                   final t = tournaments[index];
//
//                   return Column(
//                     children: [
//                       ListTile(
//                         leading: ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: Image.asset(
//                             t['image'],
//                             width: cardImageSize,
//                             height: cardImageSize * 0.8,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         title: Text(
//                           t['title'],
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: width * 0.045,
//                           ),
//                         ),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(t['location'], style: TextStyle(fontSize: width * 0.032)),
//                             Text(t['time'], style: TextStyle(fontSize: width * 0.032)),
//                           ],
//                         ),
//
//                         trailing: (t['joined'])
//                             ? GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) => TournamentDetails(),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: width * 0.03,
//                               vertical: height * 0.007,
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.green.shade100,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Text(
//                               "Joined",
//                               style: TextStyle(
//                                 fontSize: width * 0.034,
//                                 color: Colors.green,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         )
//                             : null,
//                       ),
//
//                       Divider(
//                         color: Colors.grey.shade300,
//                         indent: width * 0.04,
//                         endIndent: width * 0.04,
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../theme/appcolor.dart';
import 'all_tournaments.dart';
import 'account.dart';
import 'LeaderBoard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final PageController _pageController = PageController();

  final List<Widget> pages = const [
    HomeMainContent(),
    AllTournaments(),
    LeaderBoardScreen(),
    AccountScreen(),
  ];

  void onNavTap(int index) {
    setState(() => selectedIndex = index);

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColor>()!;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colors.background,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() => selectedIndex = value);
            },
            children: pages,
          ),

          // CUSTOM NAVBAR
          Positioned(
            bottom: 25,
            left: (width - 229) / 2,
            child: Container(
              width: 229,
              height: 57,
              decoration: BoxDecoration(
                color: colors.black,
                borderRadius: BorderRadius.circular(186),
                boxShadow: [
                  BoxShadow(
                    color: colors.black.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  final icons = [
                    Icons.home,
                    Icons.list,
                    Icons.emoji_events,
                    Icons.account_circle,
                  ];

                  bool isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () => onNavTap(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 45,
                      height: 40,
                      decoration: BoxDecoration(
                        color:
                        isSelected ? colors.white : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        icons[index],
                        color: isSelected ? colors.black : Colors.grey,
                        size: 26,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class HomeMainContent extends StatefulWidget {
  const HomeMainContent({super.key});

  @override
  State<HomeMainContent> createState() => _HomeMainContentState();
}

class _HomeMainContentState extends State<HomeMainContent> {
  bool showShimmer = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showShimmer = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final colors = Theme.of(context).extension<AppColor>()!;

    return showShimmer
        ? _buildShimmerUI(width)
        : _buildOriginalUI(width, colors);
  }

  Widget _buildShimmerUI(double width) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: _buildOriginalUI(width, null),
    );
  }

  Widget _buildOriginalUI(double width, AppColor? colors) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),

          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/landing_1.png'),
              ),
              Column(
                children: [
                  Text(
                    "Hello, Sandra",
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Today 3 Nov",
                    style: TextStyle(
                      color: colors?.black.withOpacity(0.6) ?? Colors.grey,
                    ),
                  ),
                ],
              ),
              Icon(Icons.circle_notifications_sharp,
                  size: 30,
                  color: colors?.black ?? Colors.black),
            ],
          ),

          const SizedBox(height: 20),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/home_1.png', fit: BoxFit.cover),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _sportIcon(Icons.sports_cricket, "Cricket", colors),
              _sportIcon(Icons.sports_football, "Football", colors),
              _sportIcon(Icons.sports_basketball, "Basketball", colors),
              _sportIcon(Icons.sports_tennis, "Badminton", colors),
            ],
          ),

          const SizedBox(height: 25),

          _titleRow("Tournaments", "See all", colors),
          const SizedBox(height: 10),

          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _tournamentCard('assets/home_2.png'),
                _tournamentCard('assets/home_3.png'),
                _tournamentCard('assets/home_4.png'),
              ],
            ),
          ),

          const SizedBox(height: 25),

          _titleRow("Active Tournaments", "See all", colors),
          const SizedBox(height: 10),

          _activeTournamentCard(colors),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _sportIcon(IconData icon, String name, AppColor? colors) => Column(
    children: [
      CircleAvatar(
        radius: 22,
        backgroundColor: Colors.green[100],
        child: Icon(icon, color: Colors.green),
      ),
      const SizedBox(height: 5),
      Text(name),
    ],
  );

  Widget _titleRow(String left, String right, AppColor? colors) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(left,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600)),
      Text(
        right,
        style: TextStyle(
          color: Colors?.green ?? Colors.green,
        ),
      ),
    ],
  );

  Widget _tournamentCard(String imagePath) => Padding(
    padding: const EdgeInsets.only(right: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(imagePath, width: 200, fit: BoxFit.cover),
    ),
  );

  Widget _activeTournamentCard(AppColor? colors) => Container(
    decoration: BoxDecoration(
      color: colors?.card ?? Colors.green[50],
      borderRadius: BorderRadius.circular(20),
    ),
    padding: const EdgeInsets.all(15),
    child: Row(
      children: [
        Image.asset('assets/home_3.png',
            width: 60, height: 80, fit: BoxFit.cover),
        const SizedBox(width: 15),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Score Card",
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
            Text("Group A",style: TextStyle(color: Colors.black),),
          ],
        ),
        const Spacer(),
        Chip(
          label: const Text("Cricket"),
          backgroundColor: colors?.greenShade.withOpacity(0.2),
        ),
      ],
    ),
  );
}



// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'all_tournaments.dart';
// import 'account.dart';
// import 'LeaderBoard.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int selectedIndex = 0;
//
//   final PageController _pageController = PageController();
//
//   final List<Widget> pages = const [
//     HomeMainContent(),
//     AllTournaments(),
//     LeaderBoardScreen(),
//     AccountScreen(),
//   ];
//
//   void onNavTap(int index) {
//     setState(() => selectedIndex = index);
//
//     _pageController.animateToPage(
//       index,
//       duration: const Duration(milliseconds: 350),
//       curve: Curves.easeInOut,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFFFFDF5),
//       body: Stack(
//         children: [
//           PageView(
//             controller: _pageController,
//             onPageChanged: (value) {
//               setState(() => selectedIndex = value);
//             },
//             children: pages,
//           ),
//
//           // CUSTOM NAVBAR
//           Positioned(
//             bottom: 25,
//             left: (width - 229) / 2,
//             child: Container(
//               width: 229,
//               height: 57,
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.circular(186),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.2),
//                     blurRadius: 8,
//                     offset: const Offset(0, 4),
//                   )
//                 ],
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: List.generate(4, (index) {
//                   final icons = [
//                     Icons.home,
//                     Icons.list,
//                     Icons.emoji_events,
//                     Icons.account_circle,
//                   ];
//
//                   bool isSelected = selectedIndex == index;
//
//                   return GestureDetector(
//                     onTap: () => onNavTap(index),
//                     child: AnimatedContainer(
//                       duration: const Duration(milliseconds: 200),
//                       width: 45,
//                       height: 40,
//                       decoration: BoxDecoration(
//                         color:
//                         isSelected ? Colors.white : Colors.transparent,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         icons[index],
//                         color: isSelected ? Colors.black : Colors.grey,
//                         size: 26,
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class HomeMainContent extends StatefulWidget {
//   const HomeMainContent({super.key});
//
//   @override
//   State<HomeMainContent> createState() => _HomeMainContentState();
// }
//
// class _HomeMainContentState extends State<HomeMainContent> {
//   bool showShimmer = true;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // CHANGE SECONDS HERE
//     Future.delayed(const Duration(seconds: 2), () {
//       setState(() {
//         showShimmer = false;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//
//
//     return showShimmer
//         ? _buildShimmerUI(width)
//         : _buildOriginalUI(width);
//   }
//
//
//   Widget _buildShimmerUI(double width) {
//     return Shimmer.fromColors(
//       baseColor: Colors.grey.shade300,
//       highlightColor: Colors.grey.shade100,
//       child: _buildOriginalUI(width),
//     );
//   }
//
//   Widget _buildOriginalUI(double width) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 40),
//
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const CircleAvatar(
//                 radius: 20,
//                 backgroundImage: AssetImage('assets/landing_1.png'),
//               ),
//               Column(
//                 children: [
//                   Text(
//                     "Hello, Sandra",
//                     style: TextStyle(
//                       fontSize: width * 0.05,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const Text("Today 3 Nov",
//                       style: TextStyle(color: Colors.grey)),
//                 ],
//               ),
//               const Icon(Icons.notifications, color: Colors.black),
//             ],
//           ),
//
//           const SizedBox(height: 20),
//
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: Image.asset('assets/home_1.png', fit: BoxFit.cover),
//           ),
//
//           const SizedBox(height: 20),
//
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               _sportIcon(Icons.sports_cricket, "Cricket"),
//               _sportIcon(Icons.sports_football, "Football"),
//               _sportIcon(Icons.sports_basketball, "Basketball"),
//               _sportIcon(Icons.sports_tennis, "Badminton"),
//             ],
//           ),
//
//           const SizedBox(height: 25),
//
//           _titleRow("Tournaments", "See all"),
//           const SizedBox(height: 10),
//
//           SizedBox(
//             height: 150,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: [
//                 _tournamentCard('assets/home_2.png'),
//                 _tournamentCard('assets/home_3.png'),
//                 _tournamentCard('assets/home_4.png'),
//               ],
//             ),
//           ),
//
//           const SizedBox(height: 25),
//
//           _titleRow("Active Tournaments", "See all"),
//           const SizedBox(height: 10),
//
//           _activeTournamentCard(),
//           const SizedBox(height: 100),
//         ],
//       ),
//     );
//   }
//
//
//   Widget _sportIcon(IconData icon, String name) => Column(
//     children: [
//       CircleAvatar(
//         radius: 22,
//         backgroundColor: Colors.green[100],
//         child: Icon(icon, color: Colors.green),
//       ),
//       const SizedBox(height: 5),
//       Text(name),
//     ],
//   );
//
//   Widget _titleRow(String left, String right) => Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text(left,
//           style: const TextStyle(
//               fontSize: 18, fontWeight: FontWeight.w600)),
//       Text(right, style: const TextStyle(color: Colors.green)),
//     ],
//   );
//
//   Widget _tournamentCard(String imagePath) => Padding(
//     padding: const EdgeInsets.only(right: 10),
//     child: ClipRRect(
//       borderRadius: BorderRadius.circular(15),
//       child:
//       Image.asset(imagePath, width: 200, fit: BoxFit.cover),
//     ),
//   );
//
//   Widget _activeTournamentCard() => Container(
//     decoration: BoxDecoration(
//       color: Colors.green[50],
//       borderRadius: BorderRadius.circular(20),
//     ),
//     padding: const EdgeInsets.all(15),
//     child: Row(
//       children: [
//         Image.asset('assets/home_3.png',
//             width: 60, height: 80, fit: BoxFit.cover),
//         const SizedBox(width: 15),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: const [
//             Text("Score Card",
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//             Text("Group A"),
//           ],
//         ),
//         const Spacer(),
//         const Chip(label: Text("Cricket")),
//       ],
//     ),
//   );
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'assets.dart';
// import 'styles.dart';

// final currentPageProvider = StateProvider<int>(
//   (ref) => 0,
// );

// class BottomNavigation extends ConsumerWidget {
//   const BottomNavigation({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     int currentPage = ref.watch(currentPageProvider);
//     PageController pageController = PageController(initialPage: currentPage);
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: colorBlackText,
//         selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
//         backgroundColor: Colors.white,
//         onTap: (page) {
//           pageController.animateToPage(page,
//               duration: const Duration(milliseconds: 400), curve: Curves.ease);
//         },
//         currentIndex: currentPage,
//         items: const [
//           BottomNavigationBarItem(
//             label: "Potifólio",
//             icon: portfolioIcon,
//             activeIcon: portfolioActiveIcon,
//           ),
//           BottomNavigationBarItem(
//             label: "Comprar",
//             icon: accountIcon,
//             activeIcon: accountActiveIcon,
//           ),
//           BottomNavigationBarItem(
//             label: "Movimentações",
//             icon: movementsIcon,
//             activeIcon: movementsActiveIcon,
//           ),
//         ],
//       ),
//     );
//   }
// }

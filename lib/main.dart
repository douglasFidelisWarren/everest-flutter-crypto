import 'package:flutter/material.dart';

import 'movements_page.dart';
import 'portfolio_page.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage);
  }

  setCurrentPage(page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          onPageChanged: setCurrentPage,
          controller: pageController,
          children: const [
            PortfolioPage(),
            Movements(),
          ]),
      bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
          backgroundColor: Colors.white,
          onTap: (page) {
            pageController.animateToPage(page,
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease);
          },
          currentIndex: currentPage,
          items: const [
            BottomNavigationBarItem(
              label: "Potifólio",
              icon: Image(
                image: AssetImage("assets/images/warrenOff.png"),
              ),
              activeIcon: Image(
                image: AssetImage("assets/images/warren.png"),
              ),
            ),
            BottomNavigationBarItem(
              label: "Movimentações",
              icon: Image(
                image: AssetImage("assets/images/cryptoOff.png"),
              ),
              activeIcon: Image(
                image: AssetImage("assets/images/crypto.png"),
              ),
            ),
          ]),
    );
  }
}

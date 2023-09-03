import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:localhost/chat/screens/chat_list.dart';
import 'package:localhost/mypage/screens/mypage.dart';
import 'package:localhost/product/screens/product_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localhost/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: ColorPolyfill.getSurfaceContainer(Theme.of(context).colorScheme.brightness),
        surfaceTintColor: Colors.transparent,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedIndex: _selectedIndex,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home),
            selectedIcon: const Icon(Icons.home_filled),
            label: appLocalizations.bottom_navigation_home,
          ),
          NavigationDestination(
            icon: const Icon(Icons.chat_bubble_outline),
            selectedIcon: const Icon(Icons.chat_bubble),
            label: appLocalizations.bottom_navigation_chat,
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_outline),
            selectedIcon: const Icon(Icons.person),
            label: appLocalizations.bottom_navigation_mypage,
          ),
        ],
      ),
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
          return FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: const [
          ProductListPage(),
          ChatListPage(),
          Mypage(),
        ][_selectedIndex],
      ),
    );
  }
}

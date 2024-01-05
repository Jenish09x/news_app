import 'package:flutter/material.dart';
import 'package:news_app/home/view/home_screen.dart';
import 'package:news_app/news/view/news_screen.dart';
import 'package:provider/provider.dart';

import '../provider/dash_provider.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  DashProvider? providerR;
  DashProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<DashProvider>();
    providerW = context.watch<DashProvider>();
    List<Widget> screen = [
      const HomeScreen(),
      const NewsScreen(),
    ];
    return SafeArea(
      child: Scaffold(
        body: screen[providerW!.stepIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            providerR!.changeStep(index);
          },
          indicatorColor: Colors.amber,
          selectedIndex: providerR!.stepIndex,
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Badge(child: Icon(Icons.search)),
              selectedIcon: Badge(
                child: Icon(Icons.search_off),
              ),
              label: 'News',
            ),
          ],
        ),
      ),
    );
  }
}

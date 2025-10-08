import 'package:flutter/material.dart';
// import 'package:prayer_ml/prayers/home/home.dart';
import 'package:prayer_ml/prayers/home/new_home.dart';
import 'package:prayer_ml/prayers/settings/settings.dart';
import './groups/groups.dart';

class PrayersPage extends StatefulWidget {
  const PrayersPage({super.key});

  @override
  State<PrayersPage> createState() => _PrayersPageState();
}

class _PrayersPageState extends State<PrayersPage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {


    return PopScope(
      canPop: false,
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: const <Widget> [
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.book_outlined),
              selectedIcon: Icon(Icons.book),
              label: 'Notebooks',
            ),
            NavigationDestination(
              icon: Icon(Icons.manage_accounts_outlined),
              selectedIcon: Icon(Icons.manage_accounts),
              label: 'Account',
            ),
          ],
          selectedIndex: pageIndex,
          onDestinationSelected: (value) => setState(() => pageIndex = value),
        ),
        body: const <Widget> [
          NewHomePage(),
          Groups(),
          AccountSettingsPage(),
        ][pageIndex],
      ),
    );
  }
}
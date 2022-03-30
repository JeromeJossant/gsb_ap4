import 'package:flutter/material.dart';
import 'package:gsb_ap4/main.dart';
import 'package:gsb_ap4/screen/pays.dart';
import '../main.dart';
import 'departements.dart';
import 'medecinSearch.dart';
import 'medecins.dart';
import 'specialiteComplementaire.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _Main();
}

class _Main extends State<Main> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  // Avoiding state-related errors
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const <Widget>[
          MedecinsScreen(),
          MedecinSearchScreen(),
          SpecialiteScreen(),
          PaysScreen()
        ],
      ),
      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => _pageController.jumpToPage(index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.vaccines),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: "Recherche",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room),
            label: "Département",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.travel_explore),
            label: "Pays",
          ),
        ],
        unselectedItemColor: Colors.black38,
        backgroundColor: Colors.white,
      ),
    );
  }
}

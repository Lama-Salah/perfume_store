import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfume_store/models/bn_screen.dart';
import 'package:perfume_store/screens/bn_screens/categories_screen.dart';
import 'package:perfume_store/screens/bn_screens/favorite_screen.dart';
import 'package:perfume_store/screens/bn_screens/home_screen.dart';
import 'package:perfume_store/screens/bn_screens/profile_screen.dart';
import 'package:perfume_store/widget/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<BnScreen> _bnScreens = <BnScreen>[
    const BnScreen(title: 'Home', widget: Home()),
    const BnScreen(title: 'Categories', widget: CategoriesScreen()),
    const BnScreen(title: 'Favorite', widget: FavouriteScreen()),
    const BnScreen(title: 'Profile', widget: ProfileScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _bnScreens[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value) {
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,

        type: BottomNavigationBarType.fixed,

        showSelectedLabels: true,
        showUnselectedLabels: true,

        // backgroundColor: HexColor("#01221D"),
        backgroundColor: Colors.white,
        elevation: 10,

        selectedItemColor: secoundColor,
        selectedIconTheme:  IconThemeData(
          color: secoundColor,
        ),
        selectedFontSize: 14.sp,
        selectedLabelStyle: TextStyle(letterSpacing: 2.sp),

        unselectedItemColor: mainColor,
        unselectedIconTheme: IconThemeData(color: mainColor),
        unselectedFontSize: 12,
        unselectedLabelStyle:
             GoogleFonts.poppins(fontWeight: FontWeight.w300, letterSpacing: 1),

        iconSize: 18,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.category),
            activeIcon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.favorite),
            activeIcon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}

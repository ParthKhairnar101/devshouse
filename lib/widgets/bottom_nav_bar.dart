import 'package:flutter/material.dart';
import '../pages/home.dart';
import '../pages/money.dart';
import '../pages/profile.dart';
import '../TransactionPage/transactionMain.dart';

class HomePaget extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePaget> {
  late int _currentPageIndex;
  final List<Widget> _pages = [
    HomePager(),
    PaymentsPage(),
    TransPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
  }

  void _updatePageIndex(int newIndex) {
    setState(() {
      _currentPageIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: IndexedStack(
              index: _currentPageIndex,
              children: _pages,
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff7ef2b0),
                borderRadius: BorderRadius.circular(40),
              ),
              padding: EdgeInsets.all(8), // Adjust the padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBottomNavItem(Icons.home, 0, size: 26), // Adjust the icon size
                  _buildBottomNavItem(Icons.swap_horiz, 1, size: 26), // Adjust the icon size
                  _buildBottomNavItem(Icons.receipt, 2, size: 26), // Adjust the icon size
                  _buildBottomNavItem(Icons.person, 3, size: 26), // Adjust the icon size
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, int index, {double size = 20}) { // Add size parameter
    return IconButton(
      icon: Icon(
        icon,
        size: size, // Set the size of the icon
        color: _currentPageIndex == index ? Color(0xff000000) : Colors.white,
      ),
      onPressed: () {
        _updatePageIndex(index);
      },
    );
  }
}

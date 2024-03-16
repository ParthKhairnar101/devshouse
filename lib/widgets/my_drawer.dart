import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('FAQs'),
            onTap: () {
              // Handle FAQs option
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              // Handle Settings option
            },
          ),
          ListTile(
            title: Text('Past Notifications'),
            onTap: () {
              // Handle Past Notifications option
            },
          ),
          ListTile(
            title: Text('Support'),
            onTap: () {
              // Handle Support option
            },
          ),
        ],
      ),
    );
  }
}

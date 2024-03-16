import 'package:flutter/material.dart';

class Tab1 extends StatelessWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tab 1 Content',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

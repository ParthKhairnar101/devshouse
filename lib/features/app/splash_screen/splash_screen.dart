import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({Key? key, this.child}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 4),
          () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => widget.child!),
              (route) => false,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo1.png',
              width: 400,
              height: 400,
            ), // Add spacing between logo and text
            // Text(
            //   "FiNexus",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     color: Colors.white, // White text color for contrast
            //     fontWeight: FontWeight.bold,
            //     fontSize: 46,
            //     fontFamily: 'AbrilFatface', // Using Google font 'AbrilFatface'
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:finexus/features/app/splash_screen/splash_screen.dart';
// import 'package:finexus/features/user_auth/presentation/pages/home_page.dart';
import 'package:finexus/features/user_auth/presentation/pages/login_page.dart';
import 'package:finexus/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:finexus/widgets/bottom_nav_bar.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAJFMDPJf6gU6VUHwAVMVgCq7WoLUvTaro",
        appId: "1:564027917815:android:feb491e494321805411af2",
        messagingSenderId: "564027917815",
        projectId: "finexus-f44cb",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}


// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
// // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // title of the application
//       title: 'Hello World Demo Application',
//       // theme of the widget
//       theme: ThemeData(
//         primarySwatch: Colors.lightGreen,
//       ),
//       // Inner UI of the application
//       home: const MyHomePage(title: 'Home page'),
//     );
//   }
// }
//
// /* This class is similar to MyApp instead it
// returns Scaffold Widget */
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       // Sets the content to the
//       // center of the application page
//       body: const Center(
//         // Sets the content of the Application
//           child: Text(
//             'Welcome to GeeksForGeeks!',
//           )),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      routes: {
        '/': (context) => SplashScreen(
          // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
          child: LoginPage(),
        ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePaget(),
      },
    );
  }
}

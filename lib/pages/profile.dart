import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2f3c65),
      appBar: AppBar(
        title: Text('Profile',style:TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff171f33),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_pic.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'Namansh Maurya',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              '+91 9515337374',
              style: TextStyle(fontSize: 18,color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Divider(),
            Container(
              child: ListTile(
                title: Text('Bank Details',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),),
                onTap: () {
                  print('Navigate to Bank Details');
                },
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Account Security',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),),
              onTap: () {
                print('Navigate to Account Security');
              },
            ),
            Divider(),
            ListTile(
              title: Text('About App',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),),
              onTap: () {
                print('Navigate to About App');
              },
            ),
            Divider(),
            ListTile(
              title: Text('Logout',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),),
              onTap: () {
                print('Logout');
              },
            ),
          ],
        ),
      ),
    );
  }
}

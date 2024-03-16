import 'package:flutter/material.dart';
import 'package:finexus/pages/money.dart';
import 'package:finexus/TransactionPage/transactionMain.dart';
import 'package:finexus/pages/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  late int _currentPageIndex;
  final List<Widget> _pages = [
    HomePage(),
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
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBottomNavItem(Icons.home, 0, size: 26),
                  _buildBottomNavItem(Icons.swap_horiz, 1, size: 26),
                  _buildBottomNavItem(Icons.receipt, 2, size: 26),
                  _buildBottomNavItem(Icons.person, 3, size: 26),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, int index, {double size = 20}) {
    return IconButton(
      icon: Icon(
        icon,
        size: size,
        color: _currentPageIndex == index ? Color(0xff000000) : Colors.white,
      ),
      onPressed: () {
        _updatePageIndex(index);
      },
    );
  }
}












































// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import '../../../../global/common/toast.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           title: Text("HomePage"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   _createData(UserModel(
//                     username: "Henry",
//                     age: 21,
//                     adress: "London",
//                   ));
//                 },
//                 child: Container(
//                   height: 45,
//                   width: 100,
//                   decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Center(
//                     child: Text(
//                       "Create Data",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               StreamBuilder<List<UserModel>>(
//                 stream: _readData(),
//                 builder: (context, snapshot) {
//                   if(snapshot.connectionState == ConnectionState.waiting){
//                     return Center(child: CircularProgressIndicator(),);
//                   } if(snapshot.data!.isEmpty){
//                     return Center(child:Text("No Data Yet"));
//                   }
//                   final users = snapshot.data;
//                   return Padding(padding: EdgeInsets.all(8),
//                   child: Column(
//                     children: users!.map((user) {
//                       return ListTile(
//                         leading: GestureDetector(
//                           onTap: (){
//                             _deleteData(user.id!);
//                           },
//                           child: Icon(Icons.delete),
//                         ),
//                         trailing: GestureDetector(
//                           onTap: (){
//                             _updateData(
//                               UserModel(
//                                 id: user.id,
//                                 username: "John Wick",
//                                 adress: "Pakistan",)
//                             );
//                           },
//                           child: Icon(Icons.update),
//                         ),
//                         title: Text(user.username!),
//                         subtitle: Text(user.adress!),
//                       );
//                     }).toList()
//                   ),);
//                 }
//               ),
//
//               GestureDetector(
//                 onTap: () {
//                   FirebaseAuth.instance.signOut();
//                   Navigator.pushNamed(context, "/login");
//                   showToast(message: "Successfully signed out");
//                 },
//                 child: Container(
//                   height: 45,
//                   width: 100,
//                   decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Center(
//                     child: Text(
//                       "Sign out",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
//
//   Stream<List<UserModel>> _readData(){
//     final userCollection = FirebaseFirestore.instance.collection("users");
//
//     return userCollection.snapshots().map((qureySnapshot)
//     => qureySnapshot.docs.map((e)
//     => UserModel.fromSnapshot(e),).toList());
//   }
//
//   void _createData(UserModel userModel) {
//     final userCollection = FirebaseFirestore.instance.collection("users");
//
//     String id = userCollection.doc().id;
//
//     final newUser = UserModel(
//       username: userModel.username,
//       age: userModel.age,
//       adress: userModel.adress,
//         id: id,
//     ).toJson();
//
//     userCollection.doc(id).set(newUser);
//   }
//
//   void _updateData(UserModel userModel) {
//     final userCollection = FirebaseFirestore.instance.collection("users");
//
//     final newData = UserModel(
//       username: userModel.username,
//       id: userModel.id,
//       adress: userModel.adress,
//       age: userModel.age,
//     ).toJson();
//
//     userCollection.doc(userModel.id).update(newData);
//
//   }
//
//   void _deleteData(String id) {
//     final userCollection = FirebaseFirestore.instance.collection("users");
//
//     userCollection.doc(id).delete();
//
//   }
//
// }
//
// class UserModel{
//   final String? username;
//   final String? adress;
//   final int? age;
//   final String? id;
//
//   UserModel({this.id,this.username, this.adress, this.age});
//
//
//   static UserModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
//     return UserModel(
//       username: snapshot['username'],
//       adress: snapshot['adress'],
//       age: snapshot['age'],
//       id: snapshot['id'],
//     );
//   }
//
//   Map<String, dynamic> toJson(){
//     return {
//       "username": username,
//       "age": age,
//       "id": id,
//       "adress": adress,
//     };
//   }
// }

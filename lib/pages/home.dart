import 'package:flutter/material.dart';
import '../TransactionPage/trans.dart';
import '../TransactionPage/transactionMain.dart';

class HomePager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 20),
            _buildBalanceCard(),
            SizedBox(height: 20),
            TransactionHistory(),
          ],
        ),
      ),
      backgroundColor: kBackgroundColor,
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: kHeaderColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(1),
          bottomRight: Radius.circular(1),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 35,
            left: 340,
            child: _buildNotificationIcon(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Row(
              children: [
                _buildUserProfile(),
                SizedBox(width: 10),
                _buildUserName(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNotificationIcon() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: Container(
        height: 40,
        width: 40,
        color: kNotificationIconColor,
        child: Icon(
          Icons.notifications,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildUserProfile() {
    return Container(
      padding: EdgeInsets.only(bottom: 17.0),
      child: CircleAvatar(
        radius: 27,
        backgroundImage: AssetImage('assets/profile_pic.jpg'),
      ),
    );
  }

  Widget _buildUserName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: kWelcomeTextColor,
          ),
        ),
        Text(
          'Namansh Maurya',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      height: 170,
      width: 430,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(47, 125, 121, 0.3),
            offset: Offset(0, 6),
            blurRadius: 12,
            spreadRadius: 6,
          ),
        ],
        color: kBalanceCardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Balance',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  '\$ ${total()}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 13,
                      backgroundColor: kIncomeColor,
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [Color(0xff282b59), Color(0xff5d60a6)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ).createShader(bounds);
                        },
                        child: Icon(
                          Icons.arrow_downward,
                          size: 19,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 3.0),
                    Text(
                      'Income',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 13,
                      backgroundColor: kIncomeColor,
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [Color(0xff282b59), Color(0xff5d60a6)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ).createShader(bounds);
                        },
                        child: Icon(
                          Icons.arrow_upward,
                          size: 19,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 7),
                    Text(
                      'Expenses',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ${income()}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '\$ ${expenses()}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TransactionHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Recent Transactions',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 10),
        _buildTransactionList(),
      ],
    );
  }

  Widget _buildTransactionList() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(47, 125, 121, 0.3),
            offset: Offset(0, 6),
            blurRadius: 12,
            spreadRadius: 6,
          ),
        ],
        // color: kBalanceCardColor,
        // borderRadius: BorderRadius.circular(15),
      ),
      width: 430,
      child: Card(
        elevation: 3,
        margin: EdgeInsets.only(left: 5, right: 5),
        color: kTransactionBoxColor,
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                if (index != 0) Divider(color: kDividerColor),
                ListTile(
                  leading: Icon(
                    transactions[index].type == TransactionType.Income ? Icons.arrow_forward : Icons.arrow_back,
                    color: transactions[index].type == TransactionType.Income ? Colors.green : Colors.red,
                  ),
                  title: Text(
                    transactions[index].title,
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactions[index].date,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        transactions[index].time,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  trailing: Text(
                    '${transactions[index].type == TransactionType.Income ? '+ \$${transactions[index].amount}' : '- \$${transactions[index].amount}'}',
                    style: TextStyle(
                      fontSize: 16,
                      color: transactions[index].type == TransactionType.Income ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: HomePage(),
//   ));
// }

// Constants
const kHeaderColor = Color(0xff171f33);
const kBackgroundColor = Color(0xff2f3c65);
const kNotificationIconColor = Color.fromRGBO(250, 250, 250, 0.1);
const kWelcomeTextColor = Color.fromARGB(255, 224, 223, 223);
const kBalanceCardColor = Color(0xff1e293b);
const kIncomeColor = Color.fromARGB(255, 85, 145, 141);
const kTransactionBoxColor = Color(0xff1e293b);
const kDividerColor = Colors.grey;

// Dummy transaction data
List<Transaction> transactions = [
  Transaction(
    title: 'Transaction 1',
    amount: 50.0,
    date: '14 Mar 2024',
    time: '10:00 AM',
    type: TransactionType.Income,
  ),
  Transaction(
    title: 'Transaction 2',
    amount: 20.0,
    date: '13 Mar 2024',
    time: '11:00 AM',
    type: TransactionType.Expense,
  ),
  Transaction(
    title: 'Transaction 3',
    amount: 100.0,
    date: '12 Mar 2024',
    time: '12:00 PM',
    type: TransactionType.Income,
  ),
  Transaction(
    title: 'Transaction 3',
    amount: 100.0,
    date: '12 Mar 2024',
    time: '12:00 PM',
    type: TransactionType.Income,
  ),
  Transaction(
    title: 'Transaction 3',
    amount: 100.0,
    date: '12 Mar 2024',
    time: '12:00 PM',
    type: TransactionType.Income,
  ),
];

enum TransactionType { Income, Expense }

class Transaction {
  final String title;
  final double amount;
  final String date;
  final String time;
  final TransactionType type;

  Transaction({required this.title, required this.amount, required this.date, required this.time, required this.type});
}

double total() {
  return 1000.0;
}

double income() {
  return 500.0;
}

double expenses() {
  return 300.0;
}
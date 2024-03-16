import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({Key? key, required this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return Column(
          children: [
            ListTile(
              title: Text(
                transaction.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${transaction.date}, ${transaction.time}',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              trailing: Text(
                transaction.type == TransactionType.Income ? '+ ₹${transaction.amount}' : '- ₹${transaction.amount}',
                style: TextStyle(
                  color: transaction.type == TransactionType.Income ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              onTap: () {
                _showTransactionDetails(context, transaction);
              },
            ),
            Divider(
              color: Colors.grey,
              thickness: 1.0,
              height: 1.0,
            ),
          ],
        );
      },
    );
  }

  void _showTransactionDetails(BuildContext context, Transaction transaction) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: _buildDialogContent(context, transaction),
        );
      },
    );
  }

  Widget _buildDialogContent(BuildContext context, Transaction transaction) {
    // Determine the status icon and color based on the transaction type
    IconData statusIcon;
    Color statusColor;
    String statusText;
    if (transaction.type == TransactionType.Income) {
      statusIcon = Icons.check_circle;
      statusColor = Colors.green;
      statusText = 'Transaction Successful';
    } else {
      statusIcon = Icons.cancel;
      statusColor = Colors.red;
      statusText = 'Transaction Unsuccessful';
    }

    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                statusIcon,
                color: statusColor,
                size: 30,
              ),
              SizedBox(width: 10),
              Text(
                statusText,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(
            color: Colors.grey,
            height: 1,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(height: 10),
          Text(
            'Transaction Details',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text('Title: ${transaction.title}'),
          Text('Amount: ₹${transaction.amount}'),
          Text('Date: ${transaction.date}'),
          Text('Time: ${transaction.time}'),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ),
        ],
      ),
    );
  }
}

enum TransactionType { Income, Expense }

class Transaction {
  final String title;
  final double amount;
  final String date;
  final String time;
  final TransactionType type;

  Transaction({
    required this.title,
    required this.amount,
    required this.date,
    required this.time,
    required this.type,
  });
}

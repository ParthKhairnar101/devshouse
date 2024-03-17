import 'package:flutter/material.dart';

class PaymentsPage extends StatefulWidget {
  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  bool repeatTransaction = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2f3c65),
      appBar: AppBar(
        backgroundColor: Color(0xff171f33),
        title: Text('Payments',
             style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
        ),
      )),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Select Payment Method',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              // Payment method icons grid
              Column(
                children: [
                  PaymentMethodItem(
                    icon: Icons.account_balance,
                    label: 'Bank Transfer',
                    onPressed: () {
                      // Handle bank transfer payment
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EmptyPage()),
                      );
                    },
                  ),
                  PaymentMethodItem(
                    icon: Icons.qr_code,
                    label: 'QR Code',
                    onPressed: () {
                      // Handle QR code payment
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EmptyPage()),
                      );
                    },
                  ),
                  PaymentMethodItem(
                    icon: Icons.credit_card,
                    label: 'Credit/Debit Card',
                    onPressed: () {
                      // Handle credit/debit card payment
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EmptyPage()),
                      );
                    },
                  ),
                  PaymentMethodItem(
                    icon: Icons.account_balance_wallet,
                    label: 'Digital Wallet',
                    onPressed: () {
                      // Handle digital wallet payment
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EmptyPage()),
                      );
                    },
                  ),
                  PaymentMethodItem(
                    icon: Icons.monetization_on,
                    label: ' Crypto Payment',
                    onPressed: () {
                      // Handle crypto payment
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EmptyPage()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Repeat Transaction',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                        color:Colors.white
                    ),
                  ),
                  Switch(
                    value: repeatTransaction,
                    onChanged: (value) {
                      setState(() {
                        repeatTransaction = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentMethodItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const PaymentMethodItem({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      width: double.infinity,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(47, 125, 121, 0.3),
                offset: Offset(0, 6),
                blurRadius: 12,
                spreadRadius: 6,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            //color: Colors.grey[200],
            color: Color(0xff171f33),
          ),
          child: Row(
            children: [
              Icon(icon, size: 30,color: Colors.white,),
              SizedBox(width: 16),
              Text(label,style: TextStyle(color:Colors.white),),
              Spacer(),
              Icon(Icons.arrow_forward_ios,color: Colors.white,),
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empty Page'),
      ),
      body: Center(
        child: Text('This is an empty page.'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PaymentsPage(),
  ));
}

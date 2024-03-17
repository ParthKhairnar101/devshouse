import 'package:flutter/material.dart';
import 'trans.dart';

class TransPage extends StatelessWidget {
  TransPage({Key? key}) : super(key: key);


  @override
  final List<Transaction> transactions = [
    Transaction(
      title: 'Groceries',
      amount: 500,
      date: '15 March 2024',
      time: '10:00 AM',
      type: TransactionType.Expense,
    ),
    Transaction(
      title: 'Salary',
      amount: 3000,
      date: '14 March 2024',
      time: '02:00 PM',
      type: TransactionType.Income,
    ),
  ];



  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double widthPerTab = screenWidth / 3;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xff2f3c65),
        appBar: AppBar(
          backgroundColor: Color(0xff171f33),
          title: Center(child: const Text("Transaction History",
            style: TextStyle(
              fontWeight: FontWeight.bold,
                color: Colors.white,
            ),)),
          bottom: TabBar(
            tabs: [
              Tab(child: Text('All',style: TextStyle(color: Colors.white),)),
              Tab(child: Text('Expenses',style: TextStyle(color: Colors.white),)),
              Tab(child: Text('Income',style: TextStyle(color: Colors.white),)),
            ],
            indicator: CustomUnderlineTabIndicator(
              borderSide: BorderSide(width: 4.0, color: Colors.black),
              indicatorWidth: widthPerTab,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(),
              SizedBox(height: 16.0),
              _buildFilterRow(),
              _buildDivider(0.20, 1.0),
              Expanded(
                child: Container(
                  child: TransactionList(transactions: transactions),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      width: 600,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.white),
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider(double topPadding, double bottomPadding) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
      child: Divider(
        height: 2,
        color: Colors.grey,
        thickness: 2,
        indent: 0,
        endIndent: 0,
      ),
    );
  }


  Widget _buildFilterRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            height: 35,
            child: DropdownButton<String>(
              items: <String>['Item 1', 'Item 2', 'Item 3'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style:TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle dropdown menu item selection
              },
            ),
          ),
          SizedBox(width: 8),
          _buildFilterButtons(),
        ],
      ),
    );
  }


  Widget _buildFilterButtons() {
    return Row(
      children: [
        _buildFilterButton('Filter 1'),
        SizedBox(width: 8),
        _buildFilterButton('Filter 2'),
        SizedBox(width: 8),
        _buildFilterButton('Filter 3'),
        SizedBox(width: 8),
        _buildFilterButton('Filter 4'),
        SizedBox(width: 8),
      ],
    );
  }

  Widget _buildFilterButton(String text) {
    return SizedBox(
      width: 100,
      height: 25,
      child: OutlinedButton(
        onPressed: () {
          // Handle filter button tap
        },
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(0),
          shape: StadiumBorder(),
          backgroundColor: Colors.blue, // Change background color
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }


}

class CustomUnderlineTabIndicator extends Decoration {
  final BorderSide borderSide;
  final double indicatorWidth;

  const CustomUnderlineTabIndicator({
    required this.borderSide,
    required this.indicatorWidth,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomUnderlinePainter(this);
  }
}

class _CustomUnderlinePainter extends BoxPainter {
  final CustomUnderlineTabIndicator decoration;

  _CustomUnderlinePainter(this.decoration);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final Paint paint = Paint();
    paint.color = Colors.white;
    paint.strokeWidth = decoration.borderSide.width;
    paint.style = PaintingStyle.stroke;

    final double center = rect.center.dx;

    final double indicatorWidth = decoration.indicatorWidth;

    canvas.drawLine(
      Offset(center - indicatorWidth / 2, rect.bottom - decoration.borderSide.width / 2),
      Offset(center + indicatorWidth / 2, rect.bottom - decoration.borderSide.width / 2),
      paint,
    );
  }
}


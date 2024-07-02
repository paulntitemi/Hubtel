import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: CustomHomeIcon(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: VerticalDivider(
              color: Colors.grey,
              thickness: 1.0,
              indent: 8.0,
              endIndent: 8.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.clock),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.calendar),
            label: 'Scheduled',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return HomeScreen();
          case 1:
            return TransactionHistory();
          case 2:
            return ScheduledScreen();
          default:
            return HomeScreen();
        }
      },
    );
  }
}

class CustomHomeIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.teal, // Background color
      ),
      child: Icon(
        CupertinoIcons.home,
        color: Colors.white,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}

class ScheduledScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Scheduled'),
      ),
      child: Center(
        child: Text('Scheduled Screen'),
      ),
    );
  }
}

class TransactionHistory extends StatefulWidget {
  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  int _selectedSegment = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: CupertinoSegmentedControl<int>(
          padding: EdgeInsets.all(8.0),
          groupValue: _selectedSegment,
          children: const {
            0: Text('History'),
            1: Text('Transaction Summary'),
          },
          onValueChanged: (int value) {
            setState(() {
              _selectedSegment = value;
            });
          },
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CupertinoSearchTextField(
                  placeholder: 'Search',
                  prefixIcon: Icon(CupertinoIcons.search),
                ),
              ),
              Expanded(
                child: _selectedSegment == 0
                    ? HistoryScreen()
                    : TransactionSummaryScreen(),
              ),
            ],
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: FloatingActionButton.large(
              backgroundColor: Color.fromARGB(255, 23, 177, 154),
              foregroundColor: Colors.white,
              onPressed: () {
                // Do nothing
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.plus_circle), // Using the Cupertino icon for send money
                  SizedBox(width: 8.0),
                  Text('SEND NEW'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: <Widget>[
        TransactionCard(
          time: "14:45PM",
          name: "Emmanuel Rockson Kwabena Uncle Ebo",
          phone: "024 123 4567",
          amount: "GHS 500",
          status: "Successful",
          statusColor: Colors.green,
          type: "Personal",
          note: "Cool your heart wai",
          isFavorite: true,
          date: "May 24, 2022",
          icon: Icons.check_circle,
          iconColor: Colors.green,
          logo: 'assets/mtn.png', // Replace with your actual asset path
        ),
        TransactionCard(
          time: "14:45PM",
          name: "Absa Bank",
          phone: "024 123 4567",
          amount: "GHS 500",
          status: "Failed",
          statusColor: Colors.red,
          type: "Personal",
          note: "Cool your heart wai",
          isFavorite: false,
          date: "May 24, 2022",
          icon: Icons.cancel,
          iconColor: Colors.red,
          logo: 'assets/absa.png', // Replace with your actual asset path
        ),
        // Add more TransactionTile widgets as needed
      ],
    );
  }
}

class TransactionSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Transaction Summary Screen'),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final String time;
  final String name;
  final String phone;
  final String amount;
  final String status;
  final Color statusColor;
  final String type;
  final String note;
  final bool isFavorite;
  final String date;
  final IconData icon;
  final Color iconColor;
  final String logo;

  TransactionCard({
    required this.time,
    required this.name,
    required this.phone,
    required this.amount,
    required this.status,
    required this.statusColor,
    required this.type,
    required this.note,
    required this.isFavorite,
    required this.date,
    required this.icon,
    required this.iconColor,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              time,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(logo),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        phone,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            icon,
                            color: statusColor,
                            size: 16.0,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            status,
                            style: TextStyle(
                              color: statusColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      amount,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Divider(),
            Row(
              children: <Widget>[
                Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                SizedBox(width: 8.0),
                Text(
                  type,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  "•",
                  style: TextStyle(
                    color
import 'package:flutter/material.dart';
import 'package:intership01/model/user.dart'; // Import the UserData class

class Dashboard extends StatefulWidget {
  final List<UserData> dataList; // Pass dataList as a parameter

  const Dashboard({Key? key, required this.dataList}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body:
          ListView.builder(
        itemCount: widget.dataList.length,
        itemBuilder: (context, index) {
          UserData user = widget.dataList[index]; // Get the user data at the current index
          return ListTile(
            title: Text('${user.firstName} ${user.lastName}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email: ${user.emailAddress}'),
                Text('User ID: ${user.userID}'),
                Text('District: ${user.district}'),
                Text('Phone No: ${user.phoneNo}'),
                Text('Pincode: ${user.pincode}'),
                Text('Country: ${user.country}'),
              ],
            ),
            // You can add more details here as needed
          );
        },
      ),
    );
  }
}

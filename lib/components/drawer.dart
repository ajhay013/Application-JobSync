import 'package:capstone/Pages/customersupport.dart';
import 'package:flutter/material.dart';
import 'package:capstone/pages/Applicant/findjob.dart';
import 'package:capstone/pages/Applicant/findemployer.dart';
import 'package:capstone/Pages/Applicant/ApplicantDashboard/Overview.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue, // Set the background color to blue
            ),
            accountName: Text('Jobsync User'),
            accountEmail: Text('user@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.account_circle, size: 50, color: Colors.blue),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // TODO: Implement navigation to Home
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Find Job'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FindJob()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.business),
            title: Text('Employers'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FindEmployer()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Overview()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Job Alerts'),
            onTap: () {
              // TODO: Implement navigation to Job Alerts screen
            },
          ),
          ListTile(
            leading: Icon(Icons.support),
            title: Text('Customer Support'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomerSupport()),
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'favoritejobs.dart'; // Import FavoriteJobs class
import 'appliedjobs.dart';

class ApplicantsSidebar extends StatefulWidget {
  final String currentRoute;

  ApplicantsSidebar({required this.currentRoute});

  @override
  _ApplicantsSidebarState createState() => _ApplicantsSidebarState();
}

class _ApplicantsSidebarState extends State<ApplicantsSidebar> {
  bool _isSidebarVisible = true;

  @override
  Widget build(BuildContext context) {
    TextStyle activeStyle = TextStyle(
      color: Color(0xFF0A65CC),
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );

    TextStyle normalStyle = TextStyle(
      color: Color(0xFF838383),
      fontSize: 14,
    );

    return Drawer(
      child: Container(
        padding: EdgeInsets.all(8),
        color: Colors.lightBlueAccent.withOpacity(0.1),
        child: Column(
          children: [
            if (_isSidebarVisible || MediaQuery.of(context).size.width > 600)
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(height: 30),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Text(
                        'Applicant Dashboard',
                        style: TextStyle(fontSize: 14, color: Color(0xFF606060)),
                      ),
                    ),
                    Divider(),
                    _buildSidebarItem(
                      context,
                      icon: Icons.layers,
                      label: 'Overview',
                      route: '/applicants/overview',
                      isActive: widget.currentRoute == '/applicants/overview',
                      activeStyle: activeStyle,
                      normalStyle: normalStyle,
                    ),
                    _buildSidebarItem(
                      context,
                      icon: Icons.work,
                      label: 'Applied Jobs',
                      route: '/applicants/appliedjobs',
                      isActive: widget.currentRoute == '/applicants/appliedjobs',
                      activeStyle: activeStyle,
                      normalStyle: normalStyle,
                    ),
                    _buildSidebarItem(
                      context,
                      icon: Icons.bookmark,
                      label: 'Favorite Jobs',
                      route: '/applicants/favoritejobs',
                      isActive: widget.currentRoute == '/applicants/favoritejobs',
                      activeStyle: activeStyle,
                      normalStyle: normalStyle,
                    ),
                    _buildSidebarItem(
                      context,
                      icon: Icons.notifications,
                      label: 'Job Alerts',
                      route: '/applicants/jobsalert',
                      isActive: widget.currentRoute == '/applicants/jobsalert',
                      activeStyle: activeStyle,
                      normalStyle: normalStyle,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSidebarItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String route,
    required bool isActive,
    required TextStyle activeStyle,
    required TextStyle normalStyle,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      title: Row(
        children: [
          Icon(
            icon,
            color: isActive ? activeStyle.color : normalStyle.color,
            size: 20,
          ),
          SizedBox(width: 12),
          Text(
            label,
            style: isActive ? activeStyle : normalStyle,
          ),
        ],
      ),
      onTap: () {
  if (label == 'Favorite Jobs') {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => FavoriteJobPage(),
        transitionDuration: Duration.zero, // No transition duration
        reverseTransitionDuration: Duration.zero, // No reverse transition duration
      ),
    );
  } else if (label == 'Applied Jobs') {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => AppliedJobPage(),
        transitionDuration: Duration.zero, // No transition duration
        reverseTransitionDuration: Duration.zero, // No reverse transition duration
      ),
    );
  } else {
    Navigator.pushNamed(context, route);
  }
},


    );
  }
}

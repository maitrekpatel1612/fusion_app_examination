import 'package:flutter/material.dart';
import 'sidebar.dart' as sidebar;
import 'announcement_screen.dart';
import 'submit_grades.dart';
import 'verify_grades.dart';
import 'generate_transcript.dart';

class ExaminationDashboard extends StatefulWidget {
  const ExaminationDashboard({super.key});

  @override
  State<ExaminationDashboard> createState() => _ExaminationDashboardState();
}

class _ExaminationDashboardState extends State<ExaminationDashboard> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _handleNavigation(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AnnouncementScreen()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SubmitGradesScreen()),
      );
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const VerifyGradesScreen()),
      );
    } else if (index == 5) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const GenerateTranscriptScreen()),
      );
    } else if (index == 6) {
      // Handle Validate Grades navigation
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Navigating to Validate Grades'),
          duration: Duration(seconds: 1),
        ),
      );
    } else if (index == 7) {
      // Handle Update Grades navigation
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Navigating to Update Grades'),
          duration: Duration(seconds: 1),
        ),
      );
    } else if (index == 8) {
      // Handle Result navigation
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Navigating to Result'),
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Navigating to ${_getScreenName(index)}'),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  String _getScreenName(int index) {
    switch (index) {
      case 0:
        return 'Dashboard';
      case 1:
        return 'Orders';
      case 2:
        return 'Announcement';
      case 3:
        return 'Submit Grades';
      case 4:
        return 'Verify Grades';
      case 5:
        return 'Generate Transcript';
      case 6:
        return 'Validate Grades';
      case 7:
        return 'Update Grades';
      case 8:
        return 'Result';
      case 9:
        return 'Profile';
      case 10:
        return 'Settings';
      case 11:
        return 'Help';
      case 12:
        return 'Log out';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Examination',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.blue.shade700,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      drawer: sidebar.Sidebar(onItemSelected: _handleNavigation),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue.shade700,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(80),
                bottomRight: Radius.circular(80),
              ),
            ),
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, bottom: 6.0, top: 10.0),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  _buildDashboardCard(
                    icon: Icons.campaign,
                    label: 'Announcement',
                    color: Colors.orange,
                    onTap: () => _handleNavigation(2),
                  ),
                  const SizedBox(height: 16.0),
                  _buildDashboardCard(
                    icon: Icons.grade,
                    label: 'Submit Grades',
                    color: Colors.green,
                    onTap: () => _handleNavigation(3),
                  ),
                  const SizedBox(height: 16.0),
                  _buildDashboardCard(
                    icon: Icons.check_circle,
                    label: 'Verify Grades',
                    color: Colors.purple,
                    onTap: () => _handleNavigation(4),
                  ),
                  const SizedBox(height: 16.0),
                  _buildDashboardCard(
                    icon: Icons.calendar_today,
                    label: 'Generate Transcript',
                    color: Colors.blue,
                    onTap: () => _handleNavigation(5),
                  ),
                  const SizedBox(height: 16.0),
                  _buildDashboardCard(
                    icon: Icons.verified_user,
                    label: 'Validate Grades',
                    color: Colors.red,
                    onTap: () => _handleNavigation(6),
                  ),
                  const SizedBox(height: 16.0),
                  _buildDashboardCard(
                    icon: Icons.update,
                    label: 'Update Grades',
                    color: Colors.teal,
                    onTap: () => _handleNavigation(7),
                  ),
                  const SizedBox(height: 16.0),
                  _buildDashboardCard(
                    icon: Icons.assessment,
                    label: 'Result',
                    color: Colors.amber,
                    onTap: () => _handleNavigation(8),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex < 4 ? _selectedIndex : 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildDashboardCard({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100, // Fixed height for rectangle cards
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              color,
              color.withOpacity(0.7),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 6),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background decorative elements
            Positioned(
              right: -15,
              bottom: -15,
              child: Icon(
                icon,
                size: 100,
                color: Colors.white.withOpacity(0.15),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  // Icon in circle
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: color.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      icon,
                      size: 30.0,
                      color: color,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  // Text content
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white.withOpacity(0.7),
                    size: 20.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

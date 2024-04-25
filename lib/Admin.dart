import 'package:flutter/material.dart';
import 'package:untitled/login.dart'; // Assuming this is the file where the loginn widget is defined
import 'Details.dart'; // Assuming this is the file where the DetailScreen widget is defined

class adminpage extends StatefulWidget {
  @override
  State<adminpage> createState() => _adminpageState();
}

class _adminpageState extends State<adminpage> {
  late PageController pageController;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigateToPage(int index) {
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              children: [
                // Screen for controlling login
                loginn(
                  // You can pass any necessary parameters to customize the login screen
                ),
                // Screen for controlling DetailScreen
                DetailScreen(),
                // Add more pages/screens as needed
              ],
            ),
          ),
          // Navigation buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  navigateToPage(0); // Navigate to login screen
                },
                child: Text('Control Login'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  navigateToPage(1); // Navigate to DetailScreen control
                },
                child: Text('Control DetailScreen'),
              ),
              // Add more navigation buttons as needed
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Details.dart';
import 'Login.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(child: Text('Dashboard')),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => loginn()));
              });
            },
            icon: Icon(Icons.logout_sharp),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan, Colors.white60],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey[50],
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.cyan,
                              spreadRadius: 1,
                              offset: Offset(4, 4),
                            ),
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.blueGrey.shade100,
                              spreadRadius: 1,
                              offset: Offset(-4, -4),
                            ),
                          ]),
                      child: Image.asset(
                        'assets/images/abc.jpg',
                        width: 120,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning,',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        Text(
                          'John', // Replace 'John' with the name
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildItem('Mountain'),
                    buildItem('Trees'),
                    buildItem('Riverview'),
                    buildItem('Waterfall'),
                    buildItem('Landsliding'),
                  ].map((widget) =>
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: widget,
                      )).toList(),
                ),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Popular',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ImageDetail(imagePath: 'assets/images/abc3.jpeg', name: 'kalam'),
                    ImageDetail(imagePath: 'assets/images/abc5.jpg', name: 'Naran'),
                    ImageDetail(imagePath: 'assets/images/abc4.webp', name: 'Swat'),
                    ImageDetail(imagePath: 'assets/images/abc3.jpeg', name: 'kalam'),
                    ImageDetail(imagePath: 'assets/images/abc5.jpg', name: 'Naran'),
                  ].map((imageDetail) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildItems(imageDetail),
                    );
                  }).toList(),
                ),
              )

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications',),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Call'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  Widget buildItem(String categoryName) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
      ),
      child: Text(categoryName),
    );
  }

  Widget buildItems(ImageDetail imageDetail) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DetailScreen()));
      },
      child: Card(
        elevation: 5, // Adjust elevation as needed
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(imageDetail.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5), // Add some spacing between image and text
            Text(
              imageDetail.name,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

  class ImageDetail {
  final String imagePath;
  final String name;

  ImageDetail({required this.imagePath, required this.name});
  }



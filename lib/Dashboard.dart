import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Login.dart';


class Dashboard extends StatefulWidget{
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          FirebaseAuth.instance.signOut().then((value) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginn()));
          });
        }, icon: Icon(Icons.logout_sharp),
        ),
         title: Text('Dashboard'),
    ),
       body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  SizedBox(width: 10.0),
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      'assets/images/abc.jpg', // Path to your Good Morning emoji image
                      width: 120,
                      height: 50,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Good Morning, ',
                        style: TextStyle(fontSize: 10.0),
                      ),
                      Text(
                        'John', // Replace 'John' with the name
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
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
                  border: OutlineInputBorder(),
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
            SizedBox(height: 10.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryItem('Mountain'), // Replace 'Category 1' with your category names
                  _buildCategoryItem('Trees'),
                  _buildCategoryItem('Riverview'),
                  _buildCategoryItem('Water fall'),
                  _buildCategoryItem('land sliding')// Add more category items here as needed
                ].map((widget) => Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: widget,
                )).toList(),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Popular',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 125,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/abc3.jpeg'),
                      Image.asset('assets/images/abc5.jpg'),
                      Image.asset('assets/images/abc4.webp')
                    ],
                  ),
                ),
              ),
            ),
            // Add your popular pictures widgets here
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10.0),
        color: Colors.grey[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Navigate to home screen
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Show notifications
              },
            ),
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {
                // Make a call
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Navigate to profile screen
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Navigate to settings screen
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String categoryName) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
      ),
      child: Text(categoryName),
    );
  }
}
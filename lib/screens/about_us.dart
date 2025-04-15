import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'About Us',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Banner Image (Full Width)
            Container(
              width: double.infinity,
              child: Image.asset('assets/logo1.png', fit: BoxFit.cover),
            ),
            SizedBox(height: 20),

            // Company Name
            Text(
              "Kicks and Kits",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),

            // Mission & Vision Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Our Mission",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "To bring football fans closer to their teams by providing authentic, high-quality kits at the best prices.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Our Vision",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "To be the leading online store for football kits, trusted by fans worldwide.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Contact Details Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.email, color: Colors.blue),
                        title: Text("Email"),
                        subtitle: Text("support@kicksandkits.com"),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.phone, color: Colors.blue),
                        title: Text("Phone"),
                        subtitle: Text("+92 322 6303627"),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.web, color: Colors.blue),
                        title: Text("Website"),
                        subtitle: Text("www.kicksandkits.com"),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Footer
            Text(
              "© 2025 Kicks and Kits. All rights reserved.",
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

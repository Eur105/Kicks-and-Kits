// ignore_for_file: unused_field, must_be_immutable

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:kicks_and_kits/screens/about_us.dart';
import 'package:kicks_and_kits/screens/help_support_screen.dart';
import 'package:kicks_and_kits/screens/order_history.dart';
import 'profile_screen.dart';
import 'login_screen.dart';
import 'dart:io';

class SettingsScreen extends StatelessWidget {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Profile Section
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      _image != null
                          ? FileImage(_image!)
                          : const AssetImage("assets/profile.png")
                              as ImageProvider,
                ),
                SizedBox(height: 10),
                Text(
                  "Ebad Ur Rehman",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "ebad219@gmail.com",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 10),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: const Text(
                    "View your full profile",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Settings Options
                Expanded(
                  child: ListView(
                    children: [
                      _buildSettingsOption(
                        icon: Icons.edit,
                        title: "Edit Profile",
                        onTap: () {
                          // Navigator.pushNamed(context, '/editProfile');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ),
                          );
                        },
                      ),
                      _buildSettingsOption(
                        icon: Icons.history,
                        title: "Order History",
                        onTap: () {
                          // Navigator.pushNamed(context, '/orderHistory');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderHistoryScreen(),
                            ),
                          );
                        },
                      ),
                      _buildSettingsOption(
                        icon: Icons.help_outline,
                        title: "Help & Support",
                        onTap: () {
                          // Navigator.pushNamed(context, '/helpSupport');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HelpSupportScreen(),
                            ),
                          );
                        },
                      ),
                      _buildSettingsOption(
                        icon: Icons.info_outline,
                        title: "About Us",
                        onTap: () {
                          // Navigator.pushNamed(context, '/aboutUs');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutUsScreen(),
                            ),
                          );
                        },
                      ),
                      _buildSettingsOption(
                        icon: Icons.logout,
                        title: "Log Out",
                        iconColor: Colors.red,
                        onTap: () {
                          _showLogoutDialog(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget for each settings option
  Widget _buildSettingsOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color iconColor = Colors.blue,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.pop(context);

                // Navigate back to Login Screen and remove all previous screens
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) =>
                      false, // Remove all previous screens
                );
              },
              child: const Text("Log Out", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}

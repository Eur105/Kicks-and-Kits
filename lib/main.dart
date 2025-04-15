import 'package:flutter/material.dart';
import 'package:kicks_and_kits/providers/cart_provider.dart';
import 'package:kicks_and_kits/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CartProvider())],
      child: MyApp(),
    ),
  );
}

class KicksAndKitsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kicks and Kits',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: SplashScreen(),
      home: SplashScreen(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kicks and Kits',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}

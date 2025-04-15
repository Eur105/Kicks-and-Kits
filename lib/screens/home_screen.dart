import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'settings_screen.dart';
import 'product_listing.dart';
import 'product_details.dart';
import 'product_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class ProductSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product> results =
        allProducts.where((product) {
          return product.name.toLowerCase().contains(query.toLowerCase());
        }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index].name),
          subtitle: Text("\$${results[index].price.toStringAsFixed(2)}"),
          leading: Image.asset(results[index].image, width: 50, height: 50),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => ProductDetailsScreen(
                      productName: results[index].name,
                      productImage: results[index].image,
                      price: results[index].price,
                      team: "Unknown Team",
                      season: "2023/24",
                      manufacturer: "Unknown Manufacturer",
                      sponsor: "Unknown sponsor",
                      additionalImages: [],
                    ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<Product> searchResults = [];

  void searchProducts(String query) {
    setState(() {
      searchResults =
          allProducts.where((product) {
            return product.name.toLowerCase().contains(query.toLowerCase());
          }).toList();
    });
  }

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    ProductListingScreen(),
    CartScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'Kicks and Kits',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showSearch(context: context, delegate: ProductSearchDelegate());
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              setState(() {
                _selectedIndex = 2;
              });
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: Colors.blue.shade900,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

// Home Page with Branding & Awareness
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Hero Section
          Image.asset(
            'assets/hero_image.jpg',
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),

          SizedBox(height: 20),

          Text(
            "Gear Up for Glory!",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),

          /*ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductListingScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade900,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text("Shop Now", style: TextStyle(fontSize: 16)),
          ),*/
          SizedBox(height: 20),

          // Why Choose Us Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Why Choose Kicks and Kits?",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildFeature(Icons.check_circle, "100% Authentic"),
                    _buildFeature(Icons.local_shipping, "Fast Delivery"),
                    _buildFeature(Icons.lock, "Secure Payments"),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Image Sections with Circular Borders
          _buildCircularImageSection(
            "Latest Jerseys",
            "assets/latest_jerseys.jpg",
          ),
          _buildCircularImageSection(
            "Best-Selling Kits",
            "assets/best_selling.jpg",
          ),
          _buildCircularImageSection(
            "Limited Edition Drops",
            "assets/limited_edition.jpg",
          ),

          SizedBox(height: 20),

          // Final Call to Action
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Join thousands of fans rocking their favorite kits!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                /*ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductListingScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Browse Collection",
                    style: TextStyle(fontSize: 16),
                  ),
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget for Feature Points
  Widget _buildFeature(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue.shade900, size: 40),
        SizedBox(height: 5),
        Text(text, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      ],
    );
  }

  // Widget for Image Sections with Circular Borders
  Widget _buildCircularImageSection(String title, String imagePath) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 500,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

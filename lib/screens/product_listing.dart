import 'package:flutter/material.dart';
import 'product_details.dart';
import 'product_data.dart';

class ProductListingScreen extends StatefulWidget {
  @override
  _ProductListingScreenState createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  String selectedFilter = "All";
  String selectedSort = "Price";
  int itemsToShow = 4;
  @override
  Widget build(BuildContext context) {
    // Filter products
    List<Product> filteredProducts =
        allProducts.where((product) {
          if (selectedFilter == "All") return true;
          return product.category == selectedFilter;
        }).toList();

    // Sort products
    if (selectedSort == "Price") {
      filteredProducts.sort((a, b) => a.price.compareTo(b.price));
    } else if (selectedSort == "Popularity") {
      filteredProducts.shuffle();
    } else if (selectedSort == "New Arrivals") {
      filteredProducts = filteredProducts.reversed.toList();
    }

    return Scaffold(
      body: Column(
        children: [
          // Filter Section
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Filter by Kit Type",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Wrap(
                  spacing: 10,
                  children:
                      ["All", "Home", "Away", "Third"].map((filter) {
                        return ChoiceChip(
                          label: Text(filter),
                          selected: selectedFilter == filter,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedFilter = selected ? filter : "All";
                            });
                          },
                          selectedColor: Colors.blue.shade900,
                          backgroundColor: Colors.white,
                          labelStyle: TextStyle(
                            color:
                                selectedFilter == filter
                                    ? Colors.white
                                    : Colors.black,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.blue.shade900),
                          ),
                          showCheckmark: false,
                        );
                      }).toList(),
                ),
              ],
            ),
          ),

          // Sorting Button with Dropdown
          Align(
            alignment: Alignment.topCenter,
            child: PopupMenuButton<String>(
              onSelected: (value) {
                setState(() {
                  selectedSort = value;
                });
              },
              itemBuilder:
                  (context) => [
                    PopupMenuItem(
                      value: "Price",
                      child: Row(
                        children: [
                          // Icon(Icons.attach_money, color: Colors.blue),
                          SizedBox(width: 8),
                          Text("Price"),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: "Popularity",
                      child: Row(
                        children: [
                          // Icon(Icons.star, color: Colors.orange),
                          SizedBox(width: 8),
                          Text("Popularity"),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: "New Arrivals",
                      child: Row(
                        children: [
                          // Icon(Icons.new_releases, color: Colors.green),
                          SizedBox(width: 8),
                          Text("New Arrivals"),
                        ],
                      ),
                    ),
                  ],
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Sort by: $selectedSort",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),

          // Product Grid
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              itemCount: filteredProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.5,
              ),
              itemBuilder: (context, index) {
                Product product = filteredProducts[index];
                return GestureDetector(
                  onTap: () {
                    String team = "";
                    String season = "2024/25";
                    String manufacturer = "";
                    String sponsor = "";

                    if (product.name.contains("Manchester United")) {
                      team = "Manchester United";
                      manufacturer = "Adidas";
                      sponsor = "Snapdragon";
                    } else if (product.name.contains("Real Madrid")) {
                      team = "Real Madrid";
                      manufacturer = "Adidas";
                      sponsor = "Fly Emirates";
                    } else if (product.name.contains("Barcelona")) {
                      team = "FC Barcelona";
                      manufacturer = "Nike";
                      sponsor = "Spotify";
                    } else if (product.name.contains("Juventus")) {
                      team = "Juventus";
                      manufacturer = "Adidas";
                      sponsor = "Not Available";
                    } else if (product.name.contains("Arsenal")) {
                      team = "Arsenal";
                      manufacturer = "Adidas";
                      sponsor = "Fly Emirates";
                    } else if (product.name.contains("Manchester City")) {
                      team = "Manchester City";
                      manufacturer = "Puma";
                      sponsor = "Etihad Airways";
                    } else if (product.name.contains("Liverpool")) {
                      team = "Liverpool";
                      manufacturer = "Nike";
                      sponsor = "Standard Chartered";
                    } else if (product.name.contains("Tottenham Hotspurs")) {
                      team = "Tottenham Hotspurs";
                      manufacturer = "Nike";
                      sponsor = "AIA";
                    } else if (product.name.contains("Bayern Munich")) {
                      team = "Bayern Munich";
                      manufacturer = "Adidas";
                      sponsor = ".T.";
                    } else if (product.name.contains("Borussia Dortmund")) {
                      team = "Borussia Dortmund";
                      manufacturer = "Puma";
                      sponsor = "Evonik";
                    } else if (product.name.contains("Inter Milan")) {
                      team = "Inter Milan";
                      manufacturer = "Nike";
                      sponsor = "Betsson Sports";
                    } else if (product.name.contains("AC Milan")) {
                      team = "AC Milan";
                      manufacturer = "Puma";
                      sponsor = "Fly Emirates";
                    } else if (product.name.contains("PSG")) {
                      team = "PSG";
                      manufacturer = "Nike";
                      sponsor = "Qatar Airways";
                    } else if (product.name.contains("Chelsea")) {
                      team = "Chelsea";
                      manufacturer = "Nike";
                      sponsor = "Not Available";
                    } else {
                      team = "Unknown Team";
                      manufacturer = "Unknown Manufacturer";
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => ProductDetailsScreen(
                              productName: product.name,
                              productImage: product.image,
                              price: product.price,
                              team: team,
                              season: season,
                              manufacturer: manufacturer,
                              sponsor: sponsor,
                              additionalImages: [product.image, product.image],
                            ),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Image
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15),
                            ),
                            child: Image.asset(
                              product.image,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // Product Details
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "\$${product.price.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

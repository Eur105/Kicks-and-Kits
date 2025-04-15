import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../screens/product_data.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productName;
  final String productImage;
  final double price;
  final String team;
  final String sponsor;
  final String season;
  final String manufacturer;
  final List<String> additionalImages;

  ProductDetailsScreen({
    required this.productName,
    required this.productImage,
    required this.price,
    required this.team,
    required this.sponsor,
    required this.season,
    required this.manufacturer,
    required this.additionalImages,
  });

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String selectedSize = "M";
  int quantity = 1;
  TextEditingController playerNameController = TextEditingController();
  TextEditingController playerNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Product Details", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Image.asset(widget.productImage, fit: BoxFit.cover),
            ),

            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Title
                  Text(
                    widget.productName,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 5),

                  // Team, Season, Manufacturer
                  Text(
                    "Team: ${widget.team}",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  Text(
                    "Season: ${widget.season}",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  Text(
                    "Manufacturer: ${widget.manufacturer}",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  Text(
                    "Sponsor: ${widget.sponsor}",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),

                  SizedBox(height: 10),

                  // Price
                  Text(
                    "\$${widget.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),

                  SizedBox(height: 20),

                  // Size Selection
                  Text(
                    "Select Size",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:
                        ["S", "M", "L", "XL", "XXL"].map((size) {
                          return Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: ChoiceChip(
                              label: Text(size),
                              selected: selectedSize == size,
                              onSelected: (bool selected) {
                                setState(() {
                                  selectedSize = size;
                                });
                              },
                              selectedColor: Colors.blue.shade900,
                              backgroundColor: Colors.white,
                              labelStyle: TextStyle(
                                color:
                                    selectedSize == size
                                        ? Colors.white
                                        : Colors.black,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: Colors.blue.shade900),
                              ),
                              showCheckmark: false,
                            ),
                          );
                        }).toList(),
                  ),

                  SizedBox(height: 20),

                  // Quantity Selector
                  Text(
                    "Select Quantity",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                        icon: Icon(Icons.remove, color: Colors.blue.shade900),
                      ),
                      Text(
                        quantity.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        icon: Icon(Icons.add, color: Colors.blue.shade900),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Customization Section
                  Text(
                    "Customize Your Kit (Optional)",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: playerNameController,
                    decoration: InputDecoration(
                      labelText: "Player Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: playerNumberController,
                    decoration: InputDecoration(
                      labelText: "Player Number",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 30),

                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.blue.shade900,
                      ),
                      onPressed: () {
                        final product = Product(
                          id:
                              UniqueKey()
                                  .toString(), // Unique ID for the product
                          name: widget.productName,
                          image: widget.productImage,
                          price: widget.price,
                          category: "Your category here",
                        );
                        Provider.of<CartProvider>(
                          context,
                          listen: false,
                        ).addToCart(product, quantity);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "${quantity} x ${widget.productName} added to cart!",
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
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

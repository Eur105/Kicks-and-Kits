// Dummy product data
class Product {
  final String id;
  final String name;
  final String image;
  final double price;
  final String category;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.category,
    this.quantity = 1,
  });
}

// Sample products
List<Product> allProducts = [
  Product(
    id: "1",
    name: "Manchester United Home Kit",
    image: "assets/manu_home.png",
    price: 89.99,
    category: "Home",
  ),
  Product(
    id: "2",
    name: "Real Madrid Home Kit",
    image: "assets/real_home.png",
    price: 85.99,
    category: "Home",
  ),
  Product(
    id: "3",
    name: "Barcelona Home Kit",
    image: "assets/barca_home.png",
    price: 85.99,
    category: "Home",
  ),
  Product(
    id: "4",
    name: "Juventus Home Kit",
    image: "assets/juve_home.png",
    price: 85.99,
    category: "Home",
  ),

  Product(
    id: "5",
    name: "Manchester United Away Kit",
    image: "assets/manu_away.png",
    price: 87.99,
    category: "Away",
  ),
  Product(
    id: "6",
    name: "Real Madrid Away Kit",
    image: "assets/real_away.png",
    price: 79.99,
    category: "Away",
  ),
  Product(
    id: "7",
    name: "Juventus Away Kit",
    image: "assets/juve_away.png",
    price: 79.99,
    category: "Away",
  ),

  Product(
    id: "8",
    name: "Manchester United Third Kit",
    image: "assets/manu_third.png",
    price: 83.99,
    category: "Third",
  ),
  Product(
    id: "9",
    name: "Real Madrid Third Kit",
    image: "assets/real_third.png",
    price: 84.99,
    category: "Third",
  ),
  Product(
    id: "10",
    name: "Barcelona Third Kit",
    image: "assets/barca_third.png",
    price: 89.99,
    category: "Third",
  ),
  Product(
    id: "11",
    name: "Juventus Third Kit",
    image: "assets/juve_third.png",
    price: 84.99,
    category: "Third",
  ),
  Product(
    id: "12",
    name: "Arsenal Home Kit",
    image: "assets/arsenal_home.png",
    price: 79.99,
    category: "Home",
  ),
  Product(
    id: "13",
    name: "Arsenal Away Kit",
    image: "assets/arsenal_away.png",
    price: 84.99,
    category: "Away",
  ),
  Product(
    id: "14",
    name: "Arsenal Third Kit",
    image: "assets/arsenal_third.png",
    price: 84.99,
    category: "Third",
  ),
  Product(
    id: "15",
    name: "Barcelona Away Kit",
    image: "assets/barca_away.png",
    price: 89.99,
    category: "Away",
  ),
  Product(
    id: "16",
    name: "Bayern Munich Home Kit",
    image: "assets/bayern_home.png",
    price: 81.99,
    category: "Home",
  ),
  Product(
    id: "17",
    name: "Bayern Munich Away Kit",
    image: "assets/bayern_away.png",
    price: 84.99,
    category: "Away",
  ),
  Product(
    id: "18",
    name: "Bayern Munich Third Kit",
    image: "assets/bayern_third.png",
    price: 84.99,
    category: "Third",
  ),
  Product(
    id: "19",
    name: "Borussia Dortmund Home Kit",
    image: "assets/bvb_home.png",
    price: 84.99,
    category: "Home",
  ),
  Product(
    id: "20",
    name: "Borussia Dortmund Away Kit",
    image: "assets/bvb_away.png",
    price: 84.99,
    category: "Away",
  ),
  Product(
    id: "21",
    name: "Borussia Dortmund Third Kit",
    image: "assets/bvb_third.png",
    price: 84.99,
    category: "Third",
  ),
  Product(
    id: "22",
    name: "Chelsea Home Kit",
    image: "assets/chelsea_home.png",
    price: 87.99,
    category: "Home",
  ),
  Product(
    id: "23",
    name: "Chelsea Away Kit",
    image: "assets/chelsea_away.png",
    price: 84.99,
    category: "Away",
  ),
  Product(
    id: "24",
    name: "Manchester City Home Kit",
    image: "assets/city_home.png",
    price: 79.99,
    category: "Home",
  ),
  Product(
    id: "25",
    name: "Manchester City Away Kit",
    image: "assets/city_away.png",
    price: 81.99,
    category: "Away",
  ),
  Product(
    id: "26",
    name: "Manchester City Third Kit",
    image: "assets/city_third.png",
    price: 79.99,
    category: "Third",
  ),
  Product(
    id: "27",
    name: "Inter Milan Home Kit",
    image: "assets/inter_home.png",
    price: 84.99,
    category: "Home",
  ),
  Product(
    id: "28",
    name: "Liverpool Home Kit",
    image: "assets/liverpool_home.png",
    price: 79.99,
    category: "Home",
  ),
  Product(
    id: "29",
    name: "Liverpool Away Kit",
    image: "assets/liverpool_away.png",
    price: 84.99,
    category: "Away",
  ),
  Product(
    id: "30",
    name: "AC Milan Home Kit",
    image: "assets/milan_home.png",
    price: 85.99,
    category: "Home",
  ),
  Product(
    id: "31",
    name: "AC Milan Away Kit",
    image: "assets/milan_away.png",
    price: 79.99,
    category: "Away",
  ),
  Product(
    id: "32",
    name: "PSG Home Kit",
    image: "assets/psg_home.png",
    price: 85.99,
    category: "Home",
  ),
  Product(
    id: "33",
    name: "Tottenham Hotspurs Home Kit",
    image: "assets/spurs_home.png",
    price: 79.99,
    category: "Home",
  ),
];

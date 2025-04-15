import 'package:flutter/material.dart';
import '../screens/product_data.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items =
      {}; // Stores cart items using product ID as key

  Map<String, CartItem> get items => _items;

  int get itemCount => _items.length;

  double get totalAmount {
    return _items.values.fold(
      0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
  }

  void addToCart(Product product, int quantity) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity += quantity;
    } else {
      _items[product.id] = CartItem(product: product, quantity: quantity);
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void increaseQuantity(String productId) {
    if (_items.containsKey(productId)) {
      _items[productId]!.quantity++;
      notifyListeners();
    }
  }

  void decreaseQuantity(String productId) {
    if (_items.containsKey(productId)) {
      if (_items[productId]!.quantity > 1) {
        _items[productId]!.quantity--;
      } else {
        _items.remove(productId);
      }
      notifyListeners();
    }
  }

  void updateQuantity(String productId, int quantity) {
    if (_items.containsKey(productId) && quantity > 0) {
      _items[productId]!.quantity = quantity;
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  double get totalPrice {
    return _items.values.fold(
      0.0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}

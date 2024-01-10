class CartManager {
  static final CartManager _instance = CartManager._internal();

  factory CartManager() {
    return _instance;
  }

  CartManager._internal();

  List<Map<String, dynamic>> cartItems = [];

  void addToCart(Map<String, dynamic> menuItem) {
    cartItems.add(menuItem);
  }

  void removeFromCart(Map<String, dynamic> menuItem) {
    cartItems.remove(menuItem);
  }

  void clearCart() {
    cartItems.clear();
  }

  int getTotalPrice() {
    int totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item['price'] as int;
    }
    return totalPrice;
  }

  int get itemCount => cartItems.length;
}

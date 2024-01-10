// restaurant_menu_page.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:pj2/pages/cart_manager.dart';

// RestaurantMenuPage 클래스
class RestaurantMenuPage extends StatefulWidget {
  final String restaurantName;
  final String restaurantImage;
  final List<Map<String, dynamic>> menuItems;
  final String restaurantType;

  RestaurantMenuPage({required this.restaurantName, required this.restaurantImage, required this.menuItems, required this.restaurantType});

  @override
  _RestaurantMenuPageState createState() => _RestaurantMenuPageState();
}

class _RestaurantMenuPageState extends State<RestaurantMenuPage> {
  final CartManager cartManager = CartManager();

  void addToCart(Map<String, dynamic> menuItem) {
    cartManager.addToCart(menuItem);
    // 화면 갱신
    setState(() {});
  }

  void showCartDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('장바구니'),
          content: SingleChildScrollView(
            child: ListBody(
              children: cartManager.cartItems.map((item) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item['name']),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // 장바구니에서 해당 항목 제거
                        setState(() {
                          cartManager.removeFromCart(item);
                        });
                        Navigator.of(context).pop();
                        showCartDialog(context);
                      },
                    ),
                  ],
                );
              }
            ).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('취소하기'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('주문하기'),
              onPressed: () {
                // 주문 로직 추가...
                Navigator.of(context).pop();
                showPaymentDialog(context);
              },
            ),
          ],
        );
      },
    );
  }

  void showPaymentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('결제하기'),
          content: Text('총 가격: ${cartManager.getTotalPrice()}원'),
          actions: <Widget>[
            TextButton(
              child: Text('취소하기'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('결제하기'),
              onPressed: () {
                // 결제 메시지
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('결제되었습니다')),
                );
                cartManager.clearCart();
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0), // Adjust the height as needed
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            height: 230,
            child: Image.asset(
              widget.restaurantImage,
              fit: BoxFit.cover,
            ),
          ),
          // Restaurant Name Box
          Positioned(
            top: MediaQuery.of(context).padding.top + 180.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,  // 세로 중앙 정렬
                children: [
                  Text(
                    widget.restaurantName,
                    style: TextStyle(
                      color: Colors.black,
                      // fontFamily: 'NotoSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.restaurantType, // Display the restaurant type
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ),

          // Body Content (Menu Items)
          Positioned(
            top: MediaQuery.of(context).padding.top + 280.0,
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView.builder(
              itemCount: widget.menuItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                title: Text('${widget.menuItems[index]['name']}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${widget.menuItems[index]['price']}원', style: TextStyle(fontSize: 15.0)),
                    SizedBox(width: 4),
                    IconButton(
                      icon: Icon(Icons.add_shopping_cart, color: Color(0xffFF874D)),
                      onPressed: () {
                        addToCart(widget.menuItems[index]);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
      floatingActionButton: badges.Badge(
        position: badges.BadgePosition.topEnd(top: 0, end: 3),
        animationDuration: Duration(milliseconds: 300),
        animationType: badges.BadgeAnimationType.slide,
        badgeContent: Text(
          cartManager.itemCount.toString(),
          style: TextStyle(color: Colors.white),
        ),
        child: FloatingActionButton(
          onPressed: () => showCartDialog(context),
          child: Icon(Icons.shopping_cart),
          backgroundColor: Color(0xFFFFCDBA),
        ),
      ),
    );
  }
}
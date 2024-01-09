// restaurant_menu_page.dart
import 'dart:ui';
import 'package:flutter/material.dart';

// RestaurantMenuPage 클래스
class RestaurantMenuPage extends StatelessWidget {
  final String restaurantName;
  final String restaurantImage;
  final List<Map<String, dynamic>> menuItems;

  RestaurantMenuPage({required this.restaurantName, required this.restaurantImage, required this.menuItems});

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
              restaurantImage,
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
                color: Color.fromARGB(255, 243, 243, 243).withOpacity(0.7),
                borderRadius: BorderRadius.circular(10.0),
              ),
              
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,  // 세로 중앙 정렬
                children: [
                  Text(
                    restaurantName,
                    style: TextStyle(
                      color: Colors.black,
                      // fontFamily: 'NotoSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '010-1111-1111', //식당별 연락처 정보 로드해야 함
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w200,
                    ),
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
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showOverlay(context, menuItems[index]['name'], 5); // 여기서 5는 임의의 숫자
                  },
                  child: ListTile(
                    title: Text('${menuItems[index]['name']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${menuItems[index]['price']}원',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        SizedBox(width: 4),
                        IconButton(
                          icon: Icon(Icons.add_shopping_cart, color: Color(0xffFF874D)),
                          onPressed: () {
                            // 주문 로직 추가...
                          },
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

  // Overlay를 보여주는 함수
  void showOverlay(BuildContext context, String menuName, int numberOfTimesEaten) {
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 300.0,
        left: 20.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              '친구가 $numberOfTimesEaten번 먹은 메뉴!', //DB에서 조회해야 함
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
          ),
        ),
      ),
    );


    Overlay.of(context)?.insert(overlayEntry);

    // 일정 시간 후 Overlay 제거
    Future.delayed(Duration(seconds: 1), () {
      overlayEntry.remove();
    });
  }

}
// restaurant_menu_page.dart
import 'package:flutter/material.dart';

// RestaurantMenuPage 클래스
class RestaurantMenuPage extends StatelessWidget {
  final String restaurantName;
  final List<String> menuItems;

  RestaurantMenuPage({required this.restaurantName, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurantName),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(menuItems[index]),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                // 주문 로직 추가...
              },
            ),
          );
        },
      ),
    );
  }
}

// class RestaurantMenuPage extends StatelessWidget {
//   final String restaurantName;
//   final List<String> menuItems;

//   // 생성자 정의
//   RestaurantMenuPage({required this.restaurantName, required this.menuItems});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$restaurantName 메뉴'),
//       ),
//       body: ListView.builder(
//         itemCount: menuItems.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(menuItems[index]),
//             onTap: () {
//               print('선택한 메뉴: ${menuItems[index]}');
//               // 여기에 메뉴를 탭했을 때의 동작을 추가하세요.
//             },
//           );
//         },
//       ),
//     );
//   }
// }
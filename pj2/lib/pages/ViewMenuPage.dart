// main.dart
import 'package:flutter/material.dart';
import 'RestaurantMenuPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '카이마루',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ViewMenuPage(),
    );
  }
}

class ViewMenuPage extends StatelessWidget {
  final List<Map<String, dynamic>> restaurants = [
    {'image': 'assets/images/restaurant1.png', 'name': '휴김밥전문점', 'menu': ['메뉴 1', '메뉴 2', '메뉴 3', '메뉴 4', '메뉴 5']},
    {'image': 'assets/images/restaurant2.png', 'name': '오늘도 든든', 'menu': ['메뉴 6', '메뉴 7', '메뉴 8', '메뉴 9', '메뉴 10']},
    {'image': 'assets/images/restaurant3.png', 'name': '캠토', 'menu': ['메뉴 11', '메뉴 12', '메뉴 13', '메뉴 14', '메뉴 15']},
    {'image': 'assets/images/restaurant4.png', 'name': '웰차이', 'menu': ['메뉴 16', '메뉴 17', '메뉴 18', '메뉴 19', '메뉴 20']},
    {'image': 'assets/images/restaurant5.png', 'name': '리틀하노이', 'menu': ['메뉴 21', '메뉴 22', '메뉴 23', '메뉴 24', '메뉴 25']},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('식당 정보'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestaurantMenuPage(
                    restaurantName: restaurants[index]['name']!,
                    menuItems: List<String>.from(restaurants[index]['menu']),
                  ),
                ),
              );
            },
            child: GridTile(
              child: Image.asset(
                restaurants[index]['image']!,
                fit: BoxFit.cover,
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black.withOpacity(0.7),
                title: Text(
                  restaurants[index]['name']!,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

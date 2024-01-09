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
    {
      'image': 'assets/images/restaurant1.png',
      'name': '휴김밥 전문점',
      //식당별 메뉴와 가격 정보를 DB에서 불러와야 함
      'menu': [ 
        {'name': '메뉴 1', 'price': 5000}, 
        {'name': '메뉴 2', 'price': 6000},
        {'name': '메뉴 3', 'price': 7000},
        {'name': '메뉴 4', 'price': 8000},
        {'name': '메뉴 5', 'price': 9000},
      ],
    },
    {
      'image': 'assets/images/restaurant2.png',
      'name': '오늘도 든든',
      'menu': [
        {'name': '메뉴 6', 'price': 5000},
        {'name': '메뉴 7', 'price': 6000},
        {'name': '메뉴 8', 'price': 7000},
        {'name': '메뉴 9', 'price': 8000},
        {'name': '메뉴 10', 'price': 9000},
      ],
    },
    {
      'image': 'assets/images/restaurant3.png',
      'name': '캠토',
      'menu': [
        {'name': '메뉴 11', 'price': 5000},
        {'name': '메뉴 12', 'price': 6000},
        {'name': '메뉴 13', 'price': 7000},
        {'name': '메뉴 14', 'price': 8000},
        {'name': '메뉴 15', 'price': 9000},
      ],
    },
    {
      'image': 'assets/images/restaurant4.png',
      'name': '웰차이',
      'menu': [
        {'name': '메뉴 16', 'price': 5000},
        {'name': '메뉴 17', 'price': 6000},
        {'name': '메뉴 18', 'price': 7000},
        {'name': '메뉴 19', 'price': 8000},
        {'name': '메뉴 20', 'price': 9000},
      ],
    },
    {
      'image': 'assets/images/restaurant5.png',
      'name': '리틀하노이',
      'menu': [
        {'name': '메뉴 21', 'price': 5000},
        {'name': '메뉴 22', 'price': 6000},
        {'name': '메뉴 23', 'price': 7000},
        {'name': '메뉴 24', 'price': 8000},
        {'name': '메뉴 25', 'price': 9000},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
                  '식당',
                  style: TextStyle(
                    // fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )
              ),
        backgroundColor: Color(0xffFF874D)
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestaurantMenuPage(
                    restaurantName: restaurants[index]['name']! as String,
                    restaurantImage: restaurants[index]['image']! as String,
                    menuItems: List<Map<String, dynamic>>.from(restaurants[index]['menu']),
                  ),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), 
              ),
              elevation: 5, // 그림자 효과
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Image.asset(
                  restaurants[index]['image']!,
                  fit: BoxFit.cover,
                  height: 200,
                ),
                subtitle: Container(
                  color: Color(0xffFF874D).withOpacity(0.3),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    restaurants[index]['name']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      ),
                    ),
                  ),
              ),
            ),
          );
        },
      ),
    );
  }
}

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
        {'name': '즉석김밥', 'price': 2000}, 
        {'name': '참치김밥', 'price': 3000},
        {'name': '치즈김밥', 'price': 3000},
        {'name': '고추참치김밥', 'price': 3500},
        {'name': '치즈참치김밥', 'price': 3500},
        {'name': '즉석라면', 'price': 3000}, 
        {'name': '치즈라면', 'price': 3500},
        {'name': '떡라면', 'price': 3500},
        {'name': '짬뽕라면', 'price': 5000},
        {'name': '쫄면', 'price': 5000},
        {'name': '수제돈까스', 'price': 6000}, 
        {'name': '치즈돈까스', 'price': 6500},
        {'name': '고구마돈까스', 'price': 6500},
        {'name': '오므돈까스', 'price': 8500},
        {'name': '제육돈까스', 'price': 8500},
        {'name': '제육오므라이스', 'price': 8500},
        {'name': '비빔밥', 'price': 5500},
        {'name': '참치비빔밥', 'price': 6000},
        {'name': '김치볶음밥', 'price': 6000},
        {'name': '새우볶음밥', 'price': 6000},
        {'name': '제육덮밥', 'price': 6000},
        {'name': '데리야끼덮밥', 'price': 6000},
        {'name': '오므라이스', 'price': 6000},
        {'name': '참치찌개', 'price': 6000},
        {'name': '돼지찌개', 'price': 6000},
        {'name': '부대찌개', 'price': 6000},
        {'name': '순두부', 'price': 6000},
        {'name': '해물순두부', 'price': 6500},
        {'name': '치즈순두부', 'price': 6500},
      ],
    },
    {
      'image': 'assets/images/restaurant2.png',
      'name': '오늘도 든든',
      'menu': [
        {'name': '소고기된짱짜글이', 'price': 5500},
        {'name': '돼지김치짜글이+계란밥', 'price': 5500},
        {'name': '수육국밥', 'price': 6000},
        {'name': '제육덮밥', 'price': 6000},
        {'name': '고기반상', 'price': 6500},
        {'name': '치킨까스 마요덮밥', 'price': 6000},
        {'name': '육회비빔밥', 'price': 6000},
        {'name': '등심돈까스', 'price': 7000},
      ],
    },
    {
      'image': 'assets/images/restaurant3.png',
      'name': '캠토',
      'menu': [
        {'name': '에그토스트', 'price': 2300},
        {'name': '야채토스트', 'price': 2500},
        {'name': '햄치즈토스트', 'price': 3000},
        {'name': '로얄토스트', 'price': 3500},
        {'name': '감자토스트', 'price': 3500},
        {'name': '핫베이컨토스트', 'price': 4000},
        {'name': '핫불갈비토스트', 'price': 3500},
        {'name': '핫치킨토스트', 'price': 3500},
        {'name': '돈까스토스트', 'price': 4000},
        {'name': '참숯불고기토스트', 'price': 4100},
        {'name': '소세지토스트', 'price': 4300},
        {'name': '피자토스트', 'price': 3500},
        {'name': '골드피자토스트', 'price': 4000},
        {'name': '베이글야채', 'price': 3500},
        {'name': '베이글햄치즈', 'price': 3800},
        {'name': '베이글참숯불고기', 'price': 4500},
        {'name': '참숯불고기컵밥', 'price': 4300},
        {'name': '치킨컵밥', 'price': 4300},
        {'name': '스팸컵밥', 'price': 4300},
        {'name': '참치컵밥', 'price': 4300},
        {'name': '소불고기컵밥', 'price': 4300},
        {'name': '소세지덮밥', 'price': 4600},
        {'name': '로제떡볶이', 'price': 3800},
        {'name': '떡볶이세트', 'price': 5500},
      ],
    },
    {
      'image': 'assets/images/restaurant4.png',
      'name': '웰차이',
      'menu': [
        {'name': '짜장면', 'price': 5000},
        {'name': '간짜장', 'price': 6000},
        {'name': '짬뽕', 'price': 6000},
        {'name': '짬뽕밥', 'price': 6000},
        {'name': '해물볶음밥', 'price': 6000},
        {'name': '군만두', 'price': 5000},
        {'name': '미니탕수육', 'price': 6000},
        {'name': '탕수육', 'price': 10000},
        {'name': '짬짜면', 'price': 6500},
        {'name': '볶짜면', 'price': 6500},
        {'name': '볶짬면', 'price': 7500},
        {'name': '탕짜면', 'price': 7500},
        {'name': '탕볶밥', 'price': 7500},
        {'name': '탕짬면', 'price': 8500},
      ],
    },
    {
      'image': 'assets/images/restaurant5.png',
      'name': '리틀하노이',
      'menu': [
        {'name': '쌀국수', 'price': 3900},
        {'name': '양지쌀국수', 'price': 5000},
        {'name': '양지매운쌀국수', 'price': 5500},
        {'name': '닭쌀국수', 'price': 5500},
        {'name': '매운닭쌀국수', 'price': 5500},
        {'name': '완자쌀국수', 'price': 6000},
        {'name': '매운완자쌀국수', 'price': 6000},
        {'name': '마라쌀국수', 'price': 7000},
        {'name': '하노이볶음면', 'price': 5500},
        {'name': '파인애플볶음밥', 'price': 5500},
        {'name': '숯불고기볶음밥', 'price': 6000},
        {'name': '숯불고기덮밥', 'price': 6500},
        {'name': '왕닭다리쌀국수', 'price': 8000},
        {'name': '마라왕닭다리쌀국수', 'price': 9000},
        {'name': '분팃사오', 'price': 7400},
        {'name': '하노이분짜', 'price': 9400},
        {'name': '왕등심돈까스', 'price': 7000},
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

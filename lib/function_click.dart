import 'package:flutter/material.dart';
import 'package:travell_app/colors_pictures.dart';
import 'package:travell_app/style.dart';

//관광지
class HomeDetail extends StatelessWidget
//imagePath를 인수로 받고 HomePage 위젯을 반환
    {
  final String imagePath;
  const HomeDetail(this.imagePath);
  @override
  Widget build(context) {
    return HomePage(imagePath, home_picture);
  }
}

class HomePage extends StatelessWidget
// imagePath 와 destinations를 인수로 받음
    {
  final String imagePath;
  final List<Map<String, dynamic>> destinations;
  HomePage(this.imagePath, this.destinations);

  @override
  Widget build(context) {
    return Scaffold(
      body: ListView//리스트뷰를 사용하여 본문 내용 구성
        (
        children: [
          Container//핫플레이스에 대한 정보를 받은 컨테이너
            (
            padding: EdgeInsets.only(top: 30),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.chevron_left,
                        color: AppColor.primaryColor,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColor.secondaryColor,
                        AppColor.tertiaryColor,
                      ],
                    ),
                  ),
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(text: _getPlaceName(imagePath), size: 24,
                          ),
                          SizedBox(height: 10),
                          PrimaryText(text: _getPlaceContext(imagePath), size: 15, color: Colors.grey,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PrimaryText(text: '\n여행지', size: 20, fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 160,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: destinations.map((destination) {
                                return HomeList_Type(
                                  destination['imagePath'],
                                  destination['placeName'],
                                  destination['placeSummary'],
                                  destination['placeContext'],
                                  context,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget HomeList_Type//홈화면(관광지)의 구성 요소
      (
      String imagePath,
      String placeName,
      String placeSummary,
      String placeContext,
      context,
      ) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeDetail(imagePath),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 160,
            width: 160,
            margin: EdgeInsets.only(right: 25),
            padding: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [AppColor.secondaryColor, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrimaryText(
                      text: placeName,
                      size: 15,
                      fontWeight: FontWeight.w800),
                  SizedBox(height: 4),
                  PrimaryText(
                      text: placeSummary,
                      color: Colors.white54,
                      size: 10,
                      fontWeight: FontWeight.w800)
                ]),
          ),
        ],
      ),
    );
  }

  String _getPlaceName(String imagePath) //imagePath와 일치하는 destination 요소를 찾으면 placeName을 반환
  {
    for (var destination in destinations) {
      if (destination['imagePath'] == imagePath) {
        return destination['placeName'];
      }
    }
    return '';
  }

  String _getPlaceContext(String imagePath) //imagePath와 일치하는 destination 요소를 찾으면 placeContext을 반환
  {
    for (var destination in destinations) {
      if (destination['imagePath'] == imagePath) {
        return destination['placeContext'];
      }
    }
    return '';
  }
}

// 핫플레이스
class HotplaceDetail extends StatelessWidget
//imagePath를 인수로 받고 HotplacePage 위젯을 반환
    {
  final String imagePath;
  const HotplaceDetail(this.imagePath);
  @override
  Widget build(context) {
    return HotplacePage(imagePath, hotplace_picture);
  }
}

class HotplacePage extends StatelessWidget
// imagePath 와 destinations를 인수로 받음
    {
  final String imagePath;
  final List<Map<String, dynamic>> destinations;
  HotplacePage(this.imagePath, this.destinations);

  @override
  Widget build(context) {
    return Scaffold(
      body: ListView//리스트뷰를 사용하여 본문 내용 구성
        (
        children: [
          Container//핫플레이스에 대한 정보를 받은 컨테이너
            (
            padding: EdgeInsets.only(top: 30),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.chevron_left,
                        color: AppColor.primaryColor,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColor.secondaryColor,
                        AppColor.tertiaryColor,
                      ],
                    ),
                  ),
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(
                            text: _getPlaceName(imagePath),
                            size: 24,
                          ),
                          SizedBox(height: 10),
                          PrimaryText(
                            text: _getPlaceContext(imagePath),
                            size: 15,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PrimaryText(
                                text: '\n핫 플레이스!',
                                size: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 160,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: destinations.map((destination) {
                                return HotplaceList_Type(
                                  destination['imagePath'],
                                  destination['placeName'],
                                  destination['placeSummary'],
                                  destination['placeContext'],
                                  context,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget HotplaceList_Type//핫플레이스의 구성 요소
      (
      String imagePath,
      String placeName,
      String placeSummary,
      String placeContext,
      context,
      ) {
    return GestureDetector(

      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HotplaceDetail(imagePath),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 160,
            width: 160,
            margin: EdgeInsets.only(right: 25),
            padding: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [AppColor.secondaryColor, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrimaryText(
                      text: placeName,
                      size: 15,
                      fontWeight: FontWeight.w800),
                  SizedBox(height: 4),
                  PrimaryText(
                      text: placeSummary,
                      color: Colors.white54,
                      size: 10,
                      fontWeight: FontWeight.w800)
                ]),
          ),
        ],
      ),
    );
  }

  String _getPlaceName(String imagePath)//imagePath와 일치하는 destination 요소를 찾으면 placeName을 반환
  {
    for (var destination in destinations) {
      if (destination['imagePath'] == imagePath) {
        return destination['placeName'];
      }
    }
    return '';
  }

  String _getPlaceContext(String imagePath) //imagePath와 일치하는 destination 요소를 찾으면 placeContext을 반환
  {
    for (var destination in destinations) {
      if (destination['imagePath'] == imagePath) {
        return destination['placeContext'];
      }
    }
    return '';
  }
}

//레스토랑
class RestaurantDetail extends StatelessWidget
//imagePath를 인수로 받고 RestaurantPage 위젯을 반환
    {
  final String imagePath;
  const RestaurantDetail(this.imagePath);
  @override
  Widget build(context) {
    return RestauranPage(imagePath, restaurant_picture);
  }
}

class RestauranPage extends StatelessWidget
// imagePath 와 destinations를 인수로 받음
    {
  final String imagePath;
  final List<Map<String, dynamic>> destinations;
  RestauranPage(this.imagePath, this.destinations);

  @override
  Widget build(context) {
    return Scaffold(
      body: ListView//리스트뷰를 사용하여 본문 내용 구성
        (
        children: [
          Container//음식점에 대한 정보를 받은 컨테이너
            (
            padding: EdgeInsets.only(top: 30),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.chevron_left,
                        color: AppColor.primaryColor,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColor.secondaryColor,
                        AppColor.tertiaryColor,
                      ],
                    ),
                  ),
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(
                            text: _getPlaceName(imagePath),
                            size: 24,
                          ),
                          SizedBox(height: 10),
                          PrimaryText(
                            text: _getPlaceContext(imagePath),
                            size: 15,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PrimaryText(
                                text: '\n추천 음식점',
                                size: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 160,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: destinations.map((destination) {
                                return RestaurantList_Type(
                                  destination['imagePath'],
                                  destination['placeName'],
                                  destination['placeSummary'],
                                  destination['placeContext'],
                                  context,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget RestaurantList_Type//음식점의 구성 요소
      (
      String imagePath,
      String placeName,
      String touristPlaceCount,
      String placeContext,
      context,
      ) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RestaurantDetail(imagePath),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 160,
            width: 160,
            margin: EdgeInsets.only(right: 25),
            padding: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [AppColor.secondaryColor, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrimaryText(
                      text: placeName,
                      size: 15,
                      fontWeight: FontWeight.w800),
                  SizedBox(height: 4),
                  PrimaryText(
                      text: touristPlaceCount,
                      color: Colors.white54,
                      size: 10,
                      fontWeight: FontWeight.w800)
                ]),
          ),
        ],
      ),
    );
  }

  String _getPlaceName(String imagePath) //imagePath와 일치하는 destination 요소를 찾으면 placeName을 반환
  {
    for (var destination in destinations) {
      if (destination['imagePath'] == imagePath) {
        return destination['placeName'];
      }
    }
    return '';
  }

  String _getPlaceContext(String imagePath) //imagePath와 일치하는 destination 요소를 찾으면 placeContext을 반환
  {
    for (var destination in destinations) {
      if (destination['imagePath'] == imagePath) {
        return destination['placeContext'];
      }
    }
    return '';
  }
}

// 숙소
class HotelDetail extends StatelessWidget
//imagePath를 인수로 받고 HotelPage 위젯을 반환
    {
  final String imagePath;
  const HotelDetail(this.imagePath);
  @override
  Widget build(context) {
    return HotelPage(imagePath, hotel_picture);
  }
}

class HotelPage extends StatelessWidget
// imagePath 와 destinations를 인수로 받음
    {
  final String imagePath;
  final List<Map<String, dynamic>> destinations;
  HotelPage(this.imagePath, this.destinations);

  @override
  Widget build(context) {
    return Scaffold(
      body: ListView//리스트뷰를 사용하여 본문 내용 구성

        (
        children: [
          Container//숙소에 대한 정보를 받은 컨테이너
            (
            padding: EdgeInsets.only(top: 30),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.chevron_left,
                        color:AppColor.primaryColor,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColor.secondaryColor,
                        AppColor.tertiaryColor,
                      ],
                    ),
                  ),
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(
                            text: _getPlaceName(imagePath),
                            size: 24,
                          ),
                          SizedBox(height: 10),
                          PrimaryText(
                            text: _getPlaceContext(imagePath),
                            size: 15,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PrimaryText(
                                text: '\n숙소',
                                size: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 160,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: destinations.map((destination) {
                                return HotelList_Type(
                                  destination['imagePath'],
                                  destination['placeName'],
                                  destination['placeSummary'],
                                  destination['placeContext'],
                                  context,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget HotelList_Type//숙소의 구성 요소
      (
      String imagePath,
      String placeName,
      String placeSummary,
      String placeContext,
      context,
      ) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HotelDetail(imagePath),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 160,
            width: 160,
            margin: EdgeInsets.only(right: 25),
            padding: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [AppColor.secondaryColor, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrimaryText(
                      text: placeName,
                      size: 15,
                      fontWeight: FontWeight.w800),
                  SizedBox(height: 4),
                  PrimaryText(
                      text: placeSummary,
                      color: Colors.white54,
                      size: 10,
                      fontWeight: FontWeight.w800)
                ]),
          ),
        ],
      ),
    );
  }

  String _getPlaceName(String imagePath)//imagePath와 일치하는 destination 요소를 찾으면 placeName을 반환
  {
    for (var destination in destinations) {
      if (destination['imagePath'] == imagePath) {
        return destination['placeName'];
      }
    }
    return '';
  }

  String _getPlaceContext(String imagePath)//imagePath와 일치하는 destination 요소를 찾으면 placeContext을 반환
  {
    for (var destination in destinations) {
      if (destination['imagePath'] == imagePath) {
        return destination['placeContext'];
      }
    }
    return '';
  }
}
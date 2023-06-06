import 'package:flutter/material.dart';
import 'package:travell_app/colors_pictures.dart';
import 'package:travell_app/style.dart';
import 'package:travell_app/function/home.dart';
import 'package:travell_app/function_click.dart';
import 'package:travell_app/function/hotel.dart';
import 'package:travell_app/function/hotplace.dart';
import 'package:travell_app/function/restaurant.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:travell_app/rent.dart';

class Restaurant extends StatelessWidget// StateWidget을 상속받은 클래스로, 레스토랑 화면 구현
    {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
          width: MediaQuery.of(context).size.width - 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.darkSecondaryColor,
                AppColor.lightTertiaryColor,
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: //화면 하단 아이콘 구현
            [
              IconButton(
                icon: Icon(
                  Icons.map,
                  color: AppColor.primaryColor,
                  size: 40,
                ),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Home()),);},
              ),
              IconButton(
                icon: Icon(
                  Icons.restaurant,
                  color: Colors.white,
                  size: 40,
                ),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Restaurant()),);},
              ),
              IconButton(
                icon: Icon(
                  Icons.local_hotel,
                  color: AppColor.primaryColor,
                  size: 40,
                ),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Hotel()),);},
              ),
              IconButton(
                icon: Icon(
                  Icons.workspace_premium,
                  color: AppColor.primaryColor,
                  size: 40,
                ),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Hotplace()),);},
              ),
              IconButton(
                icon: Icon(
                  Icons.directions_car,
                  color: AppColor.primaryColor,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Rentcar()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.thermostat, color: AppColor.primaryColor, size: 40,),
                onPressed: () {Navigator.push(context, MaterialPageRoute(
                  builder: (context) => WebViewPage('https://www.ventusky.com/?p=33.41;126.58;8&l=temperature-2m&t=20230526/1900'),
                  // 생성자를 통해 해당 URL을 전달하여 홈페이지 열리게 설정
                ),
                );
                },
              ),
            ],
          )),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      body: Container// 앱의 body 구현, 높이, 배경색, 그라디언트 효과
        (
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
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
            customAppBar(),
            Image.asset('assets/food1.png', width: 200, height: 200,),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 25, right: 25, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryText(
                    text: '추천 음식점',
                    size: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: restaurant_picture.length,
                  itemBuilder: (context, index) =>
                      Padding(
                        padding: EdgeInsets.only(left: index  == 0 ? 30: 0),
                        child: RestaurantList_Type(restaurant_picture[index]['imagePath'], restaurant_picture[index]['placeName'], restaurant_picture[index]['placeSummary'], context ),
                      )
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget RestaurantList_Type(String imagePath, String placeName,
      String touristPlaceCount,  context)//레스토랑 목록 아이템을 구성하는 위젯을 반환
  {
    return GestureDetector//클릭할 때의 동작을 정의
      (
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RestaurantDetail(imagePath)))
      },
      child: Stack // 겹쳐진 위젯 구성(이미지, 그라디언트 색상, 텍스트)
        (children: [
        Hero(
          tag: imagePath,
          child: Container(
            height: 200,
            width: 140,
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
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            height: 200,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [AppColor.secondaryColor, Colors.transparent]),
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
      ]),
    );
  }


  Padding customAppBar() //커스텀 앱바를 구성하는 위젯을 반환
  {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrimaryText(
            text: '제주도 여행',
            size: 32,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}

class WebViewPage extends StatelessWidget {
  final String url; // 생성자에서 url을 매개변수로 받기 위해 선언

  WebViewPage(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold( // 기본적 구조 제공 위해 사용
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColor.secondaryColor,
              AppColor.tertiaryColor,
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 16, top: 16),
              child: IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  color: AppColor.primaryColor,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // 스택에서 pop을 하여 뒤로 가기 위해 구현
                },
              ),
            ),
            Expanded(
              child: WebView(
                initialUrl: url,
                javascriptMode: JavascriptMode.unrestricted, // WebView에서 javascript를 사용할 수 있도록 javascript 실행 모드 변경
              ),
            ),
          ],
        ),
      ),
    );
  }
}
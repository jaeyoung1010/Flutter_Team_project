import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:travell_app/colors_pictures.dart';

void main() {
  runApp(Rentcar());
}

class Rentcar extends StatefulWidget {
  @override
  _RentcarState createState() => _RentcarState();
}

class _RentcarState extends State<Rentcar> {
  List<Map<String, dynamic>> _responseData = [];

  @override
  void initState() { // 상태 객체의 초기화 작업을 위해 사용
    super.initState(); // StatefulWidget의 initState 메서드 호출하기 위해 사용
    fetchData();
  }

  Future<void> fetchData() async {
    String projectKey = 'bj_j2ptrtt820tt8c23bo88208_r2_30'; // API에 전달할 프로젝트 키를 저장하기 위해 변수 선언
    String url =
        'https://open.jejudatahub.net/api/proxy/01aDta180abt81t3ba0bt11taab88080/$projectKey?param1=value1&param2=value2';
    // API 요청을 보낼 URL을 저장하기 위해 변수 선언

    try {
      http.Response response = await http.get(Uri.parse(url)); // URL로 GET 요청을 시도하기 위해 사용
      if (response.statusCode == 200) { // 200값을 응답 성공으로 작성
        List<Map<String, dynamic>> extractedData = [];
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        // JSON 형식으로 디코딩하기 위해 사용
        // 디코딩된 JSON 데이터를 jsonResponse에 저장하기 위해 변수 선언

        if (jsonResponse.containsKey('data')) { // jsonResponse에 data 키가 존재하는지 확인하기 위해 사용
          List<dynamic> data = jsonResponse['data']; // data 키에 해당하는 값을 가져오기 위해 사용

          for (var item in data) { //data 리스트의 각 항목을 반복하며 필요한 데이터 추출하기 위해 반복문 사용

            if (item.containsKey('placeName') && // 밑에까지 각 키의 존재 여부를 확인하기 위해 사용
                item.containsKey('addressDoro') &&
                item.containsKey('placeUrl')) {
              Map<String, dynamic> extractedItem = {
                'placeName': item['placeName'],
                'addressDoro': item['addressDoro'],
                'placeUrl': item['placeUrl'],
              };
              extractedData.add(extractedItem); // 모든 키가 존재할 경우 데이터를 추출하여 extractedData 리스트에 추가하기 위해 선언
            }
          }
        }

        setState(() { // 응답이 도착한 경우(=200) extractedData를 _responseData에 할당하기 위해 사용
          _responseData = extractedData;
        });
      } else {
        setState(() { // 응답이 실패할 경우(!=200) _responseData를 비어있는 리스트로 업데이트
          _responseData = [];
        });
      }
    } catch (error) { // 예외 처리, 위 경우와 마찬가지로 _responseData를 비어있는 리스트로 업데이트
      setState(() {
        _responseData = [];
      });
    }
  }

  void _launchURL(String url) async { // 주어진 URL을 열기 위해 사용한 wraaper 함수
    try {
      await launch(url);
    } catch (e) { // 예외 처리
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold( // 기본적 구조 제공 위해 사용
        body: Container(
          decoration: BoxDecoration( // 컨테이너의 배경을 그라데이션으로 꾸미기 위해 사용
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.secondaryColor,
                AppColor.tertiaryColor,
              ],
            ),
          ),
          child: Column( // 위젯들을 수직으로 배열하기 위해 사용
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).padding.top), // 상태 표시줄 높이 만큼 간격 추가
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 1, top: 16),
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
              Expanded( // 남는 공간이 없이 리스트뷰가 차지하는 공간을 확장하기 위해 사용
                child: ListView.builder( // 동적으로 데이터를 생성하고 표시하기 위해 사용
                  itemCount: _responseData.length,
                  itemBuilder: (ctx, index) {
                    return ListTile( // 리스트뷰 내부에서 각 item을 표시하기 위해 사용
                      title: Text(
                        _responseData[index]['placeName'],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _responseData[index]['addressDoro'],
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          GestureDetector( // URL 클릭을 위해 사용
                            onTap: () {
                              _launchURL(_responseData[index]['placeUrl']); // 터치가 발생시 위에 작성한 _launchURL 함수 호출하기 위해 사용
                            },
                            child: Text(
                              _responseData[index]['placeUrl'],
                              style: TextStyle(
                                color: Colors.cyanAccent,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        // Handle item tap
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
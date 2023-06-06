import 'package:flutter/material.dart';
import 'package:travell_app/function/home.dart';

void main() //플러터를 실행
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget//기본 구조를 정의하고 home()위젯이 첫번째 화면으로 설정됨
    {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: Home()
    );
  }
}

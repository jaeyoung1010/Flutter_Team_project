import 'package:flutter/material.dart';
import 'package:travell_app/colors_pictures.dart';
class PrimaryText extends StatelessWidget//텍스트 사용자 정의 위젯
    {
  final double size;
  final Color color;
  final TextOverflow overflow;
  final FontWeight fontWeight;
  final String text;

  const PrimaryText({
    this.size: 16,
    this.color: AppColor.primaryColor,
    this.fontWeight: FontWeight.w600,
    this.overflow: TextOverflow.visible,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
      ),
    );
  }
}


import 'package:flutter/material.dart';

class NornalText extends Text {
  final String text;
  final double size;
  final Color color;
  final TextAlign? textAlign;
  
  NornalText({
    super.key, 
    required this.text,
    required this.size,
    required this.color,
    this.textAlign
  }) : super(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none
    )
  );
}

class BoldText extends Text {
  final String text;
  final double size;
  final Color color;
  final TextAlign? textAlign;

  BoldText({
    super.key, 
    required this.text,
    required this.size,
    required this.color,
    this.textAlign
  }) : super(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none
    )
  );
}
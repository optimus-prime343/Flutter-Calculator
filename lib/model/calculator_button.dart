import 'package:calculator/constants/colors.dart';
import 'package:flutter/material.dart';

class CalculatorButton {
  final String text;
  final Color backgroundColor;
  final double width;
  final double height;
  final int crossAxisCellCount;
  final double mainAxisCellCount;

  CalculatorButton({
    required this.text,
    this.backgroundColor = kButtonColor,
    this.width = 40,
    this.height = 40,
    this.crossAxisCellCount = 1,
    this.mainAxisCellCount = 1,
  });
}

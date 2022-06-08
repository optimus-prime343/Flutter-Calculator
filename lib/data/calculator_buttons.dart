import 'package:calculator/constants/colors.dart';
import 'package:calculator/model/calculator_button.dart';

List<CalculatorButton> calculatorButtons = [
  CalculatorButton(text: 'e'),
  CalculatorButton(text: 'π'),
  CalculatorButton(text: 'sin'),
  CalculatorButton(text: 'deg'),
  CalculatorButton(text: 'C', backgroundColor: kClearButtonColor),
  CalculatorButton(text: '('),
  CalculatorButton(text: ')'),
  CalculatorButton(text: '/', backgroundColor: kOrangeColor),
  CalculatorButton(text: '7'),
  CalculatorButton(text: '8'),
  CalculatorButton(text: '9'),
  CalculatorButton(text: 'x', backgroundColor: kOrangeColor),
  CalculatorButton(text: '4'),
  CalculatorButton(text: '5'),
  CalculatorButton(text: '6'),
  CalculatorButton(text: '-', backgroundColor: kOrangeColor),
  CalculatorButton(text: '1'),
  CalculatorButton(text: '2'),
  CalculatorButton(text: '3'),
  CalculatorButton(text: '+', backgroundColor: kOrangeColor),
  CalculatorButton(text: '0', crossAxisCellCount: 2),
  CalculatorButton(text: '.'),
  CalculatorButton(text: '=', backgroundColor: kGreenColor),
];

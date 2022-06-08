import 'package:calculator/data/calculator_buttons.dart';
import 'package:calculator/model/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String calculatorText = '';
  double? result;

  void calculateResult() {
    Parser parser = Parser();
    Expression expression = parser.parse(calculatorText);
    ContextModel contextModel = ContextModel();
    double evaluation = expression.evaluate(EvaluationType.REAL, contextModel);
    setState(() {
      result = evaluation;
    });
  }

  void resetCalculator() {
    setState(() {
      calculatorText = '';
      result = null;
    });
  }

  void handleButtonTap(String pressedButton) {
    if (pressedButton == '=') return calculateResult();
    if (pressedButton == 'C') return resetCalculator();
    setState(() {
      // if user presses any button after calculating the result replace calculator initial text with result
      if (result != null) {
        calculatorText = result.toString();
        result = null;
      }
      calculatorText += pressedButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: deviceHeight * 0.20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      calculatorText,
                      style: TextStyle(
                        color: result != null
                            ? Colors.grey.shade400
                            : Colors.white,
                        fontSize: result != null ? 24 : 36,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: result != null,
                      child: Expanded(
                        child: Text(
                          result.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: StaggeredGrid.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: calculatorButtons
                      .map(
                        (calculatorButton) => CalculatorButtonGridTile(
                          calculatorButton: calculatorButton,
                          handleButtonTap: handleButtonTap,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalculatorButtonGridTile extends StatelessWidget {
  final Function(String button) handleButtonTap;
  final CalculatorButton calculatorButton;
  const CalculatorButtonGridTile({
    Key? key,
    required this.calculatorButton,
    required this.handleButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      mainAxisCellCount: calculatorButton.mainAxisCellCount,
      crossAxisCellCount: calculatorButton.crossAxisCellCount,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onTap: () => handleButtonTap(calculatorButton.text),
        child: Ink(
          decoration: BoxDecoration(
            color: calculatorButton.backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              calculatorButton.text,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

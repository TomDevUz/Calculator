import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ResultModel extends ChangeNotifier {
  // Result / Current number
  String resultText = "0";

  // Formatter
  var formatter = NumberFormat.decimalPattern("es_ES");

  // Variables
  String? operation;
  String? secondNumber;
  bool newNumber = false;

  // Stack
  String? operationHolder;
  String? numberHolder;
  String? lastSolvedOp;
  String? lastSolvedNum;

  // Max and current numbers
  int maxDigits = 9;
  int currentDigits = 1;

  // Font size
  double fontSize = 100.0;

  // Constructor
  ResultModel() {
    formatter.maximumFractionDigits = maxDigits;
  }

  // Getters
  String get text => resultText;
  double get getFontSize => fontSize;

  void selectNumber(int number) {
    if (newNumber) {
      newNumber = false;
      resultText = "0";
      currentDigits = 1;
    }

    if (resultText == "0") {
      resultText = number.toString();
    } else {
      if (currentDigits < maxDigits) {
        resultText += number.toString();
        currentDigits += 1;
        var result = unformatResult(resultText);
        resultText = formatter.format(result);
        resizeText();
      }
    }

    notifyListeners();
  }

  void dotPressed() {
    if (!resultText.contains(",")) resultText += ",";

    resizeText();
    notifyListeners();
  }

  void resetPressed() {
    if (resultText == "0") {
      operation = null;
      secondNumber = null;
    }

    newNumber = false;
    operationHolder = null;
    numberHolder = null;
    resultText  = "0";
    currentDigits = 1;
    lastSolvedOp = null;
    lastSolvedNum = null;
    fontSize = 100;

    notifyListeners();
  }

  void symbolPressed(String newOperation) {
    if (operation != null && secondNumber != null && !newNumber) {
      if (operation == '×' || operation == '÷' || newOperation == '+' || newOperation == '‒') {
        double operator2 = unformatResult(secondNumber!);
        double operator1 = unformatResult(resultText);
        double result;

        switch (operation) {
          case '×':
            result = operator2 * operator1;
            break;
          case '÷':
            result = operator2 / operator1;
            break;
          case '‒':
            result = operator2 - operator1;
            break;
          case '+':
            result = operator2 + operator1;
            break;
          default:
            result = 0;
            break;
        }

        resultText = formatResult(result);
        secondNumber = null;
        newNumber = true;

        if (newOperation == '+' || newOperation == '‒') {
          if (operationHolder != null) {
            double operator2 = unformatResult(numberHolder!);
            double operator1 = unformatResult(resultText);
            double result;

            switch (operationHolder) {
              case '‒':
                result = operator2 - operator1;
                break;
              case '+':
                result = operator2 + operator1;
                break;
              default:
                result = 0;
                break;
            }

            resultText = formatResult(result);
            numberHolder = null;
            operationHolder = null;
          }
        }
      }
      else {
        operationHolder = operation;
        numberHolder = secondNumber;
      }
    }

    operation = newOperation;
    secondNumber = resultText;
    newNumber = true;

    resizeText();
    notifyListeners();
  }

  void equalPressed() {
    if (secondNumber != null && operation != null) {
      double operator2 = unformatResult(secondNumber!);
      double operator1 = unformatResult(resultText);
      double result;

      switch (operation) {
        case '+':
          result = operator2 + operator1;
          break;
        case '‒':
          result = operator2 - operator1;
          break;
        case '×':
          result = operator2 * operator1;
          break;
        case '÷':
          result = operator2 / operator1;
          break;
        default:
          result = 0;
          break;
      }

      lastSolvedNum = resultText;
      resultText = formatResult(result);
      lastSolvedOp = operation;
      operation = null;
      secondNumber = null;
      newNumber = true;

      if (operationHolder != null) {
        secondNumber = numberHolder;
        numberHolder = null;
        operation = operationHolder;
        operationHolder = null;
        equalPressed();
      }
    }
    else {
      double operator2 = unformatResult(lastSolvedNum!);
      double operator1 = unformatResult(resultText);
      double result;

      switch(lastSolvedOp) {
        case '+':
          result = operator2 + operator1;
          break;
        case '‒':
          result = operator1 - operator2;
          break;
        case '×':
          result = operator2 * operator1;
          break;
        case '÷':
          result = operator1 / operator2;
          break;
        default:
          result = 0;
          break;
      }

      resultText = formatResult(result);
      newNumber = true;
    }

    resizeText();
    notifyListeners();
  }

  void plusMinusPressed() {
    double value = unformatResult(resultText);
    value = value * (-1);
    resultText = formatResult(value);

    notifyListeners();
  }

  void percentagePressed() {
    double value = unformatResult(resultText);
    value = value / 100;
    resultText = formatResult(value);

    notifyListeners();
  }


  double unformatResult(String result) {
    String str = result.replaceAll(".", "\$");
    str = str.replaceAll(",", ".");
    str = str.replaceAll("\$", "");

    return double.parse(str).toDouble();
  }

  String formatResult(double value) {
    String str;
    if (value.floor() == value) {
      str = value.toInt().toString();
    } else {
      str = value.toString();
    }

    str = str.replaceAll(",", "\$");
    str = str.replaceAll(".", ",");
    str = str.replaceAll("\$", ",");

    double result = unformatResult(str);
    return formatter.format(result);
  }

  void resizeText() {
    String cleanNumberString = resultText.replaceAll(RegExp(r'[,.]'), '');

    if (cleanNumberString.length > 9) {
      resultText = resultText.substring(0, 9);
    }

    if (cleanNumberString.length == 6) { fontSize = 85; }
    else if (cleanNumberString.length == 7) { fontSize = 70; }
    else if (cleanNumberString.length == 8) { fontSize = 67; }
    else if (cleanNumberString.length > 8) { fontSize = 63; }
  }
}

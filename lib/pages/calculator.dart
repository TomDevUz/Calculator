import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/config.dart';
import '../providers/resultModel.dart';
import '../widgets/widgets.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    var resultModel = Provider.of<ResultModel>(context);

    return Scaffold(
      backgroundColor: Palette.blackColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    resultModel.text,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: resultModel.getFontSize,
                    ),
                    maxLines: 1,
                  )
                )
              ],
            ),
            Row(
              children: [
                OtherButton(text: "AC", textSize: TextConfig.customTextSize, bgColor: Palette.greyLightColor, textColor: Palette.greyDarkColor, onPressed: () { resultModel.resetPressed(); }),
                OtherButton(text: "+/-", textSize: TextConfig.customTextSize, bgColor: Palette.greyLightColor, textColor: Palette.greyDarkColor, onPressed: () { resultModel.plusMinusPressed(); }),
                OtherButton(text: "％", textSize: TextConfig.customTextSize, bgColor: Palette.greyLightColor, textColor: Palette.greyDarkColor, onPressed: () { resultModel.percentagePressed(); }),
                OtherButton(text: "÷", textSize: TextConfig.symbolsTextSize, bgColor: Palette.orangeColor, textColor: Palette.whiteColor, onPressed: () { resultModel.symbolPressed('÷'); }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtherButton(text: '7', textSize: TextConfig.numberTextSize, bgColor: Palette.greyDarkColor, textColor: Palette.whiteColor, onPressed: () { resultModel.selectNumber(7); }),
                OtherButton(text: '8', textSize: TextConfig.numberTextSize, bgColor: Palette.greyDarkColor, textColor: Palette.whiteColor, onPressed: () { resultModel.selectNumber(8); }),
                OtherButton(text: '9', textSize: TextConfig.numberTextSize, bgColor: Palette.greyDarkColor, textColor: Palette.whiteColor, onPressed: () { resultModel.selectNumber(9); }),
                OtherButton(text: '×', textSize: TextConfig.symbolsTextSize, bgColor: Palette.orangeColor, textColor: Palette.whiteColor, onPressed: () { resultModel.symbolPressed('×'); }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtherButton(text: '4', textSize: TextConfig.numberTextSize, bgColor: Palette.greyDarkColor, textColor: Palette.whiteColor, onPressed: () { resultModel.selectNumber(4); }),
                OtherButton(text: '5', textSize: TextConfig.numberTextSize, bgColor: Palette.greyDarkColor, textColor: Palette.whiteColor, onPressed: () { resultModel.selectNumber(5); }),
                OtherButton(text: '6', textSize: TextConfig.numberTextSize, bgColor: Palette.greyDarkColor, textColor: Palette.whiteColor, onPressed: () { resultModel.selectNumber(6); }),
                OtherButton(text: '‒', textSize: TextConfig.symbolsTextSize, bgColor: Palette.orangeColor, textColor: Palette.whiteColor, onPressed: () { resultModel.symbolPressed('‒'); }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtherButton(text: '1', textSize: TextConfig.numberTextSize, bgColor: Palette.greyDarkColor, textColor: Palette.whiteColor, onPressed: () { resultModel.selectNumber(1); }),
                OtherButton(text: '2', textSize: TextConfig.numberTextSize, bgColor: Palette.greyDarkColor, textColor: Palette.whiteColor, onPressed: () { resultModel.selectNumber(2); }),
                OtherButton(text: '3', textSize: TextConfig.numberTextSize, bgColor: Palette.greyDarkColor, textColor: Palette.whiteColor, onPressed: () { resultModel.selectNumber(3); }),
                OtherButton(text: '+', textSize: TextConfig.symbolsTextSize, bgColor: Palette.orangeColor, textColor: Palette.whiteColor, onPressed: () { resultModel.symbolPressed('+'); }),
              ],
            ),
            Row(
              children: [
                ZeroButton(onPressed: () { resultModel.selectNumber(0); }),
                OtherButton(text: ',', textSize: TextConfig.symbolsTextSize, bgColor: Palette.greyDarkColor, textColor: Palette.whiteColor, onPressed: () { resultModel.dotPressed(); }),
                OtherButton(text: '=', textSize: TextConfig.symbolsTextSize, bgColor: Palette.orangeColor, textColor: Palette.whiteColor, onPressed: () { resultModel.equalPressed(); }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
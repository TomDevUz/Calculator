import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/calculator.dart';
import 'providers/resultModel.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ResultModel(),
      child: MaterialApp(
        title: 'Calculator',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Calculator(),
      ),
    );
  }
}

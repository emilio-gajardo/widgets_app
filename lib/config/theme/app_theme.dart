import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.black,
  Colors.white,
  Colors.amber,
  Colors.blue,
  Colors.brown,
  Colors.cyan,
  Colors.green,
  Colors.grey,
  Colors.indigo,
  Colors.lime,
  Colors.orange,
  Colors.pink,
  Colors.purple,
  Colors.red,
  Colors.teal,
  Colors.yellow,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }) : assert(selectedColor >= 0, 'El indice del color debe ser mayor que 0'),
       assert(selectedColor < colorList.length, 'El indice del color debe ser menor que ${colorList.length -1}');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );
}
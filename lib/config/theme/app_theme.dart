import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.brown,
  Colors.cyan,
  Colors.green,
  Colors.grey,
  Colors.indigo,
  Colors.orange,
  Colors.purple,
  Colors.teal,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
  }) : assert(selectedColor >= 0, 'El indice del color debe ser mayor que 0'),
       assert(selectedColor < colorList.length, 'El indice del color debe ser menor que ${colorList.length -1}');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );


  /// copyWith() Es un método que copia una instancia de la clase AppTheme()
  AppTheme copyWith ({int? selectedColor, bool? isDarkMode}) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode
  );

}
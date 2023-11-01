import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

/// listado de colores inmutables
/// Provider: es para valores inmutable
final colorListProvider = Provider((ref) => colorList);

/// un simple bool
/// StateProvider: es para mantener una pieza de estado
final isDarkModeProvider = StateProvider<bool>((ref) => false);

/// un simple int
final selectedColorProvider = StateProvider<int>((ref) => 0);

/// un objeto de tipo AppTheme(custom)
/// StateNotifierProvider: es para mantener un estado mas complejo
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

/// Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme>{
  
  /// State o estado == nueva instancia de AppTheme()
  ThemeNotifier(): super(AppTheme());// crea la primera instancia con valores default

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }

}
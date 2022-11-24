import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../utils/color.dart';
import '../utils/html/html_helpers.dart';

const _primaryColor = Color(0xFF2a9fd6);
const _secondaryColor = Color(0xFF555555);
const _successColor = Color(0xFF77b300);
const _infoColor = Color(0xFF9933cc);
const _warningColor = Color(0xFFff8800);
const _dangerColor = Color.fromARGB(255, 223, 48, 36);
const _light = Color(0xFFf8f9fa);
const _dark = Color(0xFF060606);

const _textColorDark = _dark;
const _textColorLight = _light;

enum AppColorVariant {
  primary,
  secondary,
  info,
  success,
  warning,
  danger,
  light,
  dark,
}

enum AppSizeVariant {
  xs,
  sm,
  md,
  lg,
  xl,
}

extension CustomColorScheme on ColorScheme {
  Color get primary => _primaryColor;
  Color get secondary => _secondaryColor;
  Color get success => _successColor;
  Color get info => _infoColor;
  Color get warning => _warningColor;
  Color get danger => _dangerColor;
  Color get light => _light;
  Color get dark => _dark;

  Color get text => brightness == Brightness.light ? _textColorDark : _textColorLight;

  // buttons
  Color get primaryButtonBg => primary;
  Color get primaryButtonFg => const Color(0xFFFFFFFF);

  Color get secondaryButtonBg => secondary;
  Color get secondaryButtonFg => const Color(0xFFFFFFFF);

  Color get infoButtonBg => info;
  Color get infoButtonFg => const Color(0xFFFFFFFF);

  Color get dangerButtonBg => danger;
  Color get dangerButtonFg => const Color(0xFFFFFFFF);

  Color get successButtonBg => success;
  Color get successButtonFg => const Color(0xFFFFFFFF);

  Color get warningButtonBg => warning;
  Color get warningButtonFg => const Color(0xFFFFFFFF);

  Color get lightButtonBg => light;
  Color get lightButtonFg => const Color(0xFF000000);

  Color get darkButtonBg => dark;
  Color get darkButtonFg => const Color(0xFFFFFFFF);

  Color get drawerBackground => brightness == Brightness.light ? Colors.white70 : Colors.black87;
  Color get bottomSheetBackground => brightness == Brightness.light ? Colors.white70 : Colors.black87;
}

class AppTheme {
  final ThemeData themeData;

  const AppTheme({
    required this.themeData,
  });

  factory AppTheme.light() {
    final _themeData = ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: createMaterialColor(_primaryColor),
        accentColor: _secondaryColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: _secondaryColor),
        floatingLabelStyle: TextStyle(
          color: _secondaryColor,
        ),
      ),
      textTheme: _textTheme(),
      fontFamily: kIsWeb && HtmlUtils().getUserAgent().contains('OS 15_') ? '-apple-system' : null,
    );

    return AppTheme(themeData: _themeData);
  }

  factory AppTheme.dark() {
    final _themeData = ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        primarySwatch: createMaterialColor(_primaryColor),
        accentColor: _secondaryColor,
      ),
      textSelectionTheme: const TextSelectionThemeData(cursorColor: _secondaryColor),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: _secondaryColor),
        floatingLabelStyle: TextStyle(
          color: _secondaryColor,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: _secondaryColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: _infoColor),
        ),
      ),
      textTheme: _textTheme(true),
      fontFamily: kIsWeb && HtmlUtils().getUserAgent().contains('OS 15_') ? '-apple-system' : null,
    );

    return AppTheme(themeData: _themeData);
  }

  static TextTheme _textTheme([bool isDark = false]) {
    return TextTheme(
      headline1: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.w700,
        color: isDark ? _textColorLight : _textColorDark,
      ),
      headline2: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: isDark ? _textColorLight : _textColorDark,
      ),
      headline3: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: isDark ? _textColorLight : _textColorDark,
      ),
      headline4: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: (isDark ? _textColorLight : _textColorDark).withOpacity(0.8),
      ),
      headline5: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: (isDark ? _textColorLight : _textColorDark).withOpacity(0.7),
      ),
      headline6: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: (isDark ? _textColorLight : _textColorDark).withOpacity(0.6),
      ),
    );
  }

  static appVariantToColor(BuildContext context, AppColorVariant variant) {
    final _colors = Theme.of(context).colorScheme;
    switch (variant) {
      case AppColorVariant.primary:
        return _colors.primary;
      case AppColorVariant.secondary:
        return _colors.secondary;
      case AppColorVariant.info:
        return _colors.info;
      case AppColorVariant.success:
        return _colors.success;
      case AppColorVariant.warning:
        return _colors.warning;
      case AppColorVariant.danger:
        return _colors.danger;
      case AppColorVariant.light:
        return _colors.light;
      case AppColorVariant.dark:
        return _colors.dark;
    }
  }
}

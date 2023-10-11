import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

bool _lightTheme = false;

class ThemeConst {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData = getThemeData(_lightColorScheme, _lightFocusColor, isLightTheme: true);


  static ThemeData getThemeData(ColorScheme colorScheme, Color focusColor,
      {bool isLightTheme = true}) {
    _lightTheme = isLightTheme; // to get the light colors from extension
    return ThemeData(
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      textTheme: GoogleFonts.ralewayTextTheme( _textThemeLight(colorScheme)),
      appBarTheme: AppBarTheme(
        color: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
        toolbarTextStyle:GoogleFonts.ralewayTextTheme( _textThemeLight(colorScheme))
            .apply(bodyColor: colorScheme.onPrimary).bodyText2, titleTextStyle: _textThemeLight(colorScheme)
            .apply(bodyColor: colorScheme.onPrimary).headline6,
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      backgroundColor: colorScheme.background,
      buttonTheme: const ButtonThemeData(
        minWidth: 50,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor:
            Color.alphaBlend(_lightFillColor.withOpacity(0.80), _darkFillColor),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      colorScheme: colorScheme.copyWith(secondary: colorScheme.primary),
    );
  }


  static const ColorScheme _lightColorScheme = ColorScheme(
    primary: Color(0xFFf7931e),
    // changed to new theme
    secondary: Color(0xFFd92128),
    // changed to new theme
    background: Colors.white,
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _darkFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600; // not used
  static const _bold = FontWeight.w700;

  static TextTheme _textThemeLight(ColorScheme colorScheme) {
    return TextTheme(

      headline1: TextStyle(
          fontFamily: "Raleway",
          fontWeight: _bold,
          fontSize: 30.sp,
          color: colorScheme.white),
      headline2: TextStyle(
          fontFamily: "Raleway",
          fontWeight: _medium,
          fontSize: 24.sp,
          color: colorScheme.white),
      headline3: TextStyle(
          fontWeight: _bold,
          fontFamily: "Raleway",
          fontSize: 20.sp,
          color: colorScheme.primaryTextColor),
      headline4: TextStyle(
        fontSize: 18.sp,
        color: colorScheme.white,
        fontFamily: "Raleway",
      ),
      headline5: TextStyle(
          fontFamily: "Raleway",
          fontWeight: _bold,
          fontSize: 16.sp,
          color: colorScheme.white),
      headline6: TextStyle(
          fontFamily: "Raleway",
          fontWeight: _regular,
          fontSize: 12.sp,
          color: colorScheme.white),
      button: TextStyle(
          fontFamily: "Raleway",
          fontWeight: _bold,
          fontSize: 16.sp,
          color: colorScheme.white),
      subtitle1: TextStyle(
           fontFamily: "Raleway",
          fontWeight: _bold,
          fontSize: 24.sp,
          color: colorScheme.primaryTextColor),
      subtitle2: TextStyle(
           fontFamily: "Raleway",
          fontWeight: _medium,
          fontSize: 14.sp,
          color: colorScheme.grey),
      bodyText1: TextStyle(
          fontWeight: _medium,
          fontFamily: "Raleway",
          fontSize: 16.sp,
          color: colorScheme.primaryColor),
      bodyText2: TextStyle(
          fontWeight: _medium,
           fontFamily: "Raleway",
          fontSize: 10.sp,
          color: colorScheme.primaryTextColorLight),
      caption: TextStyle(
          fontWeight: _bold,
           fontFamily: "Raleway",
          fontSize: 14.sp,
          color: colorScheme.primaryTextColor),
      overline: TextStyle(
           fontFamily: "Raleway",
          fontWeight: _medium,
          fontSize: 12.sp,
          color: colorScheme.grey),
    );
  }
}

extension colorExtends on ColorScheme {
  static const primaryColorl = Color(0xFF008DD0);
  static const primaryColorLightl = Color(0xFFB5E7FE);
  static const darkGrayl = Color(0xFF979797);
  static const greyl = Color(0xFFACACAC);
  static const whitel = Color(0xFFFFFFFF);
  static const redl = Color(0xFFDB3022);
  static const lightGrayl = Color(0xFF9B9B9B);
  static const orangel = Color(0xFFfff5e0);
  static const backgroundLightl = Color(0xFFF9F9F9);
  static const blackl = Color(0xff000000);
  static const popUpBannerGreenl = Color(0xFF19a96a);
  static const popUpBannerRedl = Color(0xFFA12027);
  static const popUpBannerOrangel = Color(0xFFFA6400);
  static const disablel = Color(0xFF929794);
  static const primaryTextColorl = Color(0xFF000000);
  static const primaryTextColorLightl = Color(0xFF464646);
  static const yellowl = Color(0xffffcb05);
  static const lightyellowl = Color(0xffffcf66);
  static const sapphirel = Color(0xff0091ff);
  static const electic_purpll = Color(0xffc526fc);
  static const shadowColorl = Color(0x29747474);
  static const _lightRedColor = Color(0xFFFFF2F2);
  static const _maroonColor = Color(0xFFC76060);
  static const primaryColorD = Color(0xFF6027d0);
  static const primaryColorLightD = Color(0xFFd1bff3);
  static const darkGrayD = Color(0xFF979797);
  static const greyD = Color(0xFFACACAC);
  static const whiteD = Color(0x00FFFFFF);
  static const redD = Color(0xFFDB3022);
  static const lightGrayD = Color(0xFF9B9B9B);
  static const orangeD = Color(0xFFFFBA49);
  static const backgroundLightD = Color(0xFFF9F9F9);
  static const blackD = Color(0x00000000);
  static const popUpBannerGreenD = Color(0xFF53CC73);
  static const popUpBannerRedD = Color(0xFFA12027);
  static const popUpBannerOrangeD = Color(0xFFFA6400);
  static const disableD = Color(0xFF929794);
  static const primaryTextColorD = Color(0xFF000000);
  static const primaryTextColorLightD = Color(0xFF464646);
  static const yellowD = Color(0xfffdd856);
  static const lightyellowD = Color(0xffffcf66);
  static const sapphireD = Color(0xff0091ff);
  static const electic_purpleD = Color(0xffc526fc);
  static const shadowColorD = Color(0x29747474);
  static const yellowColor = Color(0xFFFFCF66);
  static const _secondaryCardColor = Color(0xFF6F77FB);
  static const _purple = Color(0xFF8052d9);
  static const _purple4 = Color(0xFFF9F7Fd);
  static const _indigo = Color(0xFF1A3dA3);
  static const _lightBlack = Color(0xFFF1F4FF);
  static const _lightGreen = Color(0xFFEFFFFA);
  static const _darkGreen = Color(0xFF258C6E);
  static const _lightIndigo = Color(0xffdddfff);
  static const _indigoDark = Color(0xff454dc5);
  static const _lightblue = Color(0xfff9faff);
  static const lightTextColorL = Color(0xFF747474);
  static const lightTextColorD = Color(0xFF747474);
  static const _offGreen = Color(0xffecfff7);
  static const _fairPink = Color(0xfffff2ec);
  static const _peachCream = Color(0xfffff1e6);
  static const _borderColor = Color(0xffadadad);

  static const _bottomSheetShadow = Color(0x29000000);
  static const _lightRed = Color(0xffffcecb);
  static const _bgOrange = Color(0xffffd9bf);
  static const _bgBlue = Color(0xffefe9fa);
  static const _bgGreen = Color(0xffd6ffed);
  static const _lightGreenCardColor = Color(0xFFe5fbf7);
  static const _blackishCardColor = Color(0xd9000000);
  static const _violetColor = Color(0xff6f3cd4);
  static const _lightGreyColor = Color(0xffadadad);
  static const _tomatoRedColor = Color(0xffcd5f4f);
  static const _lightGrey2Color = Color(0xff5c5c5c);
  static const _yellowDarkColor = Color(0xfffdd855);
  static const _redColor = Color(0xffce2d22);
  static const _darkGreenColor = Color(0xff082d0f);
  static const _brownColor = Color(0xff502419);
  static const _steelBlueColor = Color(0xff104c72);
  static const _ruriBlueColor = Color(0xffce2d22);
  static const _darkGrey = Color(0xff181818);
  static const _greenTeal = Color(0xffedfff0);
  static const _lavaRed = Color(0xffe02020);
  static const _tealishBlue = Color(0xfff0f3fc);
  static const _whiteLilac = Color(0xfff7f9ff);
  static const _primaryCtaBorderL = Color(0xFFdfd4f6);
  static const _primaryCtaBorderD = Color(0xFFdfd4f6);
  static const _deliveryCardBgColorL = Color(0xFFF0F4FF);
  static const _deliveryCardBgColorD = Color(0xFFF0F4FF);
  static const _deliveryCardCTABgColorL = Color(0xFF1e49be);
  static const _deliveryCardCTABgColorD = Color(0xFF1e49be);
  static const _sunShade = Color(0xffeea422);
  static const _deepBronze = Color(0xff502e0d);
  static const _paleOrange = Color(0xffe8b459);
  static const _mediumBrown = Color(0xff7d4814);
  static const _ghostWhite = Color(0xfff5f8ff);
  static const _softGreen = Color(0xff5cbc92);
  static const _softRed = Color(0xffeb5858);
  static const _coralPink = Color(0xffed8787);
  static const _greenPea = Color(0xff2c694e);
  static const _paleBlue = Color(0xffbdcbeb);
  static const _oceanBlue = Color(0xff007eae);
  static const _iceGreen = Color(0xffdef5ed);
  static const _planInfoMetaWidgetBgColorL = Color(0xFFF9F6FD);
  static const _planInfoMetaWidgetBgColorD = Color(0xFFF9F6FD);
  static const _platinum = Color(0xffe5e5e5);
  static const _bleachWhite = Color(0xFFffeee3);
  static const _coolBlue = Color(0xff347fb7);
  static const _lilyWhite = Color(0xfff0f4ff);
  static const _setUpAutopayBtnColor = Color(0xff43a190);
  static const _offWhiteBgColor = Color(0xfff0f1f2);
  static const _profileCardShadowColor = Color(0xffd6d6d6);
  static const _profileCardBgColor = Color(0xff545454);
  static const _bottomBarShadowColor = Color(0x29000000);
  static const _lightVioletBgColor = Color(0xfff9f7fe);
  static const _darkVioletColor = Color(0xff4c1ea6);
  static const _darkBlueColor = Color(0xff25319a);
  static const _creamColor = Color(0xfffbedde);
  static const _goldenYellowColor = Color(0xffffcf67);
  static const _darkCreamColor = Color(0xffd2b290);
  static const _reviewBgColor = Color(0xfffcf5ee);
  static const _darkBrownColor = Color(0xff7c4117);
  static const _lightBrownColor = Color(0xff7c4117);
  static const _borderGoldenBrown = Color(0xffd2b290);
  static const _darkGreenShade = Color(0xff43a090);
  static const _brownColorLightShade = Color(0xff7d4218);
  static const _creamColorBg = Color(0xfffdf5ee);
  static const _lightWhite = Color(0xfff5f5f5);
  static const _primaryShade = Color(0xff6127d0);
  static const _yellowShade = Color(0xffffd077);
  static const _darkVioletColorShade = Color(0xff1b1464);
  static const _lightBlueShade = Color(0xFF2C70BA);
  static const _goldHeadingColor = Color(0xffffb000);
  static const _creamDividerColor = Color(0xfffcf4ec);
  static const _tealDarkShade = Color(0xff1c7d96);
  static const _tealMediumDarkShade = Color(0xff67a8b9);
  static const _tealLightShade = Color(0xff9fc8d3);
  static const _tealLightShade2 = Color(0xffb8d7de);
  static const _aliceBlue = Color(0xFFEFF8FA);
  static const _bannerShadeLight = Color(0xffe7e8ef);
  static const _silver = Color(0xffe2e2e2);
  static const _darkPink = Color(0xffcc2b4b);
  static const _lightPink = Color(0xfff3edef);
  static const _paleWhite = Color(0xfff4f4f4);
  static const _orangeLight = Color(0xffff6e66);
  static const _bgVoilet = Color(0xff706faa);

  Color get silver => _silver;

  Color get bgVoilet => _bgVoilet;

  Color get paleWhite => _paleWhite;

  Color get orangeLight => _orangeLight;

  Color get lightPink => _lightPink;

  Color get darkPink => _darkPink;

  Color get bannerShadeLight => _bannerShadeLight;

  Color get tealLightShade2 => _tealLightShade2;

  Color get tealMediumDarkShade => _tealMediumDarkShade;

  Color get aliceBlue => _aliceBlue;

  Color get tealDarkShade => _tealDarkShade;

  Color get tealLightShade => _tealLightShade;

  Color get lightGreenCardColor => _lightGreenCardColor;

  Color get tomatoRedColor => _tomatoRedColor;

  Color get darkGreenColor => _darkGreenColor;

  Color get brownColor => _brownColor;

  Color get steelBlueColor => _steelBlueColor;

  Color get ruriBlueColor => _ruriBlueColor;

  Color get redColor => _redColor;

  Color get yellowDarkColor => _yellowDarkColor;

  Color get blackishCardColor => _blackishCardColor;

  Color get lightGrey2Color => _lightGrey2Color;

  Color get lightGreyColor => _lightGreyColor;

  Color get violetColor => _violetColor;

  Color get secondaryCardColor => _secondaryCardColor;

  Color get primaryColor => _lightTheme ? primaryColorl : primaryColorD;

  Color get primaryColorLight =>
      _lightTheme ? primaryColorLightl : primaryColorLightD;

  Color get darkGray => _lightTheme ? darkGrayl : darkGrayD;

  Color get grey => _lightTheme ? greyl : greyD;

  Color get white => _lightTheme ? whitel : whiteD;

  Color get red => _lightTheme ? redl : redD;

  Color get lightGray => _lightTheme ? lightGrayl : lightGrayD;

  Color get orange => _lightTheme ? orangel : orangeD;

  Color get purple => _purple;

  Color get backgroundLight =>
      _lightTheme ? backgroundLightl : backgroundLightD;

  Color get lightRedColor => _lightRedColor;

  Color get black => _lightTheme ? blackl : blackD;

  Color get popUpBannerGreen =>
      _lightTheme ? popUpBannerGreenl : popUpBannerGreenD;

  Color get popUpBannerRed => _lightTheme ? popUpBannerRedl : popUpBannerRedD;

  Color get popUpBannerOrange =>
      _lightTheme ? popUpBannerOrangel : popUpBannerOrangeD;

  Color get disable => _lightTheme ? disablel : disableD;

  Color get primaryTextColor =>
      _lightTheme ? primaryTextColorl : primaryTextColorD;

  Color get primaryTextColorLight =>
      _lightTheme ? primaryTextColorLightl : primaryTextColorLightD;

  Color get yellow => _lightTheme ? yellowl : yellowD;

  Color get lightyellow => _lightTheme ? lightyellowl : lightyellowD;

  Color get sapphire => _lightTheme ? sapphirel : sapphireD;

  Color get electic_purpl => _lightTheme ? electic_purpll : electic_purpleD;

  Color get shadowColor => _lightTheme ? shadowColorl : shadowColorD;

  Color get yellowCardColor => yellowColor;

  Color get maroonColor => _maroonColor;

  Color get purple4 => _purple4;

  Color get indigo => _indigo;

  Color get lightBlack => _lightBlack;

  Color get lightGreen => _lightGreen;

  Color get darkGreen => _darkGreen;

  Color get indigoDark => _indigoDark;

  Color get lightIndigo => _lightIndigo;

  Color get lightTextColor => _lightTheme ? lightTextColorL : lightTextColorD;

  Color get bottomSheetShadow => _bottomSheetShadow;

  Color get lightBlue => _lightblue;

  Color get lightPurple => primaryColorD;

  Color get offGreen => _offGreen;

  Color get fairPink => _fairPink;

  Color get primaryCtaBorder =>
      _lightTheme ? _primaryCtaBorderL : _primaryCtaBorderD;

  Color get deliveryCardBgColor =>
      _lightTheme ? _deliveryCardBgColorL : _deliveryCardBgColorD;

  Color get deliveryCardCTABgColor =>
      _lightTheme ? _deliveryCardCTABgColorL : _deliveryCardCTABgColorD;

  Color get peachCream => _peachCream;

  Color get darkGrey => _darkGrey;

  Color get greenTeal => _greenTeal;

  Color get lavaRed => _lavaRed;

  Color get tealishBlue => _tealishBlue;

  Color get whiteLilac => _whiteLilac;

  Color get sunShade => _sunShade;

  Color get deepBronze => _deepBronze;

  Color get paleOrange => _paleOrange;

  Color get mediumBrown => _mediumBrown;

  Color get ghostWhite => _ghostWhite;

  Color get softGreen => _softGreen;

  Color get softRed => _softRed;

  Color get coralPink => _coralPink;

  Color get greenPea => _greenPea;

  Color get paleBlue => _paleBlue;

  Color get planInfoMetaWidgetBgColor =>
      _lightTheme ? _planInfoMetaWidgetBgColorL : _planInfoMetaWidgetBgColorD;

  Color get lightRed => _lightRed;

  Color get bgOrange => _bgOrange;

  Color get bgBlue => _bgBlue;

  Color get bgGreen => _bgGreen;

  Color get borderColor => _borderColor;

  Color get iceGreen => _iceGreen;

  Color get oceanBlue => _oceanBlue;

  Color get platinum => _platinum;

  Color get bleachWhite => _bleachWhite;

  Color get coolBlue => _coolBlue;

  Color get lilyWhite => _lilyWhite;

  Color get setUpAutopayBtnColor => _setUpAutopayBtnColor;

  Color get offWhiteBgColor => _offWhiteBgColor;

  Color get profileCardShadowColor => _profileCardShadowColor;

  Color get profileCardBgColor => _profileCardBgColor;

  Color get bottomBarShadowColor => _bottomBarShadowColor;

  Color get lightVioletBgColor => _lightVioletBgColor;

  Color get darkVioletColor => _darkVioletColor;

  Color get darkBlueColor => _darkBlueColor;

  Color get creamColor => _creamColor;

  Color get goldenYellowColor => _goldenYellowColor;

  Color get darkCreamColor => _darkCreamColor;

  Color get reviewBgColor => _reviewBgColor;

  Color get darkBrownColor => _darkBrownColor;

  Color get lightBrownColor => _lightBrownColor;

  Color get borderGoldenBrown => _borderGoldenBrown;

  Color get darkGreenShade => _darkGreenShade;

  Color get brownColorLightShade => _brownColorLightShade;

  Color get creamColorBg => _creamColorBg;

  Color get lightWhite => _lightWhite;

  Color get primaryShade => _primaryShade;

  Color get yellowShade => _yellowShade;

  Color get darkVioletColorShade => _darkVioletColorShade;

  Color get lightBlueShade => _lightBlueShade;

  Color get goldHeadingColor => _goldHeadingColor;

  Color get creamDividerColor => _creamDividerColor;
}

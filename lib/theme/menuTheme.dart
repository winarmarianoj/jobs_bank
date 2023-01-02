import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/* ThemeData themeLightOne = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
    primarySwatch: MaterialColor(
      0xFFF5E0C3,
      <int, Color>{
        50: Color(0x1aF5E0C3),
        100: Color(0xa1F5E0C3),
        200: Color(0xaaF5E0C3),
        300: Color(0xafF5E0C3),
        400: Color(0xffF5E0C3),
        500: Color(0xffEDD5B3),
        600: Color(0xffDEC29B),
        700: Color(0xffC9A87C),
        800: Color(0xffB28E5E),
        900: Color(0xff936F3E)
      },
    ),
    primaryColor: Color(0xffEDD5B3),
    primaryColorBrightness: Brightness.light,
    primaryColorLight: Color(0x1aF5E0C3),
    primaryColorDark: Color(0xff936F3E),
    canvasColor: Color(0xffE09E45),
    accentColor: Color(0xff457BE0),
    accentColorBrightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xffB5BFD3),
    bottomAppBarColor: Color(0xff6D42CE),
    cardColor: Color(0xaaF5E0C3),
    dividerColor: Color(0x1f6D42CE),
    focusColor: Color(0x1aF5E0C3));
 */

/* ThemeData themeDarkOne = ThemeData(

    brightness: Brightness.dark,
    visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
    primarySwatch: MaterialColor(
      0xFFF5E0C3,
      <int, Color>{
        50: Color(0x1a5D4524),
        100: Color(0xa15D4524),
        200: Color(0xaa5D4524),
        300: Color(0xaf5D4524),
        400: Color(0x1a483112),
        500: Color(0xa1483112),
        600: Color(0xaa483112),
        700: Color(0xff483112),
        800: Color(0xaf2F1E06),
        900: Color(0xff2F1E06)
      },
    ),
    primaryColor: Color(0xff5D4524),
    primaryColorBrightness: Brightness.dark,
    primaryColorLight: Color(0x1a311F06),
    primaryColorDark: Color(0xff936F3E),
    canvasColor: Color(0xffE09E45),
    accentColor: Colors.pink,//Color(0xff457BE0),
    accentColorBrightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xffB5BFD3),
    bottomAppBarColor: Color(0xff6D42CE),
    cardColor: Color(0xaa311F06), //este es el color del custompopup y barra
    dividerColor: Color(0x1f6D42CE),
    focusColor: Color(0x1a311F06));
 */

ThemeData themeLightTwo = ThemeData(
  brightness: Brightness.light,
  visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
  primarySwatch: MaterialColor(
    /* 0xFFF5E0C3,
    <int, Color>{
      50: Color(0x1aF5E0C3),
      100: Color(0xa1F5E0C3),
      200: Color(0xaaF5E0C3),
      300: Color(0xafF5E0C3),
      400: Color(0xffF5E0C3),
      500: Color(0xffEDD5B3),
      600: Color(0xffDEC29B),
      700: Color(0xffC9A87C),
      800: Color(0xffB28E5E),
      900: Color(0xff936F3E) */
      0xFF1CE9D4,
    <int, Color>{
      50: Color(0x1a1CE9D4),
      100: Color(0xa11CE9D4),
      200: Color(0xaa1CE9D4),
      300: Color(0xaf1CE9D4),
      400: Color(0xff1CE9D4),
      500: Color(0xff1CE9D4),
      600: Color(0xff1CE9D4),
      700: Color(0xff1CE9D4),
      800: Color(0xff1CE9D4),
      900: Color(0xff1CE9D4)
    },
  ),
  primaryColor: Color(0xff1CE9D4),
  primaryColorBrightness: Brightness.light,
  primaryColorLight: Color(0x1aF5E0C3),
  primaryColorDark: Color(0xff1CE9D4),
  canvasColor: Color(0xffE09E45),
  accentColor: Color(0xff457BE0),
  accentColorBrightness: Brightness.light,
  // color fondo background
  scaffoldBackgroundColor: Color.fromARGB(170, 27, 207, 189),
  bottomAppBarColor: Color(0xff6D42CE),
  cardColor: Color(0xaa1CE9D4),
  dividerColor: Color(0x1f6D42CE),
  focusColor: Color(0x1aF5E0C3),
  hoverColor: Color(0xff1CE9D4),
  highlightColor: Color(0xff1CE9D4),
  splashColor: Color(0xff457BE0),
//  splashFactory: # override create method from  InteractiveInkFeatureFactory
  selectedRowColor: Colors.grey,
  unselectedWidgetColor: Colors.grey.shade400,
  disabledColor: Colors.grey.shade200,
  buttonTheme: ButtonThemeData(
      //button themes
      ),
  toggleButtonsTheme: ToggleButtonsThemeData(
      //toggle button theme
      ),
  buttonColor: Color(0xff1CE9D4),
  secondaryHeaderColor: Colors.grey,
  /* textSelectionColor: Color(0xffB5BFD3),
  cursorColor: Color(0xff936F3E),
  textSelectionHandleColor: Color(0xff936F3E), */
  backgroundColor: Color(0xff457BE0),
  dialogBackgroundColor: Colors.white,
  indicatorColor: Color(0xff457BE0),
  hintColor: Colors.grey,
  errorColor: Colors.red,
  toggleableActiveColor: Color(0xff6D42CE),
  textTheme: TextTheme(
      //text themes that contrast with card and canvas
      ),
  primaryTextTheme: TextTheme(
      //text theme that contrast with primary color
      ),
  accentTextTheme: TextTheme(
      //text theme that contrast with accent Color
      ),
  inputDecorationTheme: InputDecorationTheme(
      // default values for InputDecorator, TextField, and TextFormField
      ),
  iconTheme: IconThemeData(
      //icon themes that contrast with card and canvas
      ),
  primaryIconTheme: IconThemeData(
      //icon themes that contrast primary color
      ),
  accentIconTheme: IconThemeData(
      //icon themes that contrast accent color
      ),
);

ThemeData themeDarkTwo = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
  primarySwatch: MaterialColor(
    /* 0xFFF5E0C3,
    <int, Color>{
      50: Color(0x1a5D4524),
      100: Color(0xa15D4524),
      200: Color(0xaa5D4524),
      300: Color(0xaf5D4524),
      400: Color(0x1a483112),
      500: Color(0xa1483112),
      600: Color(0xaa483112),
      700: Color(0xff483112),
      800: Color(0xaf2F1E06),
      900: Color(0xff2F1E06) */
      0xFF0E655C,
    <int, Color>{
      50: Color(0x1a0E655C),
      100: Color(0xa10E655C),
      200: Color(0xaa0E655C),
      300: Color(0xaf0E655C),
      400: Color(0x1a0E655C),
      500: Color(0xa10E655C),
      600: Color(0xaa0E655C),
      700: Color(0xff0E655C),
      800: Color(0xaf0E655C),
      900: Color(0xff0E655C)      
    },
  ),
  primaryColor: Color(0xff0E655C),
  primaryColorBrightness: Brightness.dark,
  primaryColorLight: Color(0x1a311F06),
  primaryColorDark: Color(0xff0E655C),
  canvasColor: Color(0xffE09E45),
  accentColor: Colors.pink,//Color(0xff457BE0),
  accentColorBrightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xaa0E655C),// Color.fromARGB(255, 10, 76, 206),
  bottomAppBarColor: Color(0xff6D42CE),
  cardColor: Color.fromARGB(170, 35, 143, 132),
  dividerColor: Color(0x1f6D42CE),
  focusColor: Color.fromARGB(26, 71, 45, 8),
  hoverColor: Color.fromARGB(160, 59, 180, 168),
  highlightColor: Color.fromARGB(174, 75, 47, 9),
  splashColor: Color(0xff457BE0),
//  splashFactory: # override create method from  InteractiveInkFeatureFactory
  selectedRowColor: Colors.grey,
  unselectedWidgetColor: Colors.grey.shade400,
  disabledColor: Colors.grey.shade200,
  buttonTheme: ButtonThemeData(
//button themes
      ),
  toggleButtonsTheme: ToggleButtonsThemeData(
//toggle button theme
      ),
  buttonColor: Color(0xffC24303),
  secondaryHeaderColor: Colors.grey,
  /* textSelectionColor: Color(0x1a483112),
  cursorColor: Color(0xff483112),
  textSelectionHandleColor: Color(0xff483112), */
  backgroundColor: Color.fromARGB(255, 31, 78, 167),
   
  dialogBackgroundColor: Color.fromARGB(255, 187, 30, 30),
  indicatorColor: Color.fromARGB(255, 159, 168, 185),
  hintColor: Colors.grey,
  errorColor: Colors.red,
  toggleableActiveColor: Color(0xff6D42CE),
  textTheme: TextTheme(
//text themes that contrast with card and canvas
      ),
  primaryTextTheme: TextTheme(
//text theme that contrast with primary color
      ),
  accentTextTheme: TextTheme(
//text theme that contrast with accent Color
      ),
  inputDecorationTheme: InputDecorationTheme(
// default values for InputDecorator, TextField, and TextFormField
      ),
  iconTheme: IconThemeData(
//icon themes that contrast with card and canvas
      ),
  primaryIconTheme: IconThemeData(
//icon themes that contrast primary color
      ),
  accentIconTheme: IconThemeData(
//icon themes that contrast accent color
      ),
);

/* ThemeData themeLightThree = ThemeData(
    brightness: Brightness.light,
    visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
    primarySwatch: MaterialColor(
      0xFFF5E0C3,
      <int, Color>{
        50: Color(0x1aF5E0C3),
        100: Color(0xa1F5E0C3),
        200: Color(0xaaF5E0C3),
        300: Color(0xafF5E0C3),
        400: Color(0xffF5E0C3),
        500: Color(0xffEDD5B3),
        600: Color(0xffDEC29B),
        700: Color(0xffC9A87C),
        800: Color(0xffB28E5E),
        900: Color(0xff936F3E)
      },
    ),
    primaryColor: Color(0xffEDD5B3),
    primaryColorBrightness: Brightness.light,
    primaryColorLight: Color(0x1aF5E0C3),
    primaryColorDark: Color(0xff936F3E),
    canvasColor: Color(0xffE09E45),
    accentColor: Color(0xff457BE0),
    accentColorBrightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xffB5BFD3),
    bottomAppBarColor: Color(0xff6D42CE),
    cardColor: Color(0xaaF5E0C3),
    dividerColor: Color(0x1f6D42CE),
    focusColor: Color(0x1aF5E0C3),
    hoverColor: Color(0xffDEC29B),
    highlightColor: Color(0xff936F3E),
    splashColor: Color(0xff457BE0),
//  splashFactory: # override create method from  InteractiveInkFeatureFactory
    selectedRowColor: Colors.grey,
    unselectedWidgetColor: Colors.grey.shade400,
    disabledColor: Colors.grey.shade200,
    buttonTheme: ButtonThemeData(
        //button themes
        ),
    toggleButtonsTheme: ToggleButtonsThemeData(
        //toggle button theme
        ),
    buttonColor: Color(0xff936F3E),
    secondaryHeaderColor: Colors.grey,
    /* textSelectionColor: Color(0xffB5BFD3),
    cursorColor: Color(0xff936F3E),
    textSelectionHandleColor: Color(0xff936F3E), */
    backgroundColor: Color(0xff457BE0),
    dialogBackgroundColor: Colors.white,
    indicatorColor: Color(0xff457BE0),
    hintColor: Colors.grey,
    errorColor: Colors.red,
    toggleableActiveColor: Color(0xff6D42CE),
    textTheme: TextTheme(
        //text themes that contrast with card and canvas
        ),
    primaryTextTheme: TextTheme(
        //text theme that contrast with primary color
        ),
    accentTextTheme: TextTheme(
        //text theme that contrast with accent Color
        ),
    inputDecorationTheme: InputDecorationTheme(
        // default values for InputDecorator, TextField, and TextFormField
        ),
    iconTheme: IconThemeData(
        //icon themes that contrast with card and canvas
        ),
    primaryIconTheme: IconThemeData(
        //icon themes that contrast primary color
        ),
    accentIconTheme: IconThemeData(
        //icon themes that contrast accent color
        ),
    sliderTheme: SliderThemeData(
        // slider themes
        ),
    tabBarTheme: TabBarTheme(
        // tab bat theme
        ),
    tooltipTheme: TooltipThemeData(
        // tool tip theme
        ),
    cardTheme: CardTheme(
        // card theme
        ),
    chipTheme: ChipThemeData(
        backgroundColor: Color(0xff936F3E),
        disabledColor: Color(0xaaF5E0C3),
        shape: StadiumBorder(),
        brightness: Brightness.light,
        labelPadding: EdgeInsets.all(8),
        labelStyle: TextStyle(),
        padding: EdgeInsets.all(8),
        secondaryLabelStyle: TextStyle(),
        secondarySelectedColor: Colors.white38,
        selectedColor: Colors.white
        // chip theme
        ),
    platform: TargetPlatform.android,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    applyElevationOverlayColor: true,
    pageTransitionsTheme: PageTransitionsTheme(
        //page transition theme
        ),
    appBarTheme: AppBarTheme(
        //app bar theme
        ),
    bottomAppBarTheme: BottomAppBarTheme(
        // bottom app bar theme
        ),
    colorScheme: ColorScheme(
        primary: Color(0xffEDD5B3),
        primaryVariant: Color(0x1aF5E0C3),
        secondary: Color(0xffC9A87C),
        secondaryVariant: Color(0xaaC9A87C),
        brightness: Brightness.light,
        background: Color(0xffB5BFD3),
        error: Colors.red,
        onBackground: Color(0xffB5BFD3),
        onError: Colors.red,
        onPrimary: Color(0xffEDD5B3),
        onSecondary: Color(0xffC9A87C),
        onSurface: Color(0xff457BE0),
        surface: Color(0xff457BE0)),
    snackBarTheme: SnackBarThemeData(
        // snack bar theme
        ),
    dialogTheme: DialogTheme(
        // dialog theme
        ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        // floating action button theme
        ),
    navigationRailTheme: NavigationRailThemeData(
        // navigation rail theme
        ),
    typography: Typography.material2018(),
    cupertinoOverrideTheme: CupertinoThemeData(
        //cupertino theme
        ),
    bottomSheetTheme: BottomSheetThemeData(
        //bottom sheet theme
        ),
    popupMenuTheme: PopupMenuThemeData(
        //pop menu theme
        ),
    bannerTheme: MaterialBannerThemeData(
        // material banner theme
        ),
    dividerTheme: DividerThemeData(
        //divider, vertical divider theme
        ),
    buttonBarTheme: ButtonBarThemeData(
        // button bar theme
        ),
    fontFamily: 'ROBOTO',
    splashFactory: InkSplash.splashFactory
);

ThemeData themeDarkThree = ThemeData( 
    brightness: Brightness.dark,
    visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
    primarySwatch: MaterialColor(
      0xFFF5E0C3,
      <int, Color>{
        50: Color(0x1a5D4524),
        100: Color(0xa15D4524),
        200: Color(0xaa5D4524),
        300: Color(0xaf5D4524),
        400: Color(0x1a483112),
        500: Color(0xa1483112),
        600: Color(0xaa483112),
        700: Color(0xff483112),
        800: Color(0xaf2F1E06),
        900: Color(0xff2F1E06)
      },
    ),
    primaryColor: Color(0xff5D4524),
    primaryColorBrightness: Brightness.dark,
    primaryColorLight: Color(0x1a311F06),
    primaryColorDark: Color(0xff936F3E),
    canvasColor: Color(0xffE09E45),
    accentColor: Color(0xff457BE0),
    accentColorBrightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xffB5BFD3),
    bottomAppBarColor: Color(0xff6D42CE),
    cardColor: Color(0xaa311F06),
    dividerColor: Color(0x1f6D42CE),
    focusColor: Color(0x1a311F06),
    hoverColor: Color(0xa15D4524),
    highlightColor: Color(0xaf2F1E06),
    splashColor: Color(0xff457BE0),
//  splashFactory: # override create method from  InteractiveInkFeatureFactory
    selectedRowColor: Colors.grey,
    unselectedWidgetColor: Colors.grey.shade400,
    disabledColor: Colors.grey.shade200,
    buttonTheme: ButtonThemeData(
//button themes
        ),
    toggleButtonsTheme: ToggleButtonsThemeData(
//toggle button theme
        ),
    buttonColor: Color(0xff483112),
    secondaryHeaderColor: Colors.grey,
    /* textSelectionColor: Color(0x1a483112),
    cursorColor: Color(0xff483112),
    textSelectionHandleColor: Color(0xff483112), */
    backgroundColor: Color(0xff457BE0),
    dialogBackgroundColor: Colors.white,
    indicatorColor: Color(0xff457BE0),
    hintColor: Colors.grey,
    errorColor: Colors.red,
    toggleableActiveColor: Color(0xff6D42CE),
    textTheme: TextTheme(
//text themes that contrast with card and canvas
        ),
    primaryTextTheme: TextTheme(
//text theme that contrast with primary color
        ),
    accentTextTheme: TextTheme(
//text theme that contrast with accent Color
        ),
    inputDecorationTheme: InputDecorationTheme(
// default values for InputDecorator, TextField, and TextFormField
        ),
    iconTheme: IconThemeData(
//icon themes that contrast with card and canvas
        ),
    primaryIconTheme: IconThemeData(
//icon themes that contrast primary color
        ),
    accentIconTheme: IconThemeData(
//icon themes that contrast accent color
        ),
    sliderTheme: SliderThemeData(
        // slider themes
        ),
    tabBarTheme: TabBarTheme(
        // tab bat theme
        ),
    tooltipTheme: TooltipThemeData(
        // tool tip theme
        ),
    cardTheme: CardTheme(
        // card theme
        ),
    chipTheme: ChipThemeData(
        backgroundColor: Color(0xff2F1E06),
        disabledColor: Color(0xa15D4524),
        shape: StadiumBorder(),
        brightness: Brightness.dark,
        labelPadding: EdgeInsets.all(8),
        labelStyle: TextStyle(),
        padding: EdgeInsets.all(8),
        secondaryLabelStyle: TextStyle(),
        secondarySelectedColor: Colors.white38,
        selectedColor: Colors.white
        // chip theme
        ),
    platform: TargetPlatform.android,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    applyElevationOverlayColor: true,
    pageTransitionsTheme: PageTransitionsTheme(
        //page transition theme
        ),
    appBarTheme: AppBarTheme(
        //app bar theme
        ),
    bottomAppBarTheme: BottomAppBarTheme(
        // bottom app bar theme
        ),
    colorScheme: ColorScheme(
        primary: Color(0xff5D4524),
        primaryVariant: Color(0x1a311F06),
        secondary: Color(0xff457BE0),
        secondaryVariant: Color(0xaa457BE0),
        brightness: Brightness.dark,
        background: Color(0xffB5BFD3),
        error: Colors.red,
        onBackground: Color(0xffB5BFD3),
        onError: Colors.red,
        onPrimary: Color(0xff5D4524),
        onSecondary: Color(0xff457BE0),
        onSurface: Color(0xff457BE0),
        surface: Color(0xff457BE0)),
    snackBarTheme: SnackBarThemeData(
        // snack bar theme
        ),
    dialogTheme: DialogTheme(
        // dialog theme
        ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        // floating action button theme
        ),
    navigationRailTheme: NavigationRailThemeData(
        // navigation rail theme
        ),
    typography: Typography.material2018(),
    cupertinoOverrideTheme: CupertinoThemeData(
        //cupertino theme
        ),
    bottomSheetTheme: BottomSheetThemeData(
        //bottom sheet theme
        ),
    popupMenuTheme: PopupMenuThemeData(
        //pop menu theme
        ),
    bannerTheme: MaterialBannerThemeData(
        // material banner theme
        ),
    dividerTheme: DividerThemeData(
        //divider, vertical divider theme
        ),
    buttonBarTheme: ButtonBarThemeData(
        // button bar theme
        ),
    fontFamily: 'ROBOTO',
    splashFactory: InkSplash.splashFactory); */
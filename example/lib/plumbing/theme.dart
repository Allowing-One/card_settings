import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

import 'scaffold.dart';

class ExampleTheme extends StatelessWidget {
  const ExampleTheme({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => _buildTheme(brightness),
        themedWidgetBuilder: (context, theme) {
          return MaterialApp(
            title: 'Card Settings Example',
            home: ExampleScaffold(),
            theme: theme,
          );
        });
  }
}

ThemeData _buildTheme(Brightness brightness) {
  switch (brightness) {
    case Brightness.light:
      return ThemeData(
        primaryColor: Colors.teal, // app header background
        secondaryHeaderColor: Colors.indigo[400], // card header background
        cardColor: Colors.white, // card field background
        backgroundColor: Colors.indigo[100], // app background color
        buttonColor: Colors.lightBlueAccent[100], // button background color
        textTheme: TextTheme(
          button: TextStyle(color: Colors.deepPurple[900]), // button text
          subtitle1: TextStyle(color: Colors.grey[800]), // input text
          headline6: TextStyle(color: Colors.white), // card header text
        ),
        primaryTextTheme: TextTheme(
          headline6: TextStyle(color: Colors.lightBlue[50]), // app header text
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.indigo[400]), // style for labels
        ),
      );
    case Brightness.dark:
      return ThemeData(
        primarySwatch: Colors.teal,
        brightness: brightness,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Colors.black,
      );
    default:
      return ThemeData(
        primarySwatch: Colors.teal,
        brightness: brightness,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
  }
}

import 'package:flutter/material.dart';

// Views
import 'views/MainView.dart';
import 'views/NoLocationView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  MyApp({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/noLocation',
      routes: {
        '/': (context) => MainView (),
        '/noLocation': (context) => NoLocationView (),
      },
    );
  }
}

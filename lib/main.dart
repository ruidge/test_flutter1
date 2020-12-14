import 'package:flutter/material.dart';
import 'package:test_flutter1/page/home_page.dart';

import 'routes/no_page_transition.dart';
import 'routes/routers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FRouter.initRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        pageTransitionsTheme: NoPageTransition(),
      ),
      home: HomePage(),
    );
  }
}

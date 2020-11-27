import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter1/page/home_page.dart';
import 'package:test_flutter1/page/test_mq_page.dart';

class FRouter {
  static final FluroRouter router = FluroRouter();

  static final home = "home";
  static final test_mq_page = "test_mq_page";

  static Map<String, Widget> routerMap = {
    home: HomePage(),
    test_mq_page: TestMqPage(),
  };

  static void initRoutes() {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return _NotFoundPage();
    });

    routerMap.forEach((key, value) {
      router.define(key,
          handler: Handler(
              handlerFunc:
                  (BuildContext context, Map<String, List<String>> params) =>
                      value),
          transitionType: TransitionType.inFromRight);
    });
  }
}

class _NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "页面不存在",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

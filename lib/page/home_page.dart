import 'package:flutter/material.dart';
import 'package:test_flutter1/routes/routers.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(
            top: 30.0,
          ),
          child: Wrap(
            spacing: 8.0, // 主轴(水平)方向间距
            runSpacing: 4.0, // 纵轴（垂直）方向间距
            alignment: WrapAlignment.start, //沿主轴方向居中
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                  top: 10.0,
                ),
                child: RaisedButton(
                    textColor: Colors.black,
                    child: Text('测试消息队列'),
                    onPressed: () {
                      FRouter.router.navigateTo(context, FRouter.test_mq_page);
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                  top: 10.0,
                ),
                child: RaisedButton(
                    textColor: Colors.black,
                    child: Text('404'),
                    onPressed: () {
                      FRouter.router.navigateTo(context, '404');
                    }),
              ),
            ],
          )),
    );
  }
}

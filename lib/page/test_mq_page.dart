import 'dart:io';
import 'dart:isolate';

import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter1/util/com_util.dart';

class TestMqPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestMqState();
  }
}

class _TestMqState extends State<TestMqPage> {
  var constantList = <Widget>[];

  var _index = 0;

  @override
  void initState() {
    super.initState();

    Function funTick = () {
      setState(() {
        _index++;
      });
    };
    void mainLoop() {
      Future.delayed(Duration(seconds: 1), funTick).then((value) => mainLoop());
    }

    mainLoop();

    for (int i = 1; i < 1000; i++) {
      constantList.add(Padding(
        padding: EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
        child: RaisedButton(
            textColor: Colors.black, child: new Text('$i'), onPressed: () {}),
      ));
    }
  }

  String tickString() {
    var time = formatDate(DateTime.now(), [HH, ':', nn, ':', ss]);
    return '$_index   ${time}';
  }

  void mainSleepBlock() {
    CommonUtil.toast('Isolate is ${Isolate.current.debugName} start sleep');
    Future.delayed(Duration(seconds: 2), () {
      sleep(Duration(seconds: 3));
    }).then((value) {
      CommonUtil.toast(
          'Isolate is ${Isolate.current.debugName} then() stop sleep ');
    });
  }

  //compute调用的方法必须为库的顶层方法或者 static方法
  static String sleepWrap(String value) {
    var name = Isolate.current.debugName;
    debugPrint('$name: sleepWrap start');
    sleep(Duration(seconds: 5));
    debugPrint('$name: sleepWrap end');
    return 'complete:$value';
  }

  void mainSleepNonBlock() {
    var str = 'New Task';
    Future future = compute(sleepWrap, str);
    future.then((value) {
      var name = Isolate.current.debugName;
      debugPrint('$name: then $value');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView(
              children: constantList,
            ),
            Positioned(
              child: Container(
                width: 200,
                height: 40,
                alignment: Alignment.center,
                child: Text(tickString(), style: TextStyle(color: Colors.red)),
                color: Colors.transparent,
              ),
            ),
            Positioned(
              bottom: 18.0,
              right: 10,
              child: RaisedButton(
                  textColor: Colors.black,
                  child: new Text('阻塞Future'),
                  onPressed: () {
                    mainSleepBlock();
                  }),
            ),
            Positioned(
              bottom: 68.0,
              right: 10,
              child: RaisedButton(
                  textColor: Colors.black,
                  child: new Text('非阻塞Isolate'),
                  onPressed: () {
                    mainSleepNonBlock();
                  }),
            )
          ],
        ),
      ),
    );
  }
}

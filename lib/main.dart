import 'package:flutter/material.dart';
import 'package:flutter_start/wallet/wallet.dart';
import 'package:flutter_start/mine/mine.dart';
import 'package:flutter_start/earnings/earnings.dart';
import 'package:flutter_start/device/device.dart';

void main() => runApp(MainAPP());

class MainAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MainAcivity",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  ///初始化的选择按钮
  int _select = 0;
  var _itemIcons;
  var _itemTexts;

  var _widgets;
  ///获取底部按钮的文字
  _getTitle(num) {
    return new Text(_itemTexts[num],
        style: new TextStyle(color: num == _select ? Colors.blue : Colors.grey)
    );
  }

  ///获取底部按钮的ICON
  _getIcons(num) {
    if (num == _select) {
      return _itemIcons[num][0];
    } else {
      return _itemIcons[num][1];
    }
  }

  ///点击按钮(点击当前未选中的按钮才会调用)
  _changeSelect(index) {
    if (_select != index) {
      setState(() {
        _select = index;
      });
    }
  }

  _getImg(String url) {
    return Image.asset(
      url,
      width: 24,
      height: 24,
    );
  }

  ///初始化数据
  @override
  void initState() {
    super.initState();
    _widgets = [
      new EarningsWidget(),
      new WalletWidget(),
      new DeviceWidget(),
      new MineWidget()
    ];
    _itemIcons = [
      [
        _getImg("images/a_act.png"),
        _getImg("images/a_def.png"),
      ],
      [
        _getImg("images/b_act.png"),
        _getImg("images/b_def.png"),
      ],
      [
        _getImg("images/c_act.png"),
        _getImg("images/c_def.png"),
      ],
      [
        _getImg("images/d_act.png"),
        _getImg("images/d_def.png"),
      ],
    ];

    _itemTexts = ["收益", "钱包", "设备", "我的"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text(_itemTexts[_select]),
        ),
        body: _widgets[_select],
        bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: _getIcons(0), title: _getTitle(0)),
            new BottomNavigationBarItem(
                icon: _getIcons(1), title: _getTitle(1)),
            new BottomNavigationBarItem(
                icon: _getIcons(2), title: _getTitle(2)),
            new BottomNavigationBarItem(
                icon: _getIcons(3), title: _getTitle(3)),
          ],//底部的item集合
          currentIndex: _select,//当前选中的items
          fixedColor: Colors.blue,//当前选中item的颜色 （已经在getIcons()和_getTitle()指定）
          type: BottomNavigationBarType.fixed,
          iconSize: 24,//icon大小，（建议在getIcons控制大小)
          onTap: (index) {//点击事件监听
            _changeSelect(index);
          },
        ));
  }
}

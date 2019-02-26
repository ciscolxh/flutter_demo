[TOC]

# flutter_start

   一边熟悉控件一边来完成一个flutter的项目。

# Scaffold
    Scaffold Widget 提供了基本的 Material Design 布局所以我们直接 return new Scaffold组件。
1. Key key,
2. this.appBar,
3. this.body,
4. this.floatingActionButton,
5. this.floatingActionButtonLocation,
6. this.floatingActionButtonAnimator,
7. this.persistentFooterButtons,
8. this.drawer,
9. this.endDrawer,
10. this.bottomNavigationBar,
11. this.bottomSheet,
12. this.backgroundColor,
13. this.resizeToAvoidBottomPadding = true,
14. this.primary = true,



## bottomNavigationBar（重要）
  1. items（底部按钮布局集合）
  2. onTap（点击事件监听）
  3. currentIndex（当前选中的按钮index）
  4. type（显示方式）
  5. fixedColor（选中颜色）
  6. iconSize （icon大小）

### type
    1. BottomNavigationBarType.shifting(选中才会显示item中title中的文字)

    2. BottomNavigationBarType.fixed（任何时候完全显示）
### 示例
```
class _MainWidgetState extends State<MainWidget> {
  ///初始化的选择按钮
  int _select = 0;

  var itemIcons;
  var itemTexts;

  ///获取底部按钮的文字
  _getTitle(num) {
    return new Text(itemTexts[num],
        style: new TextStyle(color: num == _select ? Colors.blue : Colors.grey)
    );
  }

  ///获取底部按钮的ICON
  _getIcons(num) {
    if (num == _select) {
      return itemIcons[num][0];
    } else {
      return itemIcons[num][1];
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

    itemIcons = [
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

    itemTexts = ["收益", "钱包", "设备", "我的"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text(itemTexts[_select]),
        ),
        body: new Center(
          child: new Text("$_select"),
        ),
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
```
# ColumAndRow
1. MainAxisAlignment mainAxisAlignment =  MainAxisAlignment.start,//位置
2. MainAxisSize mainAxisSize = MainAxisSize.max,//大小值
3. CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,//位置
4. TextDirection textDirection,
5. VerticalDirection verticalDirection = VerticalDirection.down,
6. TextBaseline textBaseline,
7. List<Widget> children = const <Widget>[],


## 示例

```
class MyColumn extends StatelessWidget {
  final MainAxisAlignment  alignment;
  final String title;
  MyColumn(this.alignment,this.title);
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.orange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,//在整体布局中的位置
        verticalDirection: VerticalDirection.up,//从上到下排列还是从下到上排列
        mainAxisAlignment: alignment,//(按每个字分成N等份，)(spaceBetween字等分显示) (spaceEvenly上下留白等分)
        mainAxisSize: MainAxisSize.max,//占最小位置还是占最大位置
        textBaseline: TextBaseline.ideographic,
        textDirection: TextDirection.ltr,
        children: <Widget>[
          new Text(title),
          new Text("你"),
          new Text("好"),
          new Text("啊")
        ],
      ),
    );
  }
}
```

## 搭配Expanded 控件按比例分开
```
class MyRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Expanded(child: MyColumn(MainAxisAlignment.center,"flex: 2",Colors.red[300]),flex: 2,),
          new Expanded(child: MyColumn(MainAxisAlignment.center,"flex: 3",Colors.green[300]),flex: 3,),
          new Expanded(child: MyColumn(MainAxisAlignment.center,"flex: 1",Colors.blue[300]),flex: 1,),
        ],
      ),
    );
  }
}

```
# Container
    直接翻译为容器，在flutter中万物都是Widget，包括填充，背景色，装饰器，这个控件通常用来添加内衬，外衬等
1. this.alignment,（内部组件的对齐方式）
2. this.padding,(内填充)
3. Color color,（背景颜色）
4. Decoration decoration,（背景装饰，和Color只有一个可以存在）
5. this.foregroundDecoration,（前景装饰）
6. double width,（宽度）
7. double height,（高度）
8. BoxConstraints constraints,(布局宽高约束)
9. this.margin,（外边距）
10. this.transform,（Matrix4变换）
11. this.child,（子控件）

# 示例

```
    new Container(
        //宽度
        width: 300,
        //高度
        height: 300,
        color: Colors.lime,
        //子控件
        child: new Icon(
          Icons.ac_unit,
          color: Colors.orange,
        ),
        //内边距
        padding: EdgeInsets.all(10),
        //外边距
        margin: EdgeInsets.all(10.0),
        //对齐方式
        alignment: Alignment.topCenter,
        // 变换
        transform: new Matrix4.rotationZ(120),
        //透明黑色遮罩
        decoration: new BoxDecoration(

              ///弧度为4.0
              borderRadius: BorderRadius.all(Radius.circular(30.0)),

              ///设置了decoration的color，就不能设置Container的color。
              color: Colors.blue[300],

              ///边框
              border: new Border.all(color: Color(0x99666666), width: 2)),
        // 限制宽高
        constraints: BoxConstraints.expand(height: 300, width: 200),

      ),
```
# Text
    1. Key key,
    2. this.style, 调整样式
    3. this.textAlign, 字体位置
    4. this.textDirection, 文本对齐方式 （效果待调研）
    5. this.locale, 本地文本选择（使用规则待查验）
    6. this.softWrap, 是否换行
    7. this.overflow,溢出效果处理方式
    8. this.textScaleFactor,(文本放大倍数)
    9. this.maxLines,最多显示几行
    10.this.semanticsLabel,文本描述（待验证效果）

## style ——> TextStyle
    文字的样式，属性有下面这些。
    1. this.inherit = true,
    2. this.color, 文字颜色
    3. this.fontSize, 字体大小
    4. this.fontWeight, 文字权重(设置粗体)
    5. this.fontStyle,（设置斜体）
    6. this.letterSpacing,（字符的间距）
    7. this.wordSpacing, （单词间的间距）
    8. this.textBaseline,(设置文本的对齐基线)
    9. this.height,（TextView高度=height * height）
    10. this.locale,(语言选择)
    11. this.foreground,（前景色）
    12. this.background,（背景色）
    13. this.shadows,（）
    14. this.decoration,（下划线）
    15. this.decorationColor,（下划颜色）
    16. this.decorationStyle,（下划线样式）

### inherit ——>bool

### color ——> int

### fontSize ——> int

### fontWeight——> FontWeight
    1. FontWeight.bold //(粗体)
    2. FontWeight.normal //(正常)
### fontStyle——> FontStyle.normal
    1. FontStyle.normal//(正常)
    2. FontStyle.italic,//（斜体）


## 示例

```
class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      "abcdefg",
      textAlign: TextAlign.left,
      //文本对齐方式
      textDirection: TextDirection.rtl,
      locale: null,
      //本地化语言选择
      softWrap: true,
      //是否换行
      overflow: TextOverflow.ellipsis,
      //显示多余的选择方式
      maxLines: 5,
      //最多行号
      semanticsLabel: "这是一个语义标签",
      textScaleFactor: 2,
      style: new TextStyle(
          inherit: true,
          //是否使用TextStyle的属性
          fontSize: 30,
          fontStyle: FontStyle.normal,
          //斜体
          fontWeight: FontWeight.bold,
          //粗体
          fontFamily: null,
          letterSpacing: 0,
          //字符间距
          wordSpacing: 0,
          //单词间距
          height: 10,
          // TextView高度 = 文字的高度 * height
          textBaseline: TextBaseline.alphabetic,
          //基线对齐方式
          foreground: null,
          //前景色
          background: null,
          //背景色
          shadows: null,
          //文字阴影
          color: Color(0xffff0000).withOpacity(0.5),
          //文字的颜色，以及宽度
          decorationColor: Color(0xff00ff00),
          //线条的颜色
          decorationStyle: TextDecorationStyle.wavy,
          //线的样式，实线、两条线，点线，短线条间隔、波浪线
          decoration: TextDecoration.underline), //在线的上中下的位置
    );
  }
}

```



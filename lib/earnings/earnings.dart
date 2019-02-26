import 'package:flutter/material.dart';

class EarningsWidget extends StatefulWidget {
  @override
  _EarningsWidgetState createState() => _EarningsWidgetState();
}

class _EarningsWidgetState extends State<EarningsWidget> {

  ///获取ListViewItem的布局
  _getItemWidget(){
    return new Container(
      alignment: Alignment.topCenter,
      height: 85,
      margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.fromLTRB(2.5, 1.5, 2.5, 1.5),
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  border: new Border.all(
                    color: Color(0xFF919BA9),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(new Radius.circular(5)),
                ),
                child: new Text("挖矿收益",style: new TextStyle(color: Color(0xFF919BA9)),),
              ),
              new Text("2018-11-14",style: new TextStyle(color:Color(0xFF919BA9),fontSize: 14)),
            ],
          ),
          new Text("+1230.1236",style: new TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)
        ],
      ),
    );
  }

  ///获取头部的布局
  _getHeadWidget(){
    return new Container(
      alignment: Alignment.topLeft,
      height: 160,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(new Radius.circular(10)),
        color: Colors.blue,
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Expanded(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                        child: new Text("今日收益(ETH)",style: new TextStyle(color: Colors.white , fontSize:15),)
                      ),
                      new Container(
                        margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
                        child: new Text("12345.123",style: new TextStyle(color: Colors.white,fontSize: 32 ,fontWeight: FontWeight.bold),),
                      )
                    ],
                ),
                Image.asset("images/a_def.png",width:100,height:100,fit: BoxFit.fill,),
              ],
            ),
            flex: 3,
          ),
          new Container(
            height: 0.5,
            color: Colors.white,
          ),
          new Expanded(child: new Container(
            alignment: Alignment.bottomLeft,
            child: new Text("累计总收益：23479.2434 ETH",style: new TextStyle(color:Colors.white,fontSize: 15),),
          ),flex: 1,)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        _getHeadWidget(),
        _getItemWidget()
      ],
    );
  }
}



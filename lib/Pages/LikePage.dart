import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LikePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LikePageState();
  }
}

class LikePageState extends State<LikePage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    TabController myTabController = TabController(length: 2, vsync: this);

    var myAppBar = new Container(
      margin: EdgeInsets.only(top: 30),
      child: new TabBar(
        tabs: [
          new Tab(
            child: new Text(
              'Following',
              style: TextStyle(color: Colors.black),
            ),
          ),
          new Tab(
            child: new Text(
              'You',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
        controller: myTabController,
        indicatorColor: Colors.black,
      ),
    );

    // TODO: implement build
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.square(50),
        child: myAppBar,
      ),
      body: new TabBarView(
        children: [
          new FollowingPage(),
          new YourPage(),
        ],
        controller: myTabController,
      ),
    );
  }
}

class YourPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: myBody(),
    );
  }

  myBody() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
          itemCount: 19,
          itemBuilder: (BuildContext context , int index){
            return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Image.asset("assets/images/user.png",height: 50,),
                  new Text('You started following Friend${index}'),
                  new OutlineButton(onPressed: (){

                  },
                    child: new Text('Following'),

                  )
                ],
              ),
            );
          }
      ),
    );
  }
}

class FollowingPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: myBody(),
    );
  }

  myBody() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: ListView.builder(
          itemCount: 19,
          itemBuilder: (BuildContext context , int index){
            return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Image.asset(index == 0
                      ? "assets/images/user.png"
                      : "assets/images/pic${index}.png",height: 50,),
                  new Text('Friend${index} liked your photo'),
                  new Image.asset("assets/images/p7.jpg",height: 50),
                ],
              ),
            );
          }
      ),
    );
  }


}

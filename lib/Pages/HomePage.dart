import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  File _image;

  Future getImageFromCamera() async {
    print('here');
    print(_image);

    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    print(image);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _appBar(context),
      body: _body(),
    );
  }

  _appBar(context) {
    return new AppBar(
      backgroundColor: Colors.white,
      elevation: 0.4,
      bottom: PreferredSize(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.photo_camera),
                iconSize: 30,
                onPressed: getImageFromCamera,
              ),
              _image == null ? Text('no image') : Image.file(_image),
              Text(
                'Instagram',
                style: TextStyle(
                    fontSize: 30, fontFamily: 'Billabong', color: Colors.black),
              ),
              IconButton(
                  icon: Icon(Icons.near_me),
                  iconSize: 30,
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          ),
          preferredSize: null),
    );
  }

  _body() {
    return new Container(
      child: new Column(
        children: <Widget>[myListView()],
      ),
    );
  }

  myListView() {
    return Container(
      child: Expanded(
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: (index == 0)
                    ? story()
                    : Container(
                        height: 500,
                        child: new Column(
                          children: <Widget>[
                            titlePost(index),
                            postImage(index),
                            bottomNavPost(),
                            bottomNavPostData(),
                          ],
                        ),
                      ),
              );
            }),
      ),
    );
  }

  story() {
    return Container(
      height: 100,
      child: Column(
        children: <Widget>[
          new Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 19,
                  itemBuilder: (BuildContext context, int index) {
                    return new Container(
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          new Container(
                            child: new Image.asset(
                              index == 0
                                  ? "assets/images/user.png"
                                  : "assets/images/pic${index}.png",
                            ),
                            height: 60,
                          ),
                          new Text(
                              index == 0 ? "Your Story" : "Friend ${index}")
                        ],
                      ),
                    );
                  })),
          new Container(
            height: 0.5,
            color: Colors.grey[400],
          )
        ],
      ),
    );
  }

  titlePost(index) {
    return Container(
      margin: EdgeInsets.all(10),
      child: new Row(
        children: <Widget>[
          new Image.asset(
            'assets/images/pic${index}.png',
            height: 40,
          ),
          new Padding(
              padding: EdgeInsets.all(10), child: new Text('Friend${index}')),
          new Spacer(),
          new Icon(
            Icons.more_vert,
          )
        ],
      ),
    );
  }

  postImage(index) {
    return new Container(
      child: new Image.asset(
        "assets/images/p${index}.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  bottomNavPost() {
    return Container(
      margin: EdgeInsets.all(10),
      child: new Row(
        children: <Widget>[
          new Icon(
            Icons.favorite_border,
            size: 30,
          ),
          new Padding(padding: EdgeInsets.only(left: 10)),
          new Icon(
            Icons.chat_bubble_outline,
            size: 30,
          ),
          new Padding(padding: EdgeInsets.only(left: 10)),
          new Icon(
            Icons.near_me,
            size: 30,
          ),
          new Spacer(),
          new Icon(
            Icons.bookmark_border,
            size: 30,
          )
        ],
      ),
    );
  }

  bottomNavPostData() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(left: 10, top: 5),
            alignment: Alignment.centerLeft,
            child: new Text(
              '59 Likes',
              style: TextStyle(color: Colors.black),
            ),
          ),
          new Container(
            margin: EdgeInsets.only(left: 10, top: 5),
            alignment: Alignment.centerLeft,
            child: new Text(
              '15 March',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}


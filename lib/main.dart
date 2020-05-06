import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/HomePage.dart';
import 'package:flutter_app/Pages/LoginPage.dart';
import 'InstaScreens/HomeScreen.dart';
import 'dart:async';


void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      home: new Directionality(
          textDirection: TextDirection.ltr,
          child: SplashScreen()
      ),
      routes: <String,WidgetBuilder>{
        '/HomeScreen':(BuildContext context){
          return HomePage();
        }
      },
    );
  }
}


class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashScreenState();
  }

}

class SplashScreenState extends State<SplashScreen> {


  Future<Timer> SplashLoading() async{
    return new Timer(Duration(seconds: 5), LoadWelcome);
  }

  LoadWelcome() async{
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashLoading();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        color: Colors.white,
        alignment: Alignment.center,
        child:Image.asset('assets/images/instaSplash.jpg',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width) ,

      ),
    );
  }
}



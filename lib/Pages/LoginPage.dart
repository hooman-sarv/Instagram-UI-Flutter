import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  var inputTextStyleBlack = new TextStyle(fontSize: 12, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: myBody(),
    );
  }

  Widget myBody() {
    return Container(
      padding: EdgeInsets.all(35),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            padding: EdgeInsets.only(top: 25, bottom: 15 ),
            child: new Text(
              'Instagram',
              style: TextStyle(fontFamily: 'Billabong', fontSize: 50),
            ),
          ),
          InputUsername(),
          InputPassword(),
          LoginContainer(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Forgotten your login details? ',
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
              new FlatButton(
                padding: EdgeInsets.only(left: 0),
                  onPressed: () {},
                  child: new Text(
                    'Get help with signing in. ',
                    style: TextStyle(fontSize: 11, color: Colors.grey,fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                color: Colors.grey,
                height: 1,
                width: MediaQuery.of(context).size.width/3.2,
              ),
              new Text(' OR ' , style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueGrey),),
              new Container(
                color: Colors.grey,
                height: 1,
                width: MediaQuery.of(context).size.width/3.2,
              )
            ],
          ),
          faceBookLogin(),
        ],
      ),
    );
  }

  Widget InputUsername() {
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: new TextField(
        controller: usernameController,
        style: inputTextStyleBlack,
        decoration: new InputDecoration(
            hintText: 'Phone number or Email or Username',
            isDense: true,
            border: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.black))),
      ),
    );
  }

  Widget InputPassword() {
    return new Container(
      margin: EdgeInsets.only(top: 10,right:10 ,left:10 ),
      child: new TextField(
        controller: passwordController,
        style: inputTextStyleBlack,
        decoration: new InputDecoration(
            hintText: 'Password',
            isDense: true,
            border: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.black))),
      ),
    );
  }

  Widget LoginContainer() {
    return GestureDetector(
      onTap: login,
      child: new Container(
        margin: EdgeInsets.only(top: 10,right:10 ,left:10 ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.blueAccent, borderRadius: BorderRadius.circular(5)),
        width: 500,
        height: 40,
        child: new Text(
          'Log In',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget faceBookLogin() {
    return GestureDetector(
      onTap: () {
        print('username is ${usernameController.text}');
        print('Password is ${passwordController.text}');
      },
      child: new Container(
        margin: EdgeInsets.only(top: 10,right:10 ,left:10 ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.blueAccent, borderRadius: BorderRadius.circular(5)),
        width: 500,
        height: 40,
        child: new Text(
          'Log In With FaceBook',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void login() {
//    if(usernameController.text.isEmpty) {
//        showAlert('username');
//      } else if(passwordController.text.isEmpty) {
//        showAlert('password');
//      } else{
          if(true){ /*usernameController.text == 'hooman_sarv' && passwordController.text =='123'*/
            Navigator.of(context).pushNamed('/HomeScreen');
          }
          else{
            showAlert('username and Password');
          }
      }
   // }

  void showAlert(String s) {
    showDialog(
        builder: (BuildContext context){
            return new CupertinoAlertDialog(
                content: new Text('Please Enter your ${s} Correctly'),
                actions: <Widget>[
                  FlatButton(onPressed: (){
                    Navigator.of(context).pop();
                  } , child: Text('OK'),)
                ],
              );
        },
        context: context);
  }

}


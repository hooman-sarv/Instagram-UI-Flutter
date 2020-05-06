import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/AccountPage.dart';
import 'package:flutter_app/Pages/AddPage.dart';
import 'package:flutter_app/Pages/HomePage.dart';
import 'package:flutter_app/Pages/LikePage.dart';
import 'package:flutter_app/Pages/SearchPage.dart';

class homeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeScreenState();
  }
}

class homeScreenState extends State<homeScreen> {

  int currentTab = 0;
  var currentPage;
  List pages;

  @override

  void initState(){
    super.initState();
    currentPage = HomePage();
    pages = [
      HomePage(),
      SearchPage(),
      AddPage(),
      LikePage(),
      AccountPage()
    ];
  }
  Widget build(BuildContext context) {
    // TODO: implement build


    var bottomItems = BottomNavigationBar(
        iconSize: 30,
        currentIndex: currentTab,
        type: BottomNavigationBarType.fixed,
        onTap: (int index){
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: new Text('',style: TextStyle(fontSize: 0),),
              activeIcon: Icon(
                Icons.home,
                color: Colors.black,
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              title: new Text('',style: TextStyle(fontSize: 0),),
              activeIcon: Icon(
                Icons.search,
                color: Colors.black,
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
                color: Colors.grey,
              ),
              title: new Text('',style: TextStyle(fontSize: 0),),
              activeIcon: Icon(
                Icons.add_box,
                color: Colors.black,
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.grey,
              ),
              title: new Text('',style: TextStyle(fontSize: 0),),
              activeIcon: Icon(
                Icons.favorite,
                color: Colors.black,
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.grey,
              ),
              title: new Text('',style: TextStyle(fontSize: 0),),
              activeIcon: Icon(
                Icons.account_circle,
                color: Colors.black,
              )
          ),
        ]);

    return new Scaffold(
      bottomNavigationBar: bottomItems,
      body: currentPage,
    );
  }

}

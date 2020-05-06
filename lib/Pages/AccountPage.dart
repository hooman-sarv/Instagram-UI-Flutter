import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: new Column(
        children: <Widget>[
          appBar(),
          profile(),
          highLight(),
          centerButtons(),
          displayImages()

        ],
      ),
    );
  }

  appBar() {
    return new Container(
        padding: EdgeInsets.only(top: 25),
        color: Colors.white,
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(left: 10),
                  child: new Text(
                    'hooman_sarv',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                new Spacer(),
                new IconButton(
                    icon: Icon(Icons.update), iconSize: 25, onPressed: () {}),
                new IconButton(
                    icon: Icon(Icons.person_add),
                    iconSize: 25,
                    onPressed: () {}),
                new IconButton(
                    icon: Icon(Icons.format_list_bulleted),
                    iconSize: 25,
                    onPressed: () {}),
              ],
            ),
            new Container(
              margin: EdgeInsets.only(top: 2),
              height: 1,
              color: Colors.grey[400],
            )
          ],
        ));
  }

  profile() {
    return new Container(
      child: Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Container(
                    child: new Image.asset(
                      "assets/images/user.png",
                      height: 100,
                    ),
                    margin: EdgeInsets.only(top: 15),
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: 10, left: 10),
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      children: <Widget>[
                        new Text(
                          'Hooman Sarvghadi',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        new Text('Study CE @ Isfahan'),
                        new Text('Playing Tar & SeTar'),

                      ],
                    ),
                  )
                ],
              ),
              new Container(
                  child: new Column(
                children: <Widget>[
                  new Container(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.all(5),
                          child: new GestureDetector(
                            child: new Column(
                              children: <Widget>[
                                new Text(
                                  '75',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                new Container(
                                  child: new Text(
                                    'Posts',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        new Container(
                          margin: EdgeInsets.all(5),
                          child: new GestureDetector(
                            child: new Column(
                              children: <Widget>[
                                new Text(
                                  '439',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                new Container(
                                  child: new Text(
                                    'Followers',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        new Container(
                          margin: EdgeInsets.all(5),
                          child: new GestureDetector(
                            child: new Column(
                              children: <Widget>[
                                new Text(
                                  '548',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                new Container(
                                  child: new Text(
                                    'Following',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  new GestureDetector(
                    onTap: (){
                    },
                    child: new Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      margin: EdgeInsets.only(top: 10),
                      height: 30,
                      width: 200,
                      child: new Text('Edit Profile'),
                    ),
                  )
                ],
              )),
            ],
          )
        ],
      ),
    );
  }

  highLight() {
    return Container(
      height: 100,
      child: Column(
        children: <Widget>[
          new Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return new Container(
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          new Container(
                            height: 60,
                            child: CircleAvatar(
                              maxRadius: 30,
                              backgroundImage: ExactAssetImage(index == 0
                                  ? "assets/images/plus.png"
                                  : "assets/images/place${index}.jpg"),
                            ),

                          ),
                          new Text(
                              index == 0 ? "New" : "Place ${index}")
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

  centerButtons() {
    return Container(
      child: Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(icon: Icon(Icons.grid_on),iconSize: 30 ,onPressed: (){}),
              IconButton(icon: Icon(Icons.perm_contact_calendar),iconSize: 30 ,onPressed: (){})
            ],
          ),
          new Container(
            height: 0.5,
            color: Colors.grey[400],
          )
        ],
      ),
    );
  }

  displayImages() {
    return new Expanded(
      child: Container(
        child: GridView.builder(
            itemCount: 5,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context , int index){
              return Container(
                color: Colors.grey,
                margin: EdgeInsets.all(1),
                child: new Image.asset(index == 0
                    ?"assets/images/place4.jpg"
                    :"assets/images/place${index}.jpg",fit: BoxFit.cover,)
              );
            }
        ),
      ),
    );
  }

}

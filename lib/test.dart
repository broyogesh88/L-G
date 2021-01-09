import 'package:flutter/material.dart';
import 'package:flutter_google_sign_in_demo/fragments/first_fragment.dart';
import 'package:flutter_google_sign_in_demo/fragments/second_fragment.dart';
import 'package:flutter_google_sign_in_demo/fragments/signout.dart';
import 'package:flutter_google_sign_in_demo/fragments/third_fragment.dart';
import 'package:flutter_google_sign_in_demo/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'fragments/events.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

final GoogleSignIn _googleSignIn = GoogleSignIn();

class Test extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("Profile", Icons.account_circle),
    new DrawerItem("Courses", Icons.library_books),
    new DrawerItem("Events", Icons.event),
    new DrawerItem("Logout", Icons.logout)
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<Test> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void signOutGoogle() async {
    await _googleSignIn.signOut();
    print("User Sign Out");
  }

  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new FirstFragment();
      case 1:
        return new SecondFragment();
      case 2:
        return new ThirdFragment();
      case 3:
        return new Events();
      case 4:
        signOutGoogle();
        return Signout();
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("John Doe"), accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}

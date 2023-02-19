import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class My_Drawer extends StatelessWidget {
  final imageurl =
      "https://i.pinimg.com/564x/2a/d3/7b/2ad37b8d378cb18f4d4161dbd1e0b87e.jpg";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.deepPurpleAccent,
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 74, 55, 177)),
              //arrowColor: Colors.black54,
              accountName: Text(
                "Mughal Badsha",
                style: TextStyle(fontSize: 20),
              ),
              accountEmail: Text("mughalg6567@gmail.com"),
              currentAccountPicture:
                  CircleAvatar(backgroundImage: NetworkImage(imageurl)),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.house_alt_fill,
              color: Colors.white,
            ),
            title: Text(
              "Home",
              textScaleFactor: 1.3,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
            ),
            title: Text(
              "Profile",
              textScaleFactor: 1.3,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.phone_circle_fill,
              color: Colors.white,
            ),
            title: Text(
              "Phone",
              textScaleFactor: 1.3,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail_solid,
              color: Colors.white,
            ),
            title: Text(
              "Email",
              textScaleFactor: 1.3,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

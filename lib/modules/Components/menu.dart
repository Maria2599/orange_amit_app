import 'package:flutter/material.dart';
import 'package:graduation_project/login.dart';
import 'package:graduation_project/layout/home.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: [
          ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "Home",
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(215, 0, 0, 255)),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              }),
          ListTile(
              leading: Icon(Icons.outbond),
              title: Text(
                "Logout",
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(215, 0, 0, 255)),
              ),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              leading: Icon(Icons.account_balance_wallet_outlined),
              title: Text(
                "Cash",
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(215, 0, 0, 255)),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              }),
          ListTile(
              leading: Icon(Icons.wallet_giftcard),
              title: Text(
                "Bonus",
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(215, 0, 0, 255)),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              }),
        ]),
      ),
    );
  }
}

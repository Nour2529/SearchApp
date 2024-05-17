import 'package:flutter/material.dart';
import 'package:miniprojet/config/global.params.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF3b5998),
                ),
                child: Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/profil.jpg"),
                    radius: 80,
                  ),
                )),
            ...(GlobalParams.menus as List).map((item) {
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '${item['title']}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    leading: item['icon'],
                    trailing: Icon(
                      Icons.arrow_right,
                      color: Color(0xFF3b5998),
                    ),
                    onTap: () async {
                      if ('${item['title']}' != "Déconnexion") {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, "${item['route']}");
                      } else {
                        prefs = await SharedPreferences.getInstance();
                        prefs.setBool("connecte", false);
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/authentification', (route) => false);
                      }
                    },
                  ),
                  Divider(
                    height: 4,
                    color: Colors.grey[300],
                  ),
                ],
              );
            })
          ],
        ));
  }
}

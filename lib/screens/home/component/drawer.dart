import 'package:flutter/material.dart';
import 'package:food_application/constant.dart';
import 'package:food_application/drawerScreen/logIn.dart';
import 'package:food_application/screens/services/auth.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: Consumer<Auth>(
      builder: (context, auth, child) {
        if (!auth.authticated) {
          return ListView(
            children: [
              ListTile(
                leading: Icon(Icons.login),
                title: Text("LogIn"),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              )
            ],
          );
        } else {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  "Mansouri Dhya Eddine",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  "M.dhiaaeddine@gmail.com",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      "https://scontent-mad1-1.xx.fbcdn.net/v/t1.15752-9/176514861_470567100923517_4151157434102950874_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=ae9488&_nc_eui2=AeE0lJH_NiqiEc_hm7_StP2GuOVxlYMEemq45XGVgwR6amGOqLzNjtq7xpFMjGsoH5c9i_hEf8OU1LrdhwwvdGOR&_nc_ohc=GUaFCO0t1pwAX-d82Gm&_nc_ht=scontent-mad1-1.xx&oh=81ad7d353d65df630cd2182f4efb4815&oe=60A4DC15",
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // child: DecoratedBox(
                //       decoration: BoxDecoration(
                //         gradient: LinearGradient(
                //           colors: [
                //             Color(0xFFFF961F).withOpacity(0.7),
                //             kPrimaryColor.withOpacity(0.7)
                //           ]
                //         )
                //       ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/foodhealthyCover.png"),
                    fit: BoxFit.cover,
                  ),
                  gradient: LinearGradient(colors: [
                    Color(0xFFFF961F).withOpacity(0.2),
                    kPrimaryColor.withOpacity(0.7)
                  ]),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text("Favorite"),
                onTap: () => null,
              ),
              ListTile(
                leading: Icon(Icons.save_alt_rounded),
                title: Text("My Orders"),
                onTap: () => null,
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text("Request"),
                onTap: () => null,
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () => null,
              ),
              ListTile(
                leading: Icon(Icons.description),
                title: Text("Policies"),
                onTap: () => null,
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Log out"),
                onTap: () {
                  Provider.of<Auth>(context, listen: false).logout();
                },
              ),
            ],
          );
        }
      },
    ));
  }
}

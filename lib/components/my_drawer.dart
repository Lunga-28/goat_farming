import 'package:flutter/material.dart';
import 'package:goat_farm_manager/auth/auth_services.dart';
import 'package:goat_farm_manager/home.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DrawerHeader(
            child: Image.asset('assets/images/logo.jpg', width: 60, height: 60),
          ),
          //home
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              title: const Text('H O M E'),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
          ),
          //settings
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              title: const Text('S E T T I N G S'),
              leading: const Icon(Icons.settings),
              onTap: () {},
            ),
          ),
          //logout
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 25),
            child: ListTile(
              title: Text("L O G O U T"),
              leading: Icon(Icons.logout),
              onTap: () {
                final _auth = AuthService();
                _auth.signOut();
              },
            ),
          )
        ],
      ),
    );
  }
}

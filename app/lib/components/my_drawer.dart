import 'package:app/pages/started_page.dart';
import 'package:flutter/material.dart';
import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget{
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //logo
          DrawerHeader(
              child: Center(
                child: Align(
                    alignment: Alignment.topCenter,
                    child:Image.asset('assets/images/logo.png',height: 80,)
                ),
              ),
          ),

          //home title
          Padding(
              padding:const EdgeInsets.only(left: 25.0,top: 25),
              child: ListTile(
                title: const Text("H O M E"),
                leading: const Icon(Icons.home),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const GetStartedPage()
                    )
                ),
              ),
          ),

          //settings title
          Padding(
            padding:const EdgeInsets.only(left: 25.0,top: 0),
            child: ListTile(
              title: const Text("CAI DAT"),
              leading: const Icon(Icons.settings),
              onTap: () {
                //pop drawer
                Navigator.pop(context);

                //navigate to setting page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder:(context) => SettingsPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
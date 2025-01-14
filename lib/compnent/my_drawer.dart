import 'package:chat_with_firebase/screen/edit_profile.dart';
import 'package:chat_with_firebase/services/auth/auth_services.dart';
import 'package:chat_with_firebase/screen/setting_page.dart';
import 'package:flutter/material.dart';

class MyDrawerWidget extends StatelessWidget {
  const MyDrawerWidget({super.key});

  void logout() {
    final _auth = AuthService();
    _auth.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.message,
                  size: 65,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text("E D I T   P R O F I L E"),
                  leading: Icon(
                    Icons.edit,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return EditProfilePage();
                    }));
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text("H O M E"),
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text("S E T T I N G S"),
                  leading: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SettingPage();
                    }));
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
                title: Text("L O G O U T"),
                leading: Icon(
                  Icons.exit_to_app,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onTap: logout),
          ),
        ],
      ),
    );
  }
}

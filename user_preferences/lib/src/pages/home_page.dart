import 'package:flutter/material.dart';
import 'package:user_preferences/src/pages/settings_page.dart';
import 'package:user_preferences/src/pages/share_prefs/user_preferences.dart';
import 'package:user_preferences/src/pages/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new UserPreferences();
  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text('User Preferences'),
        backgroundColor: (prefs.secondColor) ? Colors.red : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Second Color: ${prefs.secondColor}'),
          Divider(),
          Text('Gender: ${prefs.gender}'),
          Divider(),
          Text('Username ${prefs.userName}'),
          Divider(),
        ],
      ),
    );
  }
}
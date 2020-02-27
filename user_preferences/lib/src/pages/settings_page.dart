import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_preferences/src/pages/share_prefs/user_preferences.dart';
import 'package:user_preferences/src/pages/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondColor;
  int _gender;
  String _name = 'Peter';

  TextEditingController _textController;
  final prefs = new UserPreferences();


  @override
  void initState() {
    super.initState();

    initPreferences();

    prefs.lastPage = SettingsPage.routeName;


    _gender = prefs.gender;
    _secondColor = prefs.secondColor;

    _textController = new TextEditingController(text: prefs.userName);
  }

  initPreferences() async {
    await prefs.initPrefs();
  }


  _setSelectedRadio(int value) {
    prefs.gender = value;
    _gender = value;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: (prefs.secondColor) ? Colors.red : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Settings',
              style: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _secondColor,
            title: Text('Second Color:'),

            onChanged: (value){
              setState(() {

                _secondColor = value;
                prefs.secondColor = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Man'),
            groupValue: _gender,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
              value: 2,
              title: Text("Woman"),
              groupValue: _gender,
              onChanged: _setSelectedRadio,
          ),
          Divider(),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Name',
                helperText: 'Name of the person who use the phone',
              ),
              onChanged: (value){
                prefs.userName = value;
              },
            ),
          )
        ],
      ),
    );
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{

  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences(){
    return _instance;
  }
  //singleton es para instanciar la misma instancia siempre la cual esta referenciada en el factory

  UserPreferences._internal();
  SharedPreferences _prefs;

  initPrefs()async{
    this._prefs = await SharedPreferences.getInstance();
  }
//  GET y SET GENDER
  get gender {
    return _prefs.getInt('gender') ?? 1;
  }
  
  set gender(int value){
    _prefs.setInt('gender', value);
  }

  //  GET y SET SECOND COLOR
  get secondColor {
    return _prefs.getBool('secondColor') ?? false;

  }

  set secondColor(bool value){
    _prefs.setBool('secondColor', value);
  }

  // GET Y SET Username

  get userName {
    return _prefs.getString('userName') ?? '';
  }

  set userName(String value){
    _prefs.setString('userName', value);
  }

  //set y get ultima página

  get lastPage {
    return _prefs.getString('lastPage') ?? 'home';
  }

  set lastPage(String value){
    _prefs.setString('lastPage', value);
  }











//  Ninguna de estas propiedades se usa

  //
  //  bool  _secondColor;
  //  int _gender;
  //  String _name;
}
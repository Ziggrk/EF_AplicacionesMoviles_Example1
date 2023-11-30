import 'package:shared_preferences/shared_preferences.dart';
class Preferences{
  SharedPreferences? preference;
  bool flexeando = false;
  
  Future<SharedPreferences?> get preferences async{
    if(preference==null){
      preference = await SharedPreferences .getInstance();
      flexeando = preference?.getBool("flexeando")??false;
    }
    return preference;
  }
  Future<Preferences> init() async{
    preference = await preferences;
    return this;
  }
  Future<void> updatePreference() async{
    await preference?.setBool("flexeando", flexeando);
  }
}
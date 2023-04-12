import 'package:shared_preferences/shared_preferences.dart';

setUserResponse(String signinResponse) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('signinResponse', signinResponse);
}

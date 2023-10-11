

import 'package:shared_preferences/shared_preferences.dart';

import '../../datasource/local/shared_preference_data.dart';
import '../../shared_preference/shared_preference_consts.dart';

class PreferenceRepository implements PrefDataSource{

  SharedPreferences  sharedPreferences;

  PreferenceRepository(this.sharedPreferences);

  @override
  String? getAuthToken() {
    return sharedPreferences.getString(SharedPreferenceConst.accessToken);
  }

  @override
  void storeAuthToken(String? accessToken) {
    sharedPreferences.setString(SharedPreferenceConst.accessToken, accessToken!);
  }

  @override
  int getEventId() {
    return sharedPreferences.getInt(SharedPreferenceConst.eventId) ?? 0;
  }

  @override
  void saveEventId(int id) {
    sharedPreferences.setInt(SharedPreferenceConst.eventId, id);
  }


}
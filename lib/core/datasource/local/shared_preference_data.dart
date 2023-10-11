abstract class   PrefDataSource {
  void storeAuthToken(String? accessToken);
  String? getAuthToken();

  void saveEventId(int id);
  int getEventId();


}
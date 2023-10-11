



import '../../ui/screens/auth_screen/data/login_response.dart';
import '../datasource/app_data_sources.dart';
import '../datasource/local/shared_preference_data.dart';
import '../datasource/remote/remote_datasource.dart';

class AppRepository implements AppDataSource {
  final PrefDataSource? _prefDataSource;
  final RemoteDatasource? _remoteDataSource;
  static AppRepository? _instance;

  AppRepository(this._prefDataSource, this._remoteDataSource);

  @override
  String? getAuthToken() {
    return _prefDataSource!.getAuthToken();
  }

  @override
  void storeAuthToken(String? accessToken) {
    return _prefDataSource!.storeAuthToken(accessToken);
  }

  @override
  Future<LoginResponse> loginToEvent(String userName, String password, int eventId) {
    return _remoteDataSource!.loginToEvent(userName, password, eventId);
  }

  @override
  int getEventId() {
  return _prefDataSource!.getEventId();
  }

  @override
  void saveEventId(int id) {
   return _prefDataSource!.saveEventId(id);
  }








}
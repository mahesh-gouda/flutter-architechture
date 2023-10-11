import 'package:dio/src/form_data.dart';
import 'package:styra_poc/core/datasource/remote/remote_datasource.dart';
import 'package:styra_poc/core/http_client/dio_client.dart';
import 'package:styra_poc/core/web_service/web_service.dart';
import 'package:styra_poc/ui/screens/auth_screen/data/login_response.dart';

class RemoteRepository implements RemoteDatasource{
  final RemoteDatasource _remoteDatasource;

  static RemoteRepository? _instance;

  static RemoteRepository? getInstance(DioClient _baseDioClient) {
    _instance ??= RemoteRepository._(WebService(dioClient: _baseDioClient));
    return _instance;
  }

  RemoteRepository._(this._remoteDatasource);

  @override
  Future<LoginResponse> loginToEvent(String userName, String password, int eventId) {
    return _remoteDatasource.loginToEvent(userName, password, eventId);
  }



}
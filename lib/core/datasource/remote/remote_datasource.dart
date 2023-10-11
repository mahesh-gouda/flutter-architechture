import 'package:dio/dio.dart';

import '../../../ui/screens/auth_screen/data/login_response.dart';

abstract class RemoteDatasource {



  Future<LoginResponse> loginToEvent(String userName, String password, int eventId);




}
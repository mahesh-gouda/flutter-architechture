import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';

import '../../ui/screens/auth_screen/data/login_response.dart';
import '../const/api_end_points.dart';
import '../datasource/remote/remote_datasource.dart';
import '../http_client/dio_client.dart';


class WebService implements RemoteDatasource {
  String baseUrl = ApiEndPoints.baseUrl;
  DioClient dioClient;

  final Options requireAuthToken =
  Options(headers: {"requireAuthToken": true});



  WebService({required this.dioClient});


  @override
  Future<LoginResponse> loginToEvent(String userName, String password, int eventId) async{
    try {
      final response = await dioClient.dioInstance!.post(
        "${dioClient.baseUrl}${ApiEndPoints.login}?username=$userName&password=$password&id=$eventId",);
      if (response.statusCode == 200) {
       return LoginResponse.fromJson(response.data);
      } else {
        return LoginResponse.withError("Something went wrong");
      }
    } catch (error) {
      print(error);
      return LoginResponse.withError(error is DioError
          ? dioClient.handleError(error)
          : "Something went wrong!");
    }
  }





  }





import 'package:equatable/equatable.dart';


class LoginResponse {
  String? message;
  String? authToken;
  bool? status;
  // PaginationData? page;

  LoginResponse({this.message , required this.authToken,  this.status});

  factory  LoginResponse.fromJson(Map<dynamic, dynamic> json) => LoginResponse(
    status: json["status"],
    authToken: json["token"],
  );


  LoginResponse.withError(String errorMessage) : message = errorMessage;

}


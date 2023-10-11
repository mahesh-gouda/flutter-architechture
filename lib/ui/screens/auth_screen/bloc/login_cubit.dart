import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/cupertino.dart';

import '../../../../core/datasource/app_data_sources.dart';
import '../../../../core/datasource/local/shared_preference_data.dart';
import '../../../../core/di/service_locator.dart';
import '../data/login_response.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AppDataSource remoteDataSource;
  LoginCubit(this.remoteDataSource) : super(LoginInitial());

  Future<void> loginToEvent(String userName, String password, int eventId) async {
    emit(LoggingIn());
    try {
      final LoginResponse response = await remoteDataSource.loginToEvent(userName, password, eventId);
      if (response != null ) {
        if (response.authToken != null) {
          serviceLocator<PrefDataSource>().storeAuthToken(response.authToken);
          serviceLocator<PrefDataSource>().saveEventId(eventId);
          emit(LoggedIn(response));
        } else {
          emit(LoginFailed(response.message ?? "Something went wrong!"));
        }
      } else {
        emit(LoginFailed("Something went wrong!"));
      }
    }catch(e){
      debugPrint(e.toString());
      emit(LoginFailed("Something Went Wrong"));
    }
  }
}

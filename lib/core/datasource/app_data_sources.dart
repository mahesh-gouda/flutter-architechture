

import 'package:styra_poc/core/datasource/remote/remote_datasource.dart';

import 'local/shared_preference_data.dart';

abstract class AppDataSource implements PrefDataSource, RemoteDatasource{}
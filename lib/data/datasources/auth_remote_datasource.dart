import 'package:baby_shop/common/constants/variabels.dart';
import 'package:baby_shop/data/models/requests/login_request_model.dart';
import 'package:baby_shop/data/models/requests/registes_request_model.dart';
import 'package:baby_shop/data/models/responses/auth_response_model.dart';
import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  //register Remote
  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel data) async {
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(
      Uri.parse('${Variabels.baseUrl}/api/auth/local/register'),
      body: data.toJson(),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }

  //login Remote

  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel data) async {
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(
      Uri.parse('${Variabels.baseUrl}/api/auth/local'),
      body: data.toJson(),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }

  
}

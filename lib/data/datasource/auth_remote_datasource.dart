import 'package:dartz/dartz.dart';
import 'package:flutter_template_tugas_besar/common/constants/variables.dart';
import 'package:flutter_template_tugas_besar/data/datasource/auth_local_datasource.dart';
import 'package:flutter_template_tugas_besar/data/models/request/auth_request_model.dart';
import 'package:flutter_template_tugas_besar/data/models/response/auth_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
      AuthRequestModel requestModel) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/login'),
      headers: headers,
      body: requestModel.toJson(),
    );
    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('server error');
    }
  }

  Future<Either<String, String>> logout() async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'authorization': 'Bearer ${await AuthLocalDatasource().getToken()}'
    };
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/logout'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return const Right('Logout Successfuly');
    } else {
      return const Left('server error');
    }
  }
}

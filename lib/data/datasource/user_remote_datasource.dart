import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_template_tugas_besar/data/models/response/user_response_model.dart';
import 'package:http/http.dart' as http;
import '../../common/constants/variables.dart';
import '../models/response/schedule_response_model.dart';
import 'auth_local_datasource.dart';

class UserRemoteDatasource {
  Future<Either<String, UserResponseModel?>> getUser() async {
    final header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'authorization': 'Bearer ${await AuthLocalDatasource().getToken()}',
    };

    try {
      final response = await http.get(
        Uri.parse('${Variables.baseUrl}/api/user'),
        headers: header,
      );
      if (response.statusCode == 200) {
        return Right(UserResponseModel.fromJson(response.body));
      } else {
        return left('Server error: ${response.statusCode}');
      }
    } catch (e) {
      return left('Failed to fetch user data: $e');
    }
  }
}

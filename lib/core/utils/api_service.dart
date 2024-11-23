import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  final String _baseUrl = 'http://10.0.2.2:8000/api/';

  Future<Map<String, dynamic>> register({
    required String email,
    required String name,
    required String password,
  }) async {
    var response = await _dio.post(
      '${_baseUrl}register',
      queryParameters:  {
        "name": name,
        "email": email,
        "password": password,
      },
      
    );

    return response.data;
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    var response = await _dio.post(
      '${_baseUrl}login',
      queryParameters:  {
        "email": email,
        "password": password,
      },
      
    );

    return response.data;
  }




Future<Map<String, dynamic>> resend({
    required String email,
  }) async {
    var response = await _dio.post(
      '${_baseUrl}resend',
      queryParameters:  {
        "email": email,
      },
      
    );

    return response.data;
  }


  
Future<Map<String, dynamic>> verify({
    required String code,
    required String token,
  }) async {
    var response = await _dio.post(
      '${_baseUrl}verification',
      options: Options(
        headers: 
        {
          'Authorization': 'Bearer $token',
        }
      ),
      queryParameters:  {
        "code": code,
      },
      
    );

    return response.data;
  }
  
}



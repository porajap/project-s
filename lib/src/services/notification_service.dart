import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project_s/src/services/pref_service.dart';

import '../models/response_model.dart';
import '../my_app.dart';
import 'custom_exception.dart';
import 'urls.dart';

class NotificationService {
  final prefService = SharedPreferencesService();

  Future<ResponseModel> addToken({required String token, required String platform}) async {
    ResponseModel _data = ResponseModel();

    try {
      final _token = await prefService.getToken();

      final _header = {
        HttpHeaders.authorizationHeader: 'Bearer $_token',
      };

      final _url = Uri.parse('${AppUrl.addToken}');

      Map<String, dynamic> _body = {
        "token": token,
        "platform": platform,
      };

      final _response = await http.post(_url, headers: _header, body: _body);

      if (_response.statusCode == 403) {
        throw AuthenticationUnauthorized();
      }

      final _jsonResponse = json.decode(_response.body);
      _data = ResponseModel.fromJson(_jsonResponse);

      return _data;
    } catch (err) {
      logger.e(err);
      return _data;
    }
  }
}

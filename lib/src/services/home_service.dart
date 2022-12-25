import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:project_s/src/models/home/queue_today_model.dart';
import 'package:project_s/src/models/home/register_model.dart';
import 'package:project_s/src/models/response_model.dart';
import 'package:project_s/src/services/pref_service.dart';
import 'package:project_s/src/services/urls.dart';
import '../my_app.dart';
import '../utils/constants.dart';
import 'custom_exception.dart';

class HomeService {
  final prefService = SharedPreferencesService();

  Future<RegisterModel> getRegister() async {
    RegisterModel _data = RegisterModel();

    try {
      final _token = await prefService.getToken();

      final _header = {
        HttpHeaders.authorizationHeader: 'Bearer $_token',
      };

      final _url = Uri.parse('${AppUrl.registerAt}');

      final _response = await http.get(_url, headers: _header);

      if (_response.statusCode == 403) {
        throw AuthenticationUnauthorized();
      }

      final _jsonResponse = json.decode(_response.body);

      _data = RegisterModel.fromJson(_jsonResponse);

      return _data;
    } catch (err) {
      logger.e(err);
      return _data;
    }
  }

  Future<QueueTodayModel> getQToday({required int organizeId}) async {
    QueueTodayModel _data = QueueTodayModel();

    try {
      final _token = await prefService.getToken();

      final _header = {
        HttpHeaders.authorizationHeader: 'Bearer $_token',
      };

      final _url = Uri.parse('${AppUrl.qToday}');

      Map<String, dynamic> _body = {"organizeId": '$organizeId'};

      final _response = await http.post(
        _url,
        headers: _header,
        body: _body,
      );

      if (_response.statusCode == 403) {
        throw AuthenticationUnauthorized();
      }

      final _jsonResponse = json.decode(_response.body);

      _data = QueueTodayModel.fromJson(_jsonResponse);

      return _data;
    } catch (err) {
      logger.e(err);
      return _data;
    }
  }

  Future<ResponseModel> confirmQ({
    required organizeId,
    required qNumber,
    required qId,
    required roomId,
  }) async {
    ResponseModel _data = ResponseModel();

    try {
      final _token = await prefService.getToken();

      final _header = {
        HttpHeaders.authorizationHeader: 'Bearer $_token',
      };

      final _url = Uri.parse('${AppUrl.confirmQ}');

      Map<String, dynamic> _body = {
        "organizeId": '$organizeId',
        "qNumber": '$qNumber',
        "qId": '$qId',
        "roomId": '$roomId',
      };

      final _response = await http.post(
        _url,
        headers: _header,
        body: _body,
      );

      if (_response.statusCode == 403) {
        throw AuthenticationUnauthorized();
      }

      final _jsonResponse = json.decode(_response.body);

      _data = ResponseModel.fromJson(_jsonResponse);

      logger.w(_data.toJson());

      return _data;
    } catch (err) {
      logger.e(err);
      return _data;
    }
  }

  Future<ResponseModel> scanQr({
    required organizeId,
    required qNumber,
  }) async {
    ResponseModel _data = ResponseModel();

    try {
      final _token = await prefService.getToken();

      final _header = {
        HttpHeaders.authorizationHeader: 'Bearer $_token',
      };

      final _url = Uri.parse('${AppUrl.scanQr}');

      Map<String, dynamic> _body = {
        "organizeId": '$organizeId',
        "qNumber": '$qNumber',
      };

      final _response = await http.post(
        _url,
        headers: _header,
        body: _body,
      );

      if (_response.statusCode == 403) {
        throw AuthenticationUnauthorized();
      }

      final _jsonResponse = json.decode(_response.body);

      _data = ResponseModel.fromJson(_jsonResponse);

      logger.w(_data.toJson());

      return _data;
    } catch (err) {
      logger.e(err);
      return _data;
    }
  }
}

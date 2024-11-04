import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

extension ResponseSuccess on Response {
  bool get isSuccess => statusCode == 200 || statusCode == 201;
}

abstract class ApiService {
  String get baseUrl => 'https://jsonplaceholder.typicode.com';

  String get apiUrl;

  String get url => baseUrl + apiUrl;

  dynamic fetch({String endPoint = ''}) async {
    final response = await http.get(Uri.parse(url + endPoint));
    return response.isSuccess ? jsonDecode(response.body) : null;
  }

  Future<bool> insert(Map<String, dynamic> map) async {
    var response = await http.post(Uri.parse(url), body: map);
    return response.isSuccess;
  }

  Future<bool> update(Map<String, dynamic> map) async {
    var response = await http.put(Uri.parse(url), body: map);
    return response.isSuccess;
  }

  Future<bool> remove(Map<String, dynamic> map) async {
    var response = await http.put(Uri.parse(url), body: map);
    return response.isSuccess;
  }
}

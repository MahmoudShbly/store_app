// in this file we write the basic method which will use it in services with more details
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(
      Uri.parse(url),
    ); //prsing url and do get request

    if (response.statusCode == 200) {
      // to check if the request is valid
      return jsonDecode(response.body); // return data that user ask to get it
    } else {
      throw Exception(
        'there is some problem with status code ${response.statusCode}', // if request is not valid !!
      );
    }
  }

  Future<dynamic> post({required String url, @required dynamic body}) async {
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      //there is another parm called headers is contains auth and content !
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'there is some problem whth status code ${response.statusCode}',
      );
    }
  }

  Future<dynamic> put({required String url, @required dynamic body}) async {
    print('url :$url body :$body');
    http.Response response = await http.put(
      Uri.parse(url),
      body:
          body, //there is another parm called headers is contains auth and content !
    );
    if (response.statusCode == 200) {
          print(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'there is some problem whth status code ${response.statusCode}',
      );
    }
  }
}

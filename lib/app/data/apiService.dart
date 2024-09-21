import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';


class APIService{

  APIService._privateConstructor();
  static final APIService _instance = APIService._privateConstructor();
  factory APIService() => _instance;
  
  final logger = Logger();
   final FirebaseAuth _auth = FirebaseAuth.instance;
  

   String? authToken;
   Map<String, String> headers = {};

  header()async{
    // authToken = sessionManager.getAuthToken();
    headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $authToken',
    };
  }

  Map<String, String> loginHeader={'Content-type': 'application/json'};

  Future<dynamic> getApi({dynamic url, Map<String, String>? queryParams}) async {
    await header();
    User? user = _auth.currentUser;

    try {
      if (user != null) {
        if (queryParams != null && queryParams.isNotEmpty) {
          final uri = Uri.parse(url).replace(queryParameters: queryParams);
          url = uri.toString();
        }
        debugPrint('headers: $headers');
        debugPrint('url: $url');
        final response = await http.get(Uri.parse(url));
        return returnResponse(response);
      } else {
        throw Exception("User not logged in");
      }
    } catch (e) {
      logger.e(" API Request Error getApi: $e");
    }
  }


  Future<dynamic> postApi({Object? body, dynamic url, bool? login = false}) async {
    await header();
    dynamic responseJson;
    debugPrint("Data format: $body");
    try {
      debugPrint("Post Request authToken: $authToken");
      if(login == false) {
        if (authToken != null) {
          final response = await http.post(Uri.parse(url), headers: headers,
              body: body == null ? jsonEncode({}) : jsonEncode(body)).timeout(
              const Duration(seconds: 20));
          debugPrint("POST Response body: ${response.body}");
          responseJson = returnResponse(response);
        } else {
          throw Exception("User not logged in");
        }
      }else{
        final response = await http.post(Uri.parse(url),headers: loginHeader,
            body: jsonEncode(body)).timeout(
            const Duration(seconds: 20));
        debugPrint("POST Response body: ${response.body}");
        responseJson = returnResponse(response);
      }
    } catch (e) {
      logger.e("API Request Error postApi: $e");
      // Handle errors and return null
      responseJson = null;
    }

    return responseJson;
  }

  Future<dynamic> putApi({dynamic body, dynamic url}) async {
    await header();
    dynamic responseJson;
    try {
      debugPrint("Post Request authToken: $authToken");
      if (authToken != null) {
        final response = await http.put(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        );
       logger.d("Put API headers ${response.body}");
        responseJson = returnResponse(response);
        logger.d("Put API headers give res in repo $responseJson");
        return responseJson;
      } else {
        logger.e("Put API headers give null");
        return null;
      }
    } catch (e) {
      logger.e("put API gave error in network layer $e");
      throw Exception('Failed to make a put request: $e');
    }
  }

 Future<dynamic> deleteApi({Map<String, dynamic>? body, String? url}) async {
   await header();
  dynamic responseJson;
  debugPrint("Delete Request authToken1: $authToken");
  try {
    final response = await http.delete(
      Uri.parse(url!),
      headers: headers,
      body: body != null ? jsonEncode(body) : null,
    );
    responseJson = returnResponse(response);
    logger.d("Delete API response in repository: $responseJson");
    return responseJson;
  } catch (e) {
    logger.e("Delete API encountered an error in network layer: $e");
    throw Exception('Failed to make a Delete request: $e');
  }
}

  Future<dynamic> multiPartRequestFun(String url,{Map<String, String>? fields, dynamic files}) async {
    await header();
    try {
      debugPrint("multipart call");
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(headers);
      if (fields != null) {
        fields.forEach((key, value) {
          request.fields[key] = value;
        });
      }
  
      for (var entry in files.entries) {
        if (entry.value.existsSync()) {
          request.files.add(
              await http.MultipartFile.fromPath(entry.key, entry.value.path));
        } else {
          debugPrint("File does not exist: ${entry.value.path}");
          return null;
        }
      }
      var response = await request.send();
      return returnResponse(response);
    } catch (e) {
      logger.e("API Request Error multiPartRequestFun: $e");
      return null;
    }
  }

  dynamic returnResponse(dynamic response) async {
    // debugPrint("response of ejf  +++++++++++  ${response.body}");
    if (response is http.Response) {
      var statusCode = response.statusCode;
      var responseBody = response.body;
      dynamic jsonResponse = json.decode(responseBody);
      switch (statusCode) {
        case 200:
          return jsonResponse;
        case 201 :
          return jsonResponse;
        case 400:
          return jsonResponse;
        case 401 :
          // SessionManager().deleteUser();
          // return Get.to(()=>LoginView());
        default:
         logger.e("Unexpected error with status code: $statusCode. Response body: $responseBody");
        return null;
      }
    } else if (response is http.StreamedResponse) {
      // For streamed responses and multipart responsce
      var statusCode = response.statusCode;
      var responseBody = await response.stream.bytesToString();
      dynamic jsonResponse = json.decode(responseBody);
      switch (statusCode) {
        case 200:
          return jsonResponse;
        case 201:
          return jsonResponse;
        case 400:
          return jsonResponse;
        case 401 :
          // sessionManager.deleteUser();
          // return Get.to(()=>LoginView());
        default:
          logger.e("Unexpected error with status code: $statusCode. Response body: $responseBody");
        return null;
      }
    } else {
      logger.e("Invalid response type: ${response.runtimeType}");
       return null;
    }
  }
}



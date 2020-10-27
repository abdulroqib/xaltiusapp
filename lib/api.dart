import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "http://localhost:8084";
// const baseUrl = "http://192.168.1.31:8084";

class API {
  static Future getUsers() {
    var url = baseUrl + "/data/data";
    return http.get(url);
  }
}
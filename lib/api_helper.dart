import 'dart:convert';

import 'package:http/http.dart' as htppsClient;

class ApiHelper {
  /// create function for hit api
  Future<dynamic> getApI({required String url}) async {
    var uri = Uri.parse(url);
    var res = await htppsClient.get(uri);
    if (res.statusCode == 200) {
      var mData = jsonDecode(res.body);
      return mData;
    } else {
      return null;
    }
  }

  /// post api hit
  Future<dynamic> postApi(
      {required String url, Map<String, dynamic>? bodyParams}) async {
    var uri = Uri.parse(url);
    var res = await htppsClient.post(uri, body: bodyParams ?? {});
    if (res.statusCode == 200) {
      var mData = jsonDecode(res.body);
      return mData;
    } else {
      return null;
    }
  }
}

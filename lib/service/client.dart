import 'package:http/http.dart';
import 'package:flutterRedux/service/response.dart';

import 'package:http/http.dart' as http;

class Client {

  Future<ServiceResponse<T>> get<T>(T Function(Response) builder, String path) async {
//    try {
//      var httpResponse = await http.get(path);
//      return ServiceResponse.createSuccess(
//          builder(httpResponse),
//          httpResponse.statusCode
//      );
//    } catch (e) {
//      print(e);
//      return ServiceResponse.createError(e);
//    }
  }

  // Put

  // Delete

  // Post
}
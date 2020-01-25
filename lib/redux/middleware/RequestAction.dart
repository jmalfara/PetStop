import 'package:flutterRedux/service/response.dart';

class RequestAction<T> {
  Future<ServiceResponse<T>> Function() executeRequest;
  RequestAction(this.executeRequest);
}
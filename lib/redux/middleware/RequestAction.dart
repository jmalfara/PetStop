import 'package:flutterRedux/service/response.dart';

class RequestAction<T> {
  Stream<ServiceResponse<T>> streamRequest;
  RequestAction(this.streamRequest);
}
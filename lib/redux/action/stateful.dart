import 'package:flutterRedux/base/stateful.dart';

class UpdateStatefulAction<T> {
  ValueState state;
  Stateful object;
  UpdateStatefulAction(this.state, this.object);
}
import 'package:petstop/base/stateful.dart';
import 'package:petstop/domain/model/session.dart';
import 'package:petstop/redux/action/stateful.dart';

class StoreSessionAction {
  Session session;
  StoreSessionAction(this.session);
}

Stateful<Session> sessionReducer(Stateful<Session> prev, action) {
  if (action is UpdateStatefulAction && action.object == prev) {
    return prev.copy(state: action.state);
  }

  if (action is StoreSessionAction) {
    return prev.copy(
      data: action.session
    );
  }

  return prev;
}
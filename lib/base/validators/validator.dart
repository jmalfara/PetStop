
import 'package:flutterRedux/base/info/text_info.dart';

String requiredTextValidator(value, TextInfo validationText) {
  if (value.isEmpty) {
    return validationText.toString();
  }
  return null;
}

String requiredNotNullValidator(value, TextInfo validationText) {
  if (value == null) {
    return validationText.toString();
  }
  return null;
}
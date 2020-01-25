abstract class Preferences {
  String accountName;
  String accountKey;
}

class PreferencesImpl implements Preferences {
  static final PreferencesImpl _instance = PreferencesImpl._privateConstructor();
  PreferencesImpl._privateConstructor();
  factory PreferencesImpl(){
    return _instance;
  }

  // ####################
  // AccountName
  // ####################
  String get accountName {
    return "jmalfara";
  }

  set accountName(String accountName) {
    // TODO Store accountKey
  }

  // ####################
  // AccountKey
  // ####################
  String get accountKey {
    return "asdfasdfasfasdfasdf";
  }

  set accountKey(String accountKey) {
    // TODO Store accountKey
  }
}
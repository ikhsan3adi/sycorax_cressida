class Utils {
  static int nowSeconds() => DateTime.now().millisecondsSinceEpoch ~/ 1000;

  static List<String> jsonStringList(Map<String, dynamic> json, String key) =>
      (json[key] as List<dynamic>?)?.cast<String>() ?? [];
}

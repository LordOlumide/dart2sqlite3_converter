import 'dart:convert';
import 'dart:async';
import 'dart:io';

abstract final class JsonHandler {
  static Future<List<Map<String, dynamic>>> decodeHymns() async {
    final File jsonFile = File('./assets/hymns.json');

    final String jsonStr = await jsonFile.readAsString();
    final List<Map<String, dynamic>> jsonData =
        List<Map<String, dynamic>>.from(json.decode(jsonStr));

    return jsonData;
  }
}

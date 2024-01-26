import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:raio/core/app_constants.dart';

class AppApiClient {
  final http.Client _client;

  AppApiClient(this._client);

  dynamic get(String path) async {
    final response = await _client.get(
        Uri.parse('${AppConstants.base_url}$path?api_key=${AppConstants.key}'));
    if (response.statusCode == 200) {
      return json.decoder.convert(response.body);
    } else {
      throw Exception('Failed to load data : ${response.reasonPhrase}');
    }
  }
}

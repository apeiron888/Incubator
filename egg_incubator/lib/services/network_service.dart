import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService {
  final String baseUrl;

  // Constructor to initialize the base URL for ESP32
  NetworkService(this.baseUrl);

  /// Sends the parameters to the ESP32 server.
  Future<bool> sendParameters(
      double minTemp, double maxTemp, double minHumidity, double maxHumidity) async {
    final url = Uri.parse('$baseUrl/sendParameters');
    final body = jsonEncode({
      'minTemp': minTemp,
      'maxTemp': maxTemp,
      'minHumidity': minHumidity,
      'maxHumidity': maxHumidity,
    });

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        return true; // Parameters successfully sent
      } else {
        print('Failed to send parameters. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error sending parameters: $e');
      return false;
    }
  }

  /// Fetches real-time data from the ESP32 server.
  Future<Map<String, dynamic>?> fetchRealtimeData() async {
    final url = Uri.parse('$baseUrl/realtimeData');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Return the data if the response is successful
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        print('Failed to fetch real-time data. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching real-time data: $e');
      return null;
    }
  }

  /// Sends temperature data to ESP32 for visualization or control.
  Future<bool> sendTemperatureData(double temperature) async {
    final url = Uri.parse('$baseUrl/sendTemperature');
    final body = jsonEncode({'temperature': temperature});

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        return true; // Temperature data successfully sent
      } else {
        print('Failed to send temperature data. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error sending temperature data: $e');
      return false;
    }
  }

  /// Fetches the current status of the incubator system (e.g., working, idle, error).
  Future<Map<String, dynamic>?> fetchStatus() async {
    final url = Uri.parse('$baseUrl/status');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        print('Failed to fetch status. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching status: $e');
      return null;
    }
  }
}

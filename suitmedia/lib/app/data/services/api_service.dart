import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  static const String baseUrl = 'https://reqres.in/api';

  static Future<UserResponse> getUsers({int page = 1, int perPage = 10}) async {
    try {
      final uri = Uri.parse('$baseUrl/users?page=$page&per_page=$perPage');
      
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': 'reqres-free-v1',
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return UserResponse.fromJson(jsonData);
      } else {
        throw Exception('Server returned ${response.statusCode}: ${response.reasonPhrase}');
      }
    } on SocketException {
      throw Exception('Network error: Please check your internet connection');
    } on FormatException {
      throw Exception('Data format error: Invalid response from server');
    } on TimeoutException {
      throw Exception('Request timeout: The server took too long to respond');
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }
}

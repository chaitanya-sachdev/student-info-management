import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/student.dart';

class ApiService {
  static const String baseUrl = 'http://localhost/student_api';

  static Future<bool> insertStudent({
    required String name,
    required String rollNumber,
    required String email,
    required double cgpa,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/insert_student.php'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'roll_number': rollNumber,
          'email': email,
          'cgpa': cgpa,
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse['status'] == true;
      }
      return false;
    } catch (e) {
      throw Exception('Failed to insert student: $e');
    }
  }

  static Future<List<Student>> fetchStudents() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/fetch_students.php'),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == true) {
          List<Student> students = [];
          for (var studentJson in jsonResponse['data']) {
            students.add(Student.fromJson(studentJson));
          }
          return students;
        }
      }
      return [];
    } catch (e) {
      throw Exception('Failed to fetch students: $e');
    }
  }
}

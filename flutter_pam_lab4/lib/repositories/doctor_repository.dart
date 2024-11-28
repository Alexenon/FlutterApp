import '../../../doctor_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class DoctorRepository {
  Future<List<DoctorModel>> fetchDoctors() async {
    final String response = await rootBundle.loadString('data.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => DoctorModel.fromJson(json)).toList();
  }
}

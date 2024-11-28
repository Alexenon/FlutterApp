import 'package:flutter/material.dart';

import '../repositories/doctor_repository.dart';
import '../models/doctor_card.dart';
import '../models/doctor_entity.dart';

class MedicalAppHomePage extends StatelessWidget {
  final DoctorRepository doctorRepository = DoctorRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<Doctor>>(
          future: doctorRepository.fetchDoctors(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            final doctors = snapshot.data ?? [];
            return ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                return DoctorCard(doctor: doctors[index]);
              },
            );
          },
        ),
      ),
    );
  }
}

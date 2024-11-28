import 'package:flutter/material.dart';
import '../../doctor_entity.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                doctor.imagePath,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctor.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 4),
                  Text(doctor.specialty, style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text('${doctor.rating}'),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(' (${doctor.reviews} Reviews)'),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                // Navigate to doctor details
              },
            ),
          ],
        ),
      ),
    );
  }
}

import '../../doctor_entity.dart';

class DoctorModel extends Doctor {
  DoctorModel({
    required String name,
    required String specialty,
    required double rating,
    required int reviews,
    required String imagePath,
  }) : super(
          name: name,
          specialty: specialty,
          rating: rating,
          reviews: reviews,
          imagePath: imagePath,
        );

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['name'],
      specialty: json['specialty'],
      rating: json['rating'],
      reviews: json['reviews'],
      imagePath: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'specialty': specialty,
      'rating': rating,
      'reviews': reviews,
      'image': imagePath,
    };
  }
}

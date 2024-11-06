import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MedicalAppHomePage(),
    );
  }
}

class MedicalAppHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLocationBar(),
                SizedBox(height: 16),
                _buildSearchBar(),
                SizedBox(height: 16),
                _buildPromoBanner(),
                SizedBox(height: 16),
                _buildCategories(),
                SizedBox(height: 16),
                _buildNearbyMedicalCenters(),
                SizedBox(height: 16),
                _buildDoctorsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLocationBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.location_on),
            SizedBox(width: 8),
            Text('Chişinău, Republic of Moldova'),
            Icon(Icons.arrow_drop_down),
          ],
        ),
        CircleAvatar(
          backgroundImage: AssetImage('lib/images/banner.jpg'),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search doctor...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      height: 190,
      
      child: Row(
        children: [
          
          Image.asset('lib/images/banner.jpg'),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    List<Map<String, dynamic>> categories = [
      {'icon': Icons.book, 'label': 'Dentistry'},
      {'icon': Icons.favorite, 'label': 'Cardiology'},
      {'icon': Icons.air, 'label': 'Pulmonology'},
      {'icon': Icons.medical_services, 'label': 'General'},
      {'icon': Icons.psychology, 'label': 'Neurology'},
      {'icon': Icons.food_bank, 'label': 'Gastroentero'},
      {'icon': Icons.science, 'label': 'Laboratory'},
      {'icon': Icons.vaccines, 'label': 'Vaccination'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: Text('See All'),
            ),
          ],
        ),
        SizedBox(height: 4),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.9,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.primaries[index % Colors.primaries.length].shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(categories[index]['icon']),
                ),
                SizedBox(height: 4),
                Text(
                  categories[index]['label'],
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildNearbyMedicalCenters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nearby Medical Centers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: Text('See All'),
            ),
          ],
        ),
        SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildMedicalCenterCard(
                'Sunrise Health Clinic',
                '123 Oak Street, CA 98765',
                5.0,
                58,
                2.5,
                40,
                'lib/images/clinic1.jfif',
              ),
              SizedBox(width: 16),
              _buildMedicalCenterCard(
                'Golden Cardiology',
                '555 Bridge Street',
                4.9,
                106,
                2.5,
                40,
                'lib/images/clinic2.jfif',
              ),
              SizedBox(width: 16),
              _buildMedicalCenterCard(
                'Sunrise Health Clinic',
                '123 Oak Street, CA 98765',
                5.0,
                58,
                2.5,
                40,
                'lib/images/clinic1.jfif',
              ),
            ],
          ),
        ),
      ],
    );
  }

 Widget _buildMedicalCenterCard(String name, String address, double rating,
    int reviews, double distance, int duration, String imagePath) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    margin: EdgeInsets.only(bottom: 16),
    child: SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imaginea centrului medical
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(imagePath, height: 120, width: double.infinity, fit: BoxFit.cover),
          ),
          SizedBox(height: 10),
          // Numele centrului medical
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          // Adresa centrului medical
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(address, style: TextStyle(fontSize: 12)),
          ),
          // Rating și stele
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text('$rating'),
                Icon(Icons.star, color: Color.fromARGB(255, 244, 162, 10), size: 16),
                Icon(Icons.star, color: Color.fromARGB(255, 244, 162, 10), size: 16),
                Icon(Icons.star, color: Color.fromARGB(255, 244, 162, 10), size: 16),
                Icon(Icons.star, color: Color.fromARGB(255, 244, 162, 10), size: 16),
                Icon(Icons.star, color: Color.fromARGB(255, 244, 162, 10), size: 16),
                Text('($reviews Reviews)'),
              ],
            ),
          ),
          // Separator și informații despre distanță și spital
          Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Icon(Icons.car_crash_sharp, color: Colors.grey, size: 14),
                Text(' $distance km / $duration min        '),
                Icon(Icons.medication_sharp, color: Colors.grey, size: 14),
                Text('Hospital'),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
  Widget _buildDoctorsList() {
    List<Map<String, dynamic>> doctors = [
      {
        'name': 'Dr. Harry Maquire',
        'specialty': 'Cardiologist',
        'location': 'Cardiology Center, USA',
        'rating': 5.0,
        'reviews': 1872,
        'image': 'lib/images/doc1.jpg',
      },
      {
        'name': 'Dr. Michael Johnson',
        'specialty': 'Dentist',
        'location': 'Women\'s Clinic, Seattle, USA',
        'rating': 4.9,
        'reviews': 127,
        'image': 'lib/images/doc2.jfif',
      },
      {
        'name': 'Dr. Stacy Harley',
        'specialty': 'Orthopedic Surgery',
        'location': 'Maple Associates, NY, USA',
        'rating': 4.7,
        'reviews': 5223,
        'image': 'lib/images/doc3.jfif',
      },
      {
        'name': 'Dr. Patrick Kentucky',
        'specialty': 'Pediatrics',
        'location': 'Serenity Pediatrics Clinic',
        'rating': 5.0,
        'reviews': 405,
        'image': 'lib/images/doc1.jpg',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
        Text(
          '${doctors.length} found                                           ',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        
        Text('Default',selectionColor: Colors.grey,),

        Icon(Icons.south_rounded,size: 15,),
        Icon(Icons.north_rounded,size: 15,),


          ]
        ),
        SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            return _buildDoctorCard(doctors[index]);
          },
        ),
      ],
    );
  }
  
Widget _buildDoctorCard(Map<String, dynamic> doctor) {
  return Card(
    margin: EdgeInsets.only(bottom: 17),
    child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        children: [
          
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Setează colțuri rotunjite
            child: Image.asset(
              doctor['image'], // Imaginea doctorului
              width: 80,       // Lățimea imaginii
              height: 80,      // Înălțimea imaginii
              fit: BoxFit.cover, // Asigură că imaginea acoperă complet containerul
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctor['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                Text(doctor['specialty']),
                Text(doctor['location']),
                Row(
                  children: [
                    Text('${doctor['rating']}'),
                     Icon(Icons.star, color: Color.fromARGB(255, 242, 134, 33), size: 16),
                     Icon(Icons.star, color: Color.fromARGB(255, 242, 134, 33), size: 16),
                     Icon(Icons.star, color: Color.fromARGB(255, 242, 134, 33), size: 16),
                     Icon(Icons.star, color: Color.fromARGB(255, 242, 134, 33), size: 16),
                     Icon(Icons.star, color: Color.fromARGB(255, 242, 134, 33), size: 16),
                    Text('(${doctor['reviews']} Reviews)'),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.favorite_border),
        ],
      ),
    ),
  );
}
}
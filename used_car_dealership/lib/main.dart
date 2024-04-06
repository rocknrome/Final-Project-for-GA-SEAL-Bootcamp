import 'package:flutter/material.dart';
import 'car_service.dart'; // Ensure this file exists and is correctly implemented

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Adding a Key parameter
  const MyApp({Key? key}) : super(key: key); // Corrected constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Cars for Sale')), // Removed const
        body: const CarListPage(),
      ),
    );
  }
}

class CarListPage extends StatefulWidget {
  const CarListPage({Key? key}) : super(key: key); // Added a Key parameter

  @override
  // ignore: library_private_types_in_public_api
  _CarListPageState createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  late Future<List<dynamic>> futureCars;

  @override
  void initState() {
    super.initState();
    futureCars = CarService.fetchCars();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: futureCars,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var car = snapshot.data![index];
              return ListTile(
                title: Text('${car['make']} ${car['model']}'),
                subtitle: Text('Year: ${car['year']} - Mileage: ${car['mileage']} miles'),
                onTap: () {
                  // Implement navigation to detail page if necessary
                },
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}

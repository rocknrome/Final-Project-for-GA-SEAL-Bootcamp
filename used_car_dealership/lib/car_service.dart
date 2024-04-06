import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://used-car-dealership-be.onrender.com/api/cars/';

class CarService {
  // Fetch all cars
  static Future<List<dynamic>> fetchCars() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load cars');
    }
  }

  // Fetch a single car by ID (assuming you need it for detail view)
  static Future<dynamic> fetchCarById(String carId) async {
    final response = await http.get(Uri.parse('$baseUrl$carId'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load car $carId');
    }
  }

  // Add more functions here as needed (addCar, updateCar, deleteCar)
}

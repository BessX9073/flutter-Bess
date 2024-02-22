import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather API Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  TextEditingController cityController = TextEditingController();
  String temp = '';
  String description = '';

  Future<void> getWeatherData(String cityName) async {
    final apiKey = 'ba9c46ff2f98dbd6aafcbf12e01b4da8';
    final apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';
    
    final response = await http.get(Uri.parse(apiUrl));
    final responseData = json.decode(response.body);

    setState(() {
      temp = (responseData['main']['temp'] - 273.15).toStringAsFixed(2); // Convert Kelvin to Celsius
      description = responseData['weather'][0]['description'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather API Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 200,
                child: TextField(
                  controller: cityController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Enter city',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String cityName = cityController.text;
                getWeatherData(cityName);
              },
              child: Text('OK'),
            ),
            SizedBox(height: 20),
            Text(
              '$temp',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$description',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

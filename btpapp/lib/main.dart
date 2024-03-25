// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Football Player Market Value Prediction',
//       theme: ThemeData(
//         brightness: Brightness.dark, // Set background color to dark
//         primaryColor: Colors.red, // Set slider color to red
//       ),
//       home: PredictionScreen(),
//     );
//   }
// }

// class PredictionScreen extends StatefulWidget {
//   @override
//   _PredictionScreenState createState() => _PredictionScreenState();
// }

// class _PredictionScreenState extends State<PredictionScreen> {
//   // Default values for input features
//   Map<String, double> defaultValues = {
//     'Age': 23,
//     'Dribbling / Reflexes': 92,
//     'Passing / Kicking': 80,
//     'Shooting / Handling': 89,
//     'International reputation': 4,
//     'Total mentality': 361,
//     'Shot power': 88,
//     'Total power': 410,
//     'Ball control': 91,
//     'Finishing': 93,
//   };

//   // Slider values for each feature
//   Map<String, double> sliderValues = {};

//   @override
//   void initState() {
//     super.initState();
//     // Initialize slider values with default values
//     sliderValues = Map.from(defaultValues);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Predict Market Value of Football Players'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(
//                       'assets/images/banner.jpg'), // Add the banner image
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               height: 200, // Adjust height as needed
//             ),
//             SizedBox(height: 16.0),
//             ...defaultValues.keys.map((key) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(key, style: TextStyle(color: Colors.white)),
//                   Slider(
//                     min: (key == 'Total mentality' || key == 'Total power')
//                         ? 1
//                         : 0,
//                     max: (key == 'Total mentality' || key == 'Total power')
//                         ? 500
//                         : (key == 'International reputation')
//                             ? 5
//                             : 100,
//                     divisions: 100,
//                     value: sliderValues[key]!,
//                     onChanged: (value) {
//                       setState(() {
//                         if (key == 'International reputation') {
//                           // Round the value to the nearest integer for 'International reputation'
//                           sliderValues[key] = value.roundToDouble();
//                         } else {
//                           sliderValues[key] = value;
//                         }
//                       });
//                     },
//                     activeColor: Theme.of(context).primaryColor,
//                   ),
//                   SizedBox(height: 8.0),
//                   Text('Value: ${sliderValues[key]!.toStringAsFixed(0)}',
//                       style: TextStyle(
//                           color: Colors
//                               .white)), // Use 0 decimal places for integer values
//                   SizedBox(height: 16.0),
//                 ],
//               );
//             }).toList(),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: ElevatedButton(
//           onPressed: () {
//             // Handle prediction logic here
//             print(sliderValues); // Print slider values
//           },
//           child: Text('Predict'),
//         ),
//       ),
//     );
//   }
// }
// Complete code for the Flutter application

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Football Player Market Value Prediction',
      theme: ThemeData(
        brightness: Brightness.dark, // Set background color to dark
        primaryColor: Colors.red, // Set slider color to red
      ),
      home: PredictionScreen(),
    );
  }
}

class PredictionScreen extends StatefulWidget {
  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  // Default values for input features
  Map<String, double> defaultValues = {
    'Age': 23,
    'Dribbling / Reflexes': 92,
    'Passing / Kicking': 80,
    'Shooting / Handling': 89,
    'International reputation': 4,
    'Total mentality': 361,
    'Shot power': 88,
    'Total power': 410,
    'Ball control': 91,
    'Finishing': 93,
  };

  // Slider values for each feature
  Map<String, double> sliderValues = {};

  // Predicted value
  String? predictedValue;

  @override
  void initState() {
    super.initState();
    // Initialize slider values with default values
    sliderValues = Map.from(defaultValues);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beyond The Pitch '),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/banner.jpg'), // Add the banner image
                  fit: BoxFit.cover,
                ),
              ),
              height: 200, // Adjust height as needed
            ),
            SizedBox(height: 16.0),
            ...defaultValues.keys.map((key) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(key, style: TextStyle(color: Colors.white)),
                  Slider(
                    min: (key == 'Total mentality' || key == 'Total power') ? 1 : 0,
                    max: (key == 'Total mentality' || key == 'Total power') ? 500 : (key == 'International reputation') ? 5 : 100,
                    divisions: 100,
                    value: sliderValues[key]!,
                    onChanged: (value) {
                      setState(() {
                        if (key == 'International reputation') {
                          // Round the value to the nearest integer for 'International reputation'
                          sliderValues[key] = value.roundToDouble();
                        } else {
                          sliderValues[key] = value;
                        }
                      });
                    },
                    activeColor: Theme.of(context).primaryColor,
                  ),
                  SizedBox(height: 8.0),
                  Text('Value: ${sliderValues[key]!.toStringAsFixed(0)}', style: TextStyle(color: Colors.white)), // Use 0 decimal places for integer values
                  SizedBox(height: 16.0),
                ],
              );
            }).toList(),
            if (predictedValue != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('$predictedValue', style: TextStyle(color: Colors.white, fontSize: 15.0)),
              ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Call the Flask REST API to make predictions
            makePrediction(sliderValues).then((prediction) {
              print('$prediction');
              setState(() {
                predictedValue = "Predicted value: ${prediction['prediction']} Euros";
              });
            }).catchError((error) {
              print('Error: $error');
              setState(() {
                predictedValue = 'Error: $error';
              });
            });
          },
          child: Text('Predict'),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> makePrediction(Map<String, double> values) async {
    // Define the URL for Flask API
    final apiUrl = Uri.parse('https://btp-flask-6c5i.onrender.com/predict');

    try {
      // Make a POST request to the Flask API
      final response = await http.post(
        apiUrl,
        body: {
          'Age': values['Age']!.toString(),
          'Dribbling / Reflexes': values['Dribbling / Reflexes']!.toString(),
          'Passing / Kicking': values['Passing / Kicking']!.toString(),
          'Shooting / Handling': values['Shooting / Handling']!.toString(),
          'International reputation': values['International reputation']!.toString(),
          'Total mentality': values['Total mentality']!.toString(),
          'Shot power': values['Shot power']!.toString(),
          'Total power': values['Total power']!.toString(),
          'Ball control': values['Ball control']!.toString(),
          'Finishing': values['Finishing']!.toString(),
        },
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse the response JSON
        final Map<String, dynamic> prediction = json.decode(response.body);
        return prediction;
      } else {
        // Throw an error if the request was not successful
        throw 'Failed to make prediction: ${response.statusCode}';
      }
    } catch (error) {
      throw 'Error making prediction: $error';
    }
  }
}



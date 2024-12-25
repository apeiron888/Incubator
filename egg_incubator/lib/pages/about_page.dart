import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About the Egg Incubator Monitor',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to the Egg Incubator app! Here, you can efficiently monitor and control the temperature and humidity of your incubator in real-time, ensuring optimal conditions for egg hatching.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'Developed By:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('1. Aelaf Tsegaye - Software Engineering student'),
            Text('2. Arsema Tesfaye - Software Engineering student'),
            Text('3. Natnael Bacha - Software Engineering student'),
            SizedBox(height: 24),
            Text(
              'Project Description',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'The Egg Incubator app allows you to monitor and control the temperature and humidity of your incubator remotely, ensuring optimal conditions for successful hatching.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            // Optional: Add images/icons for the team or project
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AdditionalPage extends StatelessWidget {
  const AdditionalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Additional Features'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_circle, size: 100, color: Colors.deepOrangeAccent),
              SizedBox(height: 16),
              Text(
                'Explore Additional Features',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Coming Soon.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

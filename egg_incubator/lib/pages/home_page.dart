import 'package:flutter/material.dart';
import '../services/network_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _minTempController = TextEditingController();
  final _maxTempController = TextEditingController();
  final _minHumidityController = TextEditingController();
  final _maxHumidityController = TextEditingController();
  final NetworkService _networkService = NetworkService('http://192.168.1.184'); // Replace with actual IP

  @override
  void dispose() {
    _minTempController.dispose();
    _maxTempController.dispose();
    _minHumidityController.dispose();
    _maxHumidityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Egg Incubator Monitor'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
              ),
              child: Text(
                'Egg Incubator',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: const Text('Realtime Data'),
              onTap: () {
                Navigator.pushNamed(context, '/realtime'); // Navigate to Realtime Data page
              },
            ),
            ListTile(
              title: const Text('Additional Features'),
              onTap: () {
                Navigator.pushNamed(context, '/additional'); // Navigate to Additional Features page
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.pushNamed(context, '/about'); // Navigate to About page
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // First section with background image and heading
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/bg.jpg'), // Your background image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 20,
                  right: 20,
                  child: Text(
                    'Egg Incubator',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2.0,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.7),
                          offset: const Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            // Second section with settings for temperature and humidity
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Set Optimal Parameters',
                    style: Theme.of(context).textTheme.titleLarge,

                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _minTempController,
                    decoration: const InputDecoration(
                      labelText: 'Minimum Temperature (°C)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _maxTempController,
                    decoration: const InputDecoration(
                      labelText: 'Maximum Temperature (°C)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _minHumidityController,
                    decoration: const InputDecoration(
                      labelText: 'Minimum Humidity (%)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _maxHumidityController,
                    decoration: const InputDecoration(
                      labelText: 'Maximum Humidity (%)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final minTemp = double.tryParse(_minTempController.text) ?? 0.0;
                      final maxTemp = double.tryParse(_maxTempController.text) ?? 0.0;
                      final minHumidity = double.tryParse(_minHumidityController.text) ?? 0.0;
                      final maxHumidity = double.tryParse(_maxHumidityController.text) ?? 0.0;

                      final success = await _networkService.sendParameters(
                        minTemp,
                        maxTemp,
                        minHumidity,
                        maxHumidity,
                      );

                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Parameters sent successfully')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Failed to send parameters')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

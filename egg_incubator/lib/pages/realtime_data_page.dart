import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../services/network_service.dart';

class RealtimeDataPage extends StatefulWidget {
  const RealtimeDataPage({super.key});

  @override
  _RealtimeDataPageState createState() => _RealtimeDataPageState();
}

class _RealtimeDataPageState extends State<RealtimeDataPage> {
  final NetworkService _networkService = NetworkService('http://192.168.1.184'); // Replace with actual IP
  bool _isLoading = true;
  Map<String, dynamic>? _realtimeData; // Store the fetched data
  
  @override
  void initState() {
    super.initState();
    _fetchRealtimeData();
  }

  // Fetch real-time data from ESP32
  Future<void> _fetchRealtimeData() async {
    final data = await _networkService.fetchRealtimeData();
    setState(() {
      _realtimeData = data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realtime Data'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator()) // Show loading indicator
          : _realtimeData == null
              ? const Center(child: Text('Failed to fetch data')) // Show error if data is null
              : Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Hatching Time Remaining: 10 Days 5 Hours',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        title: ChartTitle(text: 'Temperature (°C)'),
                        series: <ChartSeries>[
                          LineSeries<double, int>(
                            dataSource: List.generate(
                              _realtimeData!['temperature'].length,
                              (index) => _realtimeData!['temperature'][index],
                            ),
                            xValueMapper: (double temp, int index) => index + 1,
                            yValueMapper: (double temp, int index) => temp,
                            name: 'Temperature',
                            markerSettings: const MarkerSettings(isVisible: true),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        title: ChartTitle(text: 'Humidity (%)'),
                        series: <ChartSeries>[
                          LineSeries<double, int>(
                            dataSource: List.generate(
                              _realtimeData!['humidity'].length,
                              (index) => _realtimeData!['humidity'][index],
                            ),
                            xValueMapper: (double hum, int index) => index + 1,
                            yValueMapper: (double hum, int index) => hum,
                            name: 'Humidity',
                            markerSettings: const MarkerSettings(isVisible: true),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }
}

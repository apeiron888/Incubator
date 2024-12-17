const mongoose = require('mongoose');

const sensorDataSchema = new mongoose.Schema({
  temperature: [Number], // Array of temperatures
  humidity: [Number],    // Array of humidity readings
  timestamp: { type: Date, default: Date.now },
});

module.exports = mongoose.model('SensorData', sensorDataSchema);

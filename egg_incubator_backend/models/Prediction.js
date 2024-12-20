const mongoose = require('mongoose');
const predictionSchema = new mongoose.Schema({
  temperature: [Number],
  humidity: [Number],
  hatchingTime: { type: Number }, // Predicted hatching time in hours
  successRate: { type: Number }, // Predicted success rate in percentage
  timestamp: { type: Date, default: Date.now },
});
module.exports = mongoose.model('Prediction', predictionSchema);

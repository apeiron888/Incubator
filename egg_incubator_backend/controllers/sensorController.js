const SensorData = require('../models/SensorData');
const Prediction = require('../models/Prediction');
const { generatePrediction } = require('../utils/predictor');
let tempBatch = [];
let humidityBatch = [];

const receiveSensorData = async (req, res) => {
  try {
    const { temperatures, humidity } = req.body;
    tempBatch = tempBatch.concat(temperatures);
    humidityBatch = humidityBatch.concat(humidity);

    if (tempBatch.length >= 30) {
      const mergedData = {
        temperature: tempBatch,
        humidity: humidityBatch,
      };
      const newData = new SensorData(mergedData);
      await newData.save();
      tempBatch = [];
      humidityBatch = [];
      console.log('5-minute data batch saved to database.');
    }
    res.status(200).json({ message: 'Data received successfully!' });
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Failed to receive data.' });
  }
};

const getSensorData = async (req, res) => {
  try {
    const data = await SensorData.find().sort({ timestamp: -1 }).limit(10);
    const processedData = {
      temperature: data.map((entry) => entry.temperature).flat(),
      humidity: data.map((entry) => entry.humidity).flat(),
    };
    const predictedData = await generatePrediction(processedData);
    res.json({ data, predictedData });
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Failed to retrieve data.' });
  }
};

module.exports = { receiveSensorData, getSensorData };

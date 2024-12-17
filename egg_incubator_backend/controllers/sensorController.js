const SensorData = require('../models/SensorData');

let tempBatch = [];
let humidityBatch = [];

// Receive sensor data from Arduino
const receiveSensorData = async (req, res) => {
  try {
    const { temperatures, humidity } = req.body;

    // Add to temporary batches
    tempBatch = tempBatch.concat(temperatures);
    humidityBatch = humidityBatch.concat(humidity);

    // Check if 5 updates have been collected
    if (tempBatch.length >= 5) {
      const mergedData = {
        temperature: tempBatch,
        humidity: humidityBatch,
      };

      const newData = new SensorData(mergedData);
      await newData.save();

      // Clear batches
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

// Fetch data for the frontend
const getSensorData = async (req, res) => {
  try {
    const data = await SensorData.find().sort({ timestamp: -1 }).limit(10);
    res.json(data);
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Failed to retrieve data.' });
  }
};

module.exports = { receiveSensorData, getSensorData };

const SensorData = require('../models/SensorData');
const { sendToArduino } = require('../utils/arduinoCommunicator');

const startService = async (req, res) => {
  try {
    const { optimalTemperature, optimalHumidity } = req.body;

    // Initialize the database table (ensure a clean slate)
    await SensorData.deleteMany({});
    console.log('Database initialized: Cleared previous records.');

    // Send setup parameters to Arduino
    await sendToArduino({ optimalTemperature, optimalHumidity });

    res.status(200).json({
      message: 'Service started successfully!',
      parameters: { optimalTemperature, optimalHumidity },
    });
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Failed to start the service.' });
  }
};

module.exports = { startService };

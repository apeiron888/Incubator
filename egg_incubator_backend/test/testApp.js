const axios = require('axios');
const testServer = async () => {
  try {
    const startResponse = await axios.post('http://localhost:5000/api/starter/start', {
      optimalTemperature: 37.5,
      optimalHumidity: 60,
    });
    console.log('Start Service Response:', startResponse.data);

    const sensorDataResponse = await axios.post('http://localhost:5000/api/sensors/data', {
      temperatures: [37.0, 37.1, 37.2, 37.3, 37.4, 37.1, 37.2, 37.3, 37.4],
      humidity: [59, 60, 61, 62, 63, 59, 60, 61, 62, 63],
    });
    console.log('Sensor Data Response:', sensorDataResponse.data);

    const getDataResponse = await axios.get('http://localhost:5000/api/sensors/data');
    console.log('Get Data Response:', getDataResponse.data);

    const notificationResponse = await axios.post('http://localhost:5000/api/notification', {
      type: 'rotation',
      message: 'Egg rotated successfully.',
    });
    console.log('Notification Response:', notificationResponse.data);
  } catch (err) {
    console.error('Test Error:', err.message);
  }
};

testServer();
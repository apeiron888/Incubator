const axios = require('axios');

const testSensorData = async () => {
  try {
    // Send POST request to upload sensor data to the server
    const response = await axios.post('http://localhost:5000/api/sensors/data', {
      temperatures: [37.0, 37.1, 37.2, 37.3, 37.4, 37.1, 37.2, 37.3, 37.4],
      humidity: [59, 60, 61, 62, 63, 59, 60, 61, 62, 63],
    });
    
    console.log('Response:', response.data);
  } catch (error) {
    console.error('Error:', error.response ? error.response.data : error.message);
  }
};

// Call the function to test uploading data
testSensorData();

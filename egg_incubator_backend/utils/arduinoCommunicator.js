const axios = require('axios');

const sendToArduino = async (parameters) => {
  try {
    const response = await axios.post('https://api.ipify.org/start', parameters);
    console.log('Response from Arduino:', response.data);
  } catch (err) {
    console.error('Error sending to Arduino:', err.message);
  }
};

module.exports = { sendToArduino };

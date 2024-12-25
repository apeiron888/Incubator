const regression = require('regression');

const OPTIMAL_TEMPERATURE = 37.5; // Optimal temperature in °C
const OPTIMAL_HUMIDITY = 60; // Optimal humidity in %
const INCUBATION_PERIOD_HOURS = 504; // 21 days * 24 hours/day

const calculateVariance = (data) => {
  const mean = data.reduce((sum, value) => sum + value, 0) / data.length;
  return data.reduce((sum, value) => sum + Math.pow(value - mean, 2), 0) / data.length;
};

const generatePrediction = async (currentData, incubationStartTime) => {
  const { temperature, humidity } = currentData;

  if (temperature.length < 10 || humidity.length < 10) {
    throw new Error('Insufficient data for prediction.');
  }

  const recentTemperature = temperature.slice(-10);
  const recentHumidity = humidity.slice(-10);

  const regressionData = recentTemperature.map((temp, index) => [index, temp]);
  const humidityRegressionData = recentHumidity.map((hum, index) => [index, hum]);

  const tempResult = regression.linear(regressionData);
  const humidResult = regression.linear(humidityRegressionData);

  const nextIndex = recentTemperature.length;
  const predictedTemp = tempResult.predict(nextIndex)[1];
  const predictedHumid = humidResult.predict(nextIndex)[1];

  const currentTime = new Date();
  const elapsedTimeHours = (currentTime - new Date(incubationStartTime)) / 36e5; // Convert ms to hours

  // Estimate remaining hatching time
  const remainingHatchingTime = Math.max(INCUBATION_PERIOD_HOURS - elapsedTimeHours, 0);

  // Calculate variance in temperature and humidity
  const tempVariance = calculateVariance(temperature);
  const humidVariance = calculateVariance(humidity);

  // Estimate success rate based on variance
  const tempDeviation = Math.abs(OPTIMAL_TEMPERATURE - predictedTemp);
  const humidDeviation = Math.abs(OPTIMAL_HUMIDITY - predictedHumid);

  // Simple model: higher deviations and variances reduce success rate
  let successRate = 100 - (tempDeviation * 2 + humidDeviation * 1.5 + tempVariance + humidVariance);

  // Clamp success rate between 0 and 100
  successRate = Math.max(Math.min(successRate, 100), 0);

  return {
    predictedTemperature: Math.round(predictedTemp * 10) / 10, // Rounded to 1 decimal place
    predictedHumidity: Math.round(predictedHumid * 10) / 10, // Rounded to 1 decimal place
    remainingHatchingTime: Math.round(remainingHatchingTime), // In hours
    successRate: Math.round(successRate) // In percentage
  };
};

module.exports = { generatePrediction };
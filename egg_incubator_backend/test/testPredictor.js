const { generatePrediction } = require('../utils/predictor');

const currentData = {
  temperature: [37.2, 37.4, 37.5, 37.6, 37.5, 37.4, 37.3, 37.5, 37.6, 37.5],
  humidity: [59, 60, 61, 60, 59, 60, 61, 60, 59, 60]
};

const incubationStartTime = '2024-12-01T00:00:00Z';

generatePrediction(currentData, incubationStartTime)
  .then(prediction => {
    console.log('Prediction:', prediction);
  })
  .catch(error => {
    console.error('Error generating prediction:', error);
  });

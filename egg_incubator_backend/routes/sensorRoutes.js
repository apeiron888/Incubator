const express = require('express');
const { receiveSensorData, getSensorData } = require('../controllers/sensorController');
const router = express.Router();
router.post('/data', receiveSensorData);
router.get('/data', getSensorData);
module.exports = router;
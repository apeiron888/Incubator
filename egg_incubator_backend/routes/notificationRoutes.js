const express = require('express');
const { receiveNotification } = require('../controllers/notificationController');
const router = express.Router();
router.post('/notification', receiveNotification);
module.exports = router;
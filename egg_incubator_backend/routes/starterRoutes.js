const express = require('express');
const { startService } = require('../controllers/starterController');
const router = express.Router();
router.post('/start', startService);
module.exports = router;

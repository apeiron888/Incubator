const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const dotenv = require('dotenv');
const connectDB = require('./config/db');

dotenv.config();
connectDB();

const app = express();
app.use(cors());
app.use(bodyParser.json());

const starterRoutes = require('./routes/starterRoutes');
const sensorRoutes = require('./routes/sensorRoutes');
const notificationRoutes = require('./routes/notificationRoutes');

// API endpoints
app.use('/api/starter', starterRoutes);
app.use('/api/sensors', sensorRoutes);
app.use('/api/notifications', notificationRoutes);

app.use((err, req, res, next) => {
    console.error('Error:', err.message || 'Internal Server Error');
    res.status(err.status || 500).json({
      error: err.message || 'Internal Server Error',
    });
  });
  
  const PORT = process.env.PORT || 5000;
  
  app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
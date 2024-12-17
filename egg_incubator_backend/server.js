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

// Routes
const starterRoutes = require('./routes/starterRoutes');
const sensorRoutes = require('./routes/sensorRoutes');

app.use('/api/starter', starterRoutes);
app.use('/api/sensors', sensorRoutes);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));

const mongoose = require('mongoose');
const notificationSchema = new mongoose.Schema({
  type: { type: String, required: true }, // 'rotation', 'hatching', 'error'
  message: { type: String },
  timestamp: { type: Date, default: Date.now },
});
module.exports = mongoose.model('Notification', notificationSchema);

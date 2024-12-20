const Notification = require('../models/Notification');

const receiveNotification = async (req, res) => {
  try {
    const { type, message } = req.body;
    const newNotification = new Notification({ type, message });
    await newNotification.save();
    console.log(`Notification saved: ${type} - ${message}`);
    res.status(200).json({ message: 'Notification received successfully!' });
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ error: 'Failed to process notification.' });
  }
};

module.exports = { receiveNotification };
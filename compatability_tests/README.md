# Compatibility Tests

This directory contains various test codes to verify the compatibility of sensors, motors, and Wi-Fi modules with the Arduino microcontroller. Each file focuses on testing a specific component or functionality required for the project.

---

## **Contents**
1. **Sensor Testing**
   - Tests the temperature and humidity sensors using the DHT library.
   - The library, pin, and methods may vary depending on the sensor type. 
     - Example: The code provided here is compatible with the **DHT11** sensor.
   
2. **Motor Testing**
   - Includes initial tests for motor control.
   - Likely motor types:
     - **Servo Motors**
     - **DC Motors**
     - **Stepper Motors**
   - Specific motor test code will be added once the motor type is selected.

3. **Wi-Fi Module Testing**
   - Tests Wi-Fi connectivity using the **ESP32** module (commonly used in the project).
   - Configures the module to connect to a specified Wi-Fi network and verifies the connection.

---

## **File Descriptions**
### `test_dht_sensor.ino`
- Description: Tests the temperature and humidity sensors using the DHT library.
- Key Notes:
  - Compatible with the **DHT11** sensor.
  - Replace the pin and library configuration if another sensor type is used.

### `test_dc_motor.ino`
- Description: Provides basic control for **DC Motors**.
- Key Notes:
  - Demonstrates forward and reverse rotation and stop functionality.
  - Requires a motor driver (e.g., L298N or H-Bridge).

### `test_esp32_wifi.ino`
- Description: Tests Wi-Fi connectivity for the **ESP32** module.
- Key Notes:
  - Configures the ESP32 to connect to a specified Wi-Fi network.
  - Outputs connection status and IP address on the Serial Monitor.

---

## **Usage**
1. **Sensor Testing**:
   - Connect the temperature and humidity sensor (e.g., DHT11) to the Arduino.
   - Upload `test_dht_sensor.ino` to verify readings on the Serial Monitor.

2. **Motor Testing**:
   - Connect a DC motor and motor driver to the Arduino.
   - Upload `test_dc_motor.ino` to test motor operation.

3. **Wi-Fi Testing**:
   - Connect the ESP32 module to the Arduino.
   - Upload `test_esp32_wifi.ino` to test Wi-Fi connectivity.

---

## **Contributors**
- [Aelaf Tsegaye / Software Engineering Team ]
- [Smart Egg Incubator]
- [12/10/2024]

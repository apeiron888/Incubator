#include "DHT.h"
// Pin where the sensor is connected
#define DHTPIN 2
#define DHTTYPE DHT11

DHT dht(DHTPIN, DHTTYPE);

void setup() {
    Serial.begin(9600); // Serial communication at 9600 baud
    dht.begin();
}
void loop() {
    float temp = dht.readTemperature();
    float hum = dht.readHumidity();

    if (isnan(temp) || isnan(hum)) {
        Serial.println("Failed to read from DHT sensor!");
        return;
    }
    Serial.print("Temperature: ");
    Serial.print(temp);
    Serial.print("°C, Humidity: ");
    Serial.print(hum);
    Serial.println("%");
    delay(2000); 
}
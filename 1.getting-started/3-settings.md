# Settings
Constants can be used to define (and override) several configuration settings.
The software will run without any settings, but it is highly recommended to at
least change the device name and network type: (ethernet, wifi, esp).

A typical minimal configuration contains a:
* **DEVICE_NAME**: Used when publishing metrics to Serial and/or the MQTT
  topics. The topic name will be: *device_name/peripheral_name/metric*.
  The max length of the device name by default is 50 characters and can be
  changed with the setting: *PERIPHERAL_MAXLENGTH_DEVICE_NAME* (see the
  page [Memory Usage](/2.documentation/memory-usage.html) for more
  information).
* **NETWORK_TYPE**: The hardware used for networking. Choose **0 = None**,
  **1 = Ethernet**, **2 = Wifi** or **3 = ESP01**. 

### Network
The **NETWORK_TYPE** setting defines if network is available and what type of
hardware is used. In case there is a network present the following settings are
available to configure the network.
```
// SETTINGS: Network
#define NETWORK_MAC   { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED }    // Mac Address.
#define NETWORK_IP    { 10, 0, 64, 192 }                        // IP Address. Leave undefined to use DHCP (@todo)
#define NETWORK_DNS   { 8, 8, 8, 8 }                            // DNS Server. Leave undefined to use DHCP (@todo)
#define NETWORK_GW    { 10, 0, 64, 1 }                          // Gateway. Leave undefined to use DHCP (@todo)

// SETTINGS: Wifi
#define WIFI_SSID     "YourNetworkName"
#define WIFI_PASSWORD "YourNetworkPassword"
```

### MQTT
Configure the settings below to publish metrics to a MQTT server. 
```
// SETTINGS: Mqtt
#define MQTT_SERVER   { 10, 0, 64, 107 }                        // MQTT Server IP to connect to
#define MQTT_PORT     1883                                     // MQTT Server Port
#define MQTT_USER     "YourMqttUser"                            // MQTT Username
#define MQTT_PASSWORD "YourMqttPassword"                        // MQTT Password
```

### Serial
The serial port is mostly used for debugging as it should primarily communicate
through MQTT.
```
// SETTINGS: Serial
#define SERIAL_ENABLED  1
#define SERIAL_BAUDRATE 115200
```

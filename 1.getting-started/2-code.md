# Code
The code below shows a minimal sketch. A minimal sketch requires to implement the *iothingy_peripherals()* method which
instantiates one or more peripherals. A device can have one or more peripherals connected to it. A peripheral consists
out of one or more sensors and/or actuators that together form a conceptual thing. It contains a tiny bit of logic
regarding how to wire the input and output. 

The example below shows a device with 3 peripherals: 1 motion light detector and 2 plants. The motion light detector
uses a standard analog peripheral. For more information about the plant peripheral have a look at the
[Tutorial](/3.tutorial/).

```c

// SETTINGS
#define DEVICE_NAME   "garden"         // A unique device name, which is part of the MQTT topic
#define NETWORK_TYPE  1                // Network type: 0 = None, 1 = Ethernet, 2 = Wifi, 3 = ESP01

// Libraries
#include <iothingy.h>

// Project specific peripherals
#include "./plant.h"

void iothingy_peripherals() {
  /**
   * Generic analog input device which can switch a output pin when a threshold
   * has been reached.
   * - Peripheral name
   * - Analog sensor pin (for example: light sensor or distance sensor)
   * - Digital output pin (for example: relay to switch a light on/off)
   * - Threshold (0-1023)
   * - Duration (ms)
   */
  analog( "motion_light", A0, 3, 400, 1000 );

  /**
   * Plant peripheral: measure moisture level and optionally control a pump.
   * - Peripheral name
   * - Moisture sensor pin
   * - Pump relay pin
   * - Threshold (0-1023)
   * - Duration (ms)
   */
  //     Name      Moisture Pump  Threshold Duration
  plant( "plant1", A1,      4,    400,      1000 );
  plant( "plant2", A2,      5,    400,      2000 );
}
```


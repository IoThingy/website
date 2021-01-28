---
sort: 2
---

# Tutorial
The tutorial will explain how to write your own peripherals. 
* [Reading sensors](/tutorial/reading-sensors)
* [Controlling actuators](/tutorial/controlling-actuators)
* [Using timers](/tutorial/using-timers)

## Example project
The example used within this tutorial is based upon the
[garden project](https://github.com/dirkengels/iothingy-garden), which also
serves as one of the initial use cases for the iothingy framework. The garden
project monitors the moisture level of one or more plants and water them when
a certain threshold is reached by enabling a pump for some time period.
Optionally it can have a button to manually enable the pump.


## Sensors & Actuators
The project controls watering plants automatically by reading a moisture sensor
and when a certain threshold is reached enable a pump for a certain amount of
time. The peripheral *plant* consist out of one moisture level sensor and one
actuator (relay with a pump connected to it). A device can have one or more
plants connected to it. It contains a little bit of logic (when to enable the
pump and for how long). By having the input sensor and output actuator defined
in the same peripheral it will also run properly when no there is network
connectivity. 


## Variables
The example will use 3 simple variables to store the pin numbers of the
moisture sensor, relay to control the pump and the button to manually enable
the pump. Three complex variables are used to store the value read by the
analog moisture sensor, the threshold when it should trigger the pump and the
time to keep the pump running. It also uses the two timers to keep track of
when the pump was started and another one for keeping track when it was last
watered. The second timer causes the pump to be enabled only for a short amount
of time before it can be re-enabled. (See the section
[Memory Usage](/2.documentation/memory-usage) for more information about how
memory is used and how to optimize it for your use case).

## Usage
```c
void iothingy_peripherals() {
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

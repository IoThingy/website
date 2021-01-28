# Process flow
The **IoThingy** framework will call a couple of methods per defined peripheral
every iteration. Each peripheral must have a constructor method. Next the
framework will call the *&lt;name&gt;_read_input_pins*, *&lt;name&gt;_set_output_pins*,
*&lt;name&gt;_parse_command and *&lt;name&gt;_publish_metrics* methods.


## Initialisation
```mermaid
sequenceDiagram
    participant I as iothingy
    participant P as <name>
    participant B as peripheral
    I->>P: <name>()
    P->>B: peripheral_register()
    B->>P: slot_id (int8_t)
    P->>B: peripheral_set_pin_mode()
```


## Runtime
```mermaid
sequenceDiagram
    participant I as iothingy
    participant P as <name>
    participant B as peripheral
    I->>P: <name>_read_input_pins()
    I->>P: <name>_set_output_pins()
    I->>P: <name>_parse_command()
    I->>P: <name>_publish_metrics()
    P->>B: peripheral_publish_metric_int()
    P->>B: peripheral_publish_metric_float()
```
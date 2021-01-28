# Memory usage
Memory is allocated for every peripheral slot. By default a peripheral has 8
simple variables (int8_t), 4 complex variables (struct of int32_t, float or
bool) and 2 timers variables (unsigned long). These variables can be used to
store input/output pins, its current state and other parameters.

Memory in micro controllers is often scarce. The following settings can be used
to alter the memory footprint of the peripheral data structure.

* **PERIPHERAL_MAXLENGTH_DEVICE**: The max length of a device name in bytes.
* **PERIPHERAL_MAXLENGTH_NAME**: The max length of a peripheral name in bytes.
* **PERIPHERAL_MAXSIZE**: Number of peripherals.


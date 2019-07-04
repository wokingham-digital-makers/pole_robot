# Digital Hardware Proposals

A breakdown of computing hardware choices for controlling the pole robot.

## Raspberry Pi

### Pros

- Multiple programs can be run at once

- Large amount of RAM compared to most microcontrollers

- Multiple form factors and specs available

- Compute Module designed for custom applications

- Easy to read/write log and config files

### Cons

- High power consumption compared to microcontrollers

- Difficult to power down safely

- not 5V tolerant

## ESP32

### Pros

- Various levels of sleep mode to preserve power

- Wifi and Bluetooth built-in

### Cons

- Can draw a lot of current when transmitting

## Omega Onion2/s

### Pros

- OpenWRT

- Cheaper than ESP32

- Arduino compatible

### Cons

- Very low space available for apps, requires SD

## Nvidia Jetson Nano

### Pros

- Built for AI

- Compute module form factor

### Cons

- Expensive
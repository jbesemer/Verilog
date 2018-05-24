// receive any spec'd packet from firmware (SPI Slave)

`include "reader.v"

module receiver( sclk, enable, mosi, miso );
input sclk, enable, mosi, miso;

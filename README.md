
# BMSLV_1_1
Overview

This project implements the Low Voltage Battery Management System (BMS-LV) for a Formula Student electric vehicle. The firmware runs on a PIC32MX795F512L microcontroller and is responsible for monitoring battery parameters, managing safety states, and communicating with other vehicle systems.

The system architecture combines:

MPLAB Harmony for peripheral initialization

FreeRTOS as the real-time operating system

Finite State Machines (FSM) for deterministic system behaviour

The goal is to create a robust, modular, and real-time capable firmware architecture suitable for automotive and motorsport environments.

-----------------------------------------------------------------
Development Environment

The project has been developed using the following tools:

MPLAB X IDE: v6.30

Compiler: XC32 v5.00

Device Family Pack: PIC32MX_DFP v1.6.369

Microcontroller: PIC32MX795F512L

Hardware peripherals are initially configured using MPLAB Harmony Configurator (MHC).

-----------------------------------------------------------------
RTOS Integration

Although MPLAB provides a FreeRTOS extension, it does not currently work reliably for this configuration. Therefore FreeRTOS has been integrated manually into the project.

The kernel used is the official FreeRTOS distribution available on GitHub:

https://github.com/FreeRTOS/FreeRTOS-Kernel

PIC32MX devices are fully supported by the FreeRTOS kernel, which allows stable real-time task scheduling on the platform.

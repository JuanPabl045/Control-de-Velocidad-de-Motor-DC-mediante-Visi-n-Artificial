# Control de Velocidad de Motor DC mediante Visión Artificial

Este repositorio contiene el código y la documentación de un sistema de control de motores DC basado en visión por computadora. El sistema detecta la posición de la mano a través de una cámara web, procesa la imagen y envía comandos mediante comunicación serial a un ESP32, el cual ajusta la velocidad del motor modificando la señal PWM.

<div align="center">
  <img src="ruta/a/tu/demo.gif" width="600" alt="Demostración del control del motor" />
  <p><i>Demostración del control de velocidad usando la posición de la mano.</i></p>
</div>

## Arquitectura del Proyecto

El sistema está dividido en dos etapas principales (Control y Potencia):

1. **Software (Visión Artificial y Control):** 
   Desarrollado en Java utilizando **OpenCV** para el procesamiento de imágenes y seguimiento. Los datos calculados se envían al microcontrolador a través de la librería **jSerialComm**.
2. **Hardware (Microcontrolador y Potencia):** 
   Un **ESP32** recibe los comandos vía puerto serial y genera la señal PWM correspondiente. Para aislar la etapa de control de la etapa de potencia, se utiliza un transistor de nivel lógico, permitiendo el manejo seguro del motor DC.

## Requisitos

### Hardware
* Microcontrolador ESP32.
* Motor DC.
* Transistor MOSFET de nivel lógico (ej. IRLZ44N, TIP120) o módulo driver.
* Fuente de alimentación independiente para el motor.
* Cámara web.

### Software
* **JDK 11+** (recomendado JDK 17).
* **Gradle** (el proyecto incluye el wrapper).
* **OpenCV 4.8.0** (binarios incluidos en `opencv/build/java/`).
* **jSerialComm 2.9.3** (gestionado vía Gradle).
* 
<div align="center">
	<img width="654" height="368" alt="20251113_235453(1)" src="https://github.com/user-attachments/assets/a39b44fe-b36a-41a0-a2c8-70c4ed937659" />
	<img width="654" height="368" alt="20251113_235551" src="https://github.com/user-attachments/assets/acfe3974-f269-4e3a-8ec5-0c8edf81d33b" />

  <p>Implementación básica</p>
</div>

## Instalación y Ejecución


### 1. Preparar el Microcontrolador
Carga el firmware en el ESP32 (código en C incluido en el repositorio) y conecta el circuito según el diagrama. Toma nota del puerto COM asignado al ESP32.

### 2. Ejecutar la aplicación de Visión (PC)
Desde Windows, abre una terminal en la raíz del proyecto. El método recomendado para compilar y ejecutar es usar Gradle:

```bash
./gradlew run


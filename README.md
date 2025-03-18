# DC-OFDM

DC-OFDM implementation on Matlab/Simulink, for HDL Coder generation.

Matlab R2024a

Vivado 2024.1

## Cambio respecto del estándar IEEE 802.15.13

El bloque de Matlab [LDPC Encoder](https://la.mathworks.com/help/wireless-hdl/ref/ldpcencoder.html) solamente recibe matrices "dual diagonal". Las matrices del estándar fueron modificadas para que sean reconocidas por este bloque de la siguiente forma:

* En la primer columna de la matriz cuadrada de paridad, formada por "0", "-1" y dos veces un número "x", se ubica el número "x" en la primera y última fila.

* En la segunda columna de la matriz cuadrada de paridad, se reemplaza el número "x" de la última fila por un "-1".

![Double diagonal matrix](images/double_diagonal.png)

Ademas:

* En "payload full", el subsistema "fec_rate_to_number", devuelve un "2" constante.

* LDPC encoder solamente soporta code rate "1/2".

* Repetition para el payload no está soportado.

* Puncturing para el payload no está soportado.

# CodingSamples
These are some of my coding samples from engineering courses I have taken or help created.  I have attached assignments from two different courses, Advanced Gas Dynamics (AE510) and Viscous Flow (TAM532). I have also attached an assignment I designed with other teaching assistants for an introductory programming class for college freshmen (CS105).


## AE510
The goal of this assignment was to solved the steady-state flowfield of a converging-diverging nozzle using MacCormack's method.  MacCormack's method involves using a "predictor" step and a "corrector" step, which are programmed into two separate functions.  The main file is named AE510_MaCormack.m.

The algorithm for MacCormack's method is listed as followed:

1. Set fixed values for flow-field properties (density, pressure, temperature, and velocity) at nozzle inlet.
2. Initialize the flow-field property values at exit with certain constant values.
3. Linearly interpolate the flow-field property values in the middle of the nozzle.
4. Calculate the predictor values.
5. Calculate the corrector values, and store these in vectors.
6. Loop through enough iterations until values converge, in this case, I looped through 500 iterations.


## TAM532
The goal of this assignment was to calculate the development of a laminar shear layer for fluids with different properties.  BlasiusFunc is fed into the MATLAB ode45 integrator for integration.  The main file is name TAM532_ShearLayer.m.


## CS105
The index.html file prompts the user to enter a 9-letter word in random order, and it will sort through the words provided by the word bank in words.js to find a match.

The algorithm for word matching is listed as followed:

1. Split the user inputted word into individual letters.
2. Sort the user inputted word by alphabetical order.
3. Select a word from the dictionary file.
4. Split the dictionary word into individual letters.
5. Sort the dictionary word by alphabetical order.
6. Compare the input word and dictionary word letter by letter.
7. If all letters match, we have found the word. If not, loop to the next word in the dictionary.

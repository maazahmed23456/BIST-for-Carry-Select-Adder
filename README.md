# BIST for Carry Select Adder
Design of a Built In Self Test architecture for fault analysis and fault diagnosis of a Carry Select Adder

## A Glance at the BIST Architecture

Built-In Self-Test (BIST) is a vital testing architecture in VLSI systems, designed to enhance the reliability and testability of complex integrated circuits (ICs). It embeds test generation, application, and response analysis mechanisms directly within the chip, enabling autonomous testing without external hardware. A typical BIST architecture consists of key components: a Test Pattern Generator (TPG) for creating deterministic or pseudorandom test vectors, a Circuit Under Test (CUT), a Response Analyzer (RA) for comparing the output responses against expected patterns, and a BIST controller to orchestrate these operations. Linear Feedback Shift Registers (LFSRs) are commonly used as TPGs due to their simplicity and efficiency in generating pseudorandom patterns. BIST reduces dependency on external Automatic Test Equipment (ATE) and is particularly effective in detecting manufacturing defects and ensuring in-field fault diagnosis. Its implementation is essential for complex systems, including memory (MBIST) and logic (LBIST), enabling low-cost and high-speed testing while supporting Design for Testability (DFT) methodologies.

- Test Patter Generator (TPG)
- Circuit Under Test (CUT)
- Test Controller
- Compactor
- Signature Analyzer

## Base Paper

This project was inspired by the work of following paper, who designed a BIST architecture for a Carry Select Adder, refer to the following paper:

Solanki, Garima & Agarwal, Sourav & Mishra, Tushar & Khandelwal, Vansh. (2024). Design and Implementation of BIST logic for High Speed and Energy Efficient Carry Select Adder(CSLA). 1-5. 10.1109/ICSTSN61422.2024.10670853. 


## Block Diagram of BIST 

 <p align="center">
  <img width="800" height="500" src="/BIST SCHEMATICS AND WAVEFORMS/BLOCK.jpg">
</p>


## Schematic of BIST without fault

 <p align="center">
  <img width="800" height="500" src="/BIST SCHEMATICS AND WAVEFORMS/WITHOUT FAULT SCHEMATIC.png">
</p>

This module is used to generate the signature

## Simulation of BIST without fault

 <p align="center">
  <img width="800" height="500" src="/BIST SCHEMATICS AND WAVEFORMS/WITHOUT FAULT SIMULATION.png">
</p>

After 2^n - 1 clock cycle which in this case is 2047 , the **Signature** is obtained as **13** in hexadecimal

## Schematic of BIST with fault

 <p align="center">
  <img width="800" height="500" src="/BIST SCHEMATICS AND WAVEFORMS/WITH FAULT SCHEMATIC.png">
</p>

In this module SA0 fault is modelled at a input in the schematic

## Simulation of BIST with fault

 <p align="center">
  <img width="800" height="500" src="/BIST SCHEMATICS AND WAVEFORMS/WITH FAULT SIMULATION.png">
</p>

- We can observe that after inserting a SA0 at a input , the obtained signature value **27** doesnt match with the golden signature **13**
- This shows the presence of fault in the CSA which needs to be corrected. 


***************



## Future Work

- Design similar BIST architecture for any other arithmetic modules which can be done just by replacing the CSA module and adjusting the input sizes

## Contributors 

- **Maaz Ahmed**  

## Acknowledgments


- Dr.Ediga Raghuveera , AdHoc Faculty , NIT AP (mentor)
- Dr.Kiran Kumar Gurrala , Assistant Professor , NIT AP
- Dr.Puli Kishore Kumar , Assistant Professor , NIT AP
- Harika Banala , PhD , NIT AP

## Contact Information

- Shaik Maaz Ahmed , maazahmed23456@gmail.com



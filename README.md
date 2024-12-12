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

This project was inspired by the work of **D.M. Ellaithy**, who designed a low-power 8-bit SAR ADC for medical devices. For a detailed description of the ADC design, refer to the following paper:

Ellaithy, D.M. (2024). *A low-power 8-bit 1-MS/s single-ended SAR ADC in 130-nm CMOS for medical devices*. *Journal of Electrical Systems and Information Technology*, 11, 21. [DOI: 10.1186/s43067-024-00147-z](https://doi.org/10.1186/s43067-024-00147-z)


## Block Diagram of the SAR ADC 

 <p align="center">
  <img width="800" height="500" src="/Images/block diagram.png">
</p>




## Circuit Diagram of the Sample and Hold Circuit

 <p align="center">
  <img width="800" height="500" src="/Images/BSC.jpg">
</p>

## Circuit Diagram of the Comparator Circuit

 <p align="center">
  <img width="800" height="500" src="/Images/COMPC.jpg">
</p>

## Circuit Diagram of the SAR

 <p align="center">
  <img width="800" height="500" src="/Images/SARC.jpg">
</p>

## Circuit Diagram of the DAC

 <p align="center">
  <img width="800" height="500" src="/Images/DACC.jpg">
</p>


## Pre-Layout Simulation

###  Transient Analysis of Sample and Hold


 <p align="center">
  <img width="800" height="500" src="/Images/BSS.jpg">
</p>


###  Transient Analysis of Comparator


 <p align="center">
  <img width="800" height="500" src="/Images/COMPS.jpg">
</p>



***************



## Future Work

- Design the remaining SAR logic block and Capactive DAC
- Perfrom prelayout simulation of everythihng together to show working of SAR ADC
- Perform the layout of each components and perfrom post layout simulation and verify , Complete LVS and DRC

1. **Enhance SNDR and SFDR:** Use optimized capacitor sizing and layout to minimize mismatch, enhancing signal-to-noise distortion ratio (SNDR) and spurious free dynamic range (SFDR).

2. **Improve Effective Number of Bits (ENOB):** Design a high-precision, low-offset comparator to increase accuracy, contributing to a higher ENOB.

3. **Reduce Noise:** Implement low-noise reference and power supply management techniques to suppress noise contributions from external sources.

4. **Optimize Switching Energy:** Use advanced DAC switching techniques (e.g., split-capacitor switching) to minimize power consumption and switching noise, crucial for handling low-frequency ECG signals.

5. **Fabricate and Test with Real Signals:** Plan for IC fabrication and real-time testing with ECG signal acquisition to validate performance, ensuring reliable operation in medical applications.

## Contributors 

- **Maaz Ahmed** 
- **Krishna Mouli** 
- **Sandeep** 



## Acknowledgments


- Dr.Ediga Raghuveera , AdHoc Faculty , NIT AP (mentor)
- Dr.Kiran Kumar Gurrala , Assistant Professor , NIT AP
- Dr.Puli Kishore Kumar , Assistant Professor , NIT AP
- Harika Banala , PhD , NIT AP

## Contact Information

- Shaik Maaz Ahmed , maazahmed23456@gmail.com



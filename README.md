# Ngspice example using py4spice package
An ngspice example of a bipolar amplifer using the Python for Spice package: [ngspicehlp](https://github.com/astorguy/py4spice)

# Requirements
* KiCad 7.0 or greater
* Python 3.11 or greater
* py4spice module

# Setup Instructions
1. Download the project to the location of your choice.
1. Install ngspicehlp from PyPI:

`python -m pip install --upgrade py4spice`

3. Change to `bc546_amp-main/python` directory
3. Using a text editor modify the main program: `ngspice_proj.py`
5. Set the locations of the ngspice console executable, the KiCad CLI, and the path to the project. These variable are defined near the beginning of `ngspice_proj.py`

```
NGSPICE_EXE = Path("c:/Program Files/ngspice_39/bin/ngspice_con.exe")
KICAD_EXE = Path("c:/Program Files/KiCad/7.0/bin/kicad-cli.exe")
PROJECT_PATH_ABS = Path("c:/bc546_amp-main")
```

# Explanatory
This example circuit is a bipolar amplifer from the [ngspice website](https://ngspice.sourceforge.io/ngspice-tutorial.html#BipAmp). The schematic has been drawn with KiCad.

The organization of the example provides a structured simulation platform enabling advanced circuit analysis using Python. Let's step through the process.

1. Ngspice analysis is centered upon the input netlist. Traditionally, a single netlist file contains all the information for the simulation. However, our approach separates the top netlist into separate files using `.include` statements. The top level netlist file is named `top.sp` and contains:
```
.title circuit
.include ./models.sp
.include ./stimulus.sp
.include ./supplies.sp
.include ./load.sp
.include ./dut.sp
.include ./control.sp
.end
```
This separates functionality into different files. The file named `dut.sp` represents the *design-under-test (DUT)*.

2. The KiCad schematic represents the DUT.
2. Before running the script change to the `bc546_amp-main/python` directory. Open the script file `ngspice_proj.py` with the text editor of your choice. Near the beginning of the file are three variables that must be set for your unique environment. They are:
* The full path to `kicad-cli.exe`
* The full path to `ngspice_con.exe`
* The full path to the `bc549_amp-main` project
4. You can run the script from a terminal: `python ./ngpsice_proj.py`
4. The first thing the script does is extract and condition a netlist from the KiCad schematic.
4. Next, the analyses for the simulation are defined. For this example, there are four analyses (op, dt, tr, ac).
4. The control section is defined.
4. With everything defined, a simulation object is created and executed.
4. After the simulation is completed, the results are converted to Pandas DataFrames. ***This achieves our goal!*** Now the data can be easily manipulated with standard Python practices.
4. The final section is optional. It shows one way to plot the results using Matplotlib.

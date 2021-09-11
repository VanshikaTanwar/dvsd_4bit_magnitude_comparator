# 4bit_magnitude_comparator(dvsd_cmp) RTL2GDS flow
*The purpose of this project is to produce a clean GDS (Graphic Design System) Final Layout with all details that are used to print photomasks used in the fabrication of a behavioral RTL (Register-Transfer Level) of an 4bit magnitude comparator, using SkyWater 130nm PDK (Process Design Kit)*

# Table of Contents

- [Design](#Design)
- [Pin Configuration](#Pin-Configuration)
- [Pre-layout Simulation](#Pre-layout-Simulation)
- [Openlane Workflow](#Openlane-Workflow)
- [OpenLane ](#OpenLane)
- [OpenLane design stages](#OpenLane-design-stages)
- [Installation](#installation)
	- [Setting OpenLane](#Setting-OpenLane)
	- [Install SKY130 PDK](#Install-SKY130-PDK)
	- [Test](#Test)
	- [Opening OpenLane in Docker](#Opening-OpenLane-in-Docker)
- [Running openlane](#Running-openlane)
- [Magic layout generate](#Magic-layout-generate)
- [Post-layout simulation](#Post-layout-simulation)
- [Key points to Remember](#key-points-to-remember)
- [Area of improvement](#area-of-improvement)
- [References](#references)
- [Acknowledgement](#acknowledgement)
- [Author](#author)


## Design 
![image](https://user-images.githubusercontent.com/72103059/131217008-17426cb3-be4f-4e20-8f26-4ac60d539853.png)

## Pin Configuration

![image](https://user-images.githubusercontent.com/72103059/131216539-316d28b8-1fec-453d-a433-4a5d76909d22.png)

## Pre-layout Simulation

This is how you can simulate your design.

![pre_simulation_analysis](https://user-images.githubusercontent.com/72103059/130665947-3c5a53a2-b16a-4967-830f-0d05666ee605.png)

Pre-layout simulation waveform
![pre_gtkwave(3)](https://user-images.githubusercontent.com/72103059/130666317-a68d77f7-903c-40bf-a39d-03cc8cb1c178.png)

# Openlane Workflow

## OpenLane 

OpenLane is an automated RTL to GDSII flow based on several components including OpenROAD, Yosys, Magic, Netgen, Fault and custom methodology scripts for design exploration and optimization.
For more information check [here](https://openlane.readthedocs.io/)

![openlane flow 1](https://user-images.githubusercontent.com/80625515/130246106-18f73ccc-e8e1-4061-a1b0-8c14bdf711f1.png)

### OpenLane design stages

1. Synthesis
	- `yosys` - Performs RTL synthesis
	- `abc` - Performs technology mapping
	- `OpenSTA` - Performs static timing analysis on the resulting netlist to generate timing reports
2. Floorplan and PDN
	- `init_fp` - Defines the core area for the macro as well as the rows (used for placement) and the tracks (used for routing)
	- `ioplacer` - Places the macro input and output ports
	- `pdn` - Generates the power distribution network
	- `tapcell` - Inserts welltap and decap cells in the floorplan
3. Placement
	- `RePLace` - Performs global placement
	- `Resizer` - Performs optional optimizations on the design
	- `OpenDP` - Perfroms detailed placement to legalize the globally placed components
4. CTS
	- `TritonCTS` - Synthesizes the clock distribution network (the clock tree)
5. Routing
	- `FastRoute` - Performs global routing to generate a guide file for the detailed router
	- `CU-GR` - Another option for performing global routing.
	- `TritonRoute` - Performs detailed routing
	- `SPEF-Extractor` - Performs SPEF extraction
6. GDSII Generation
	- `Magic` - Streams out the final GDSII layout file from the routed def
	- `Klayout` - Streams out the final GDSII layout file from the routed def as a back-up
7. Checks
	- `Magic` - Performs DRC Checks & Antenna Checks
	- `Klayout` - Performs DRC Checks
	- `Netgen` - Performs LVS Checks
	- `CVC` - Performs Circuit Validity Checks

### Installation

#### Preferred Prerequisites

- Preferred Ubuntu OS)
- Docker 19.03.12+
- GNU Make
- Python 3.6+ with PIP
- Click, Pyyaml: `pip3 install pyyaml click`

## Setting OpenLane
![Screenshot from 2021-08-20 23-48-09](https://user-images.githubusercontent.com/72103059/130276762-69de11f4-4939-4e3c-ab17-bf02511f3042.png)


```sh
git clone https://github.com/efabless/openlane.git openlane
cd openlane 
make openlane 
make pdk

```
## Install SKY130 PDK 

```sh

export PDK_ROOT=<absolute path to where skywater-pdk and open_pdks will reside>
```       
Installed and add this configuration variable
```sh
export STD_CELL_LIBRARY=<Library name>
```       
the library names is one of:

- sky130_fd_sc_hd
- sky130_fd_sc_hs
- sky130_fd_sc_ms
- sky130_fd_sc_ls
- sky130_fd_sc_hdll
       
       
you can install all SKY130  
```sh

make full-pdk
```       
 

## Test

On successful completion of previous step, lets test it by

```sh

make test
```

which shall display the "successful" message. 

> **Note:** Go to next steps only after having the **successful test**.

**Next steps**

## Opening OpenLane in Docker

If docker is installed, if you can see the docker version 19.* and above then docker is present and go to next step else install docker manually

```sh
docker --version


```

you can install docker file following this link 

https://docs.docker.com/engine/install/

##  Running openlane

Once you are sure the docker is present, you have to make mount of the current files in **openlane**

```sh
make mount

```
![T-1](https://user-images.githubusercontent.com/72103059/130253604-7a5e19f0-ce8b-4cce-a1a2-22f42684287b.png)

Now lets test a design which is already present in `openlane/designs` type 
The following directory of design where the design is present is :
'vsdflow/work/tools/openlane_working_dir/openlane/designs/dvsd_cmp'


```sh
bash-4:$

./flow.tcl -design dvsd_cmp -tag vanshika_4bit_magnitude_comparator

```
![Screenshot from 2021-08-20 21-04-37](https://user-images.githubusercontent.com/72103059/130257853-c3fa439b-62a2-473c-bf85-9dc98b01542d.png)



which shall display the "successful" message after running all the respective tasks. 
![T-20_successful](https://user-images.githubusercontent.com/72103059/130254369-d9112e33-d50c-4028-9c2a-1e8dba499c0d.png)


##  Magic layout generate 
For magic layout generation in magic tool write this in terminal where you ran the above process

```sh
bash-4:$

magic dvsd_cmp.mag


```

Zoom-in view of IP Layout of dvsd_cmp design in Magic Tool.
![dvsd_cmp_magic_layout(1)](https://user-images.githubusercontent.com/72103059/130252784-d6a24a18-8b96-4bbc-874d-b9ff98215e30.png)

Zoom-out view of IP Layout of dvsd_cmp design in Magic Tool.
![dvsd_cmp_magic_layout](https://user-images.githubusercontent.com/72103059/130258107-6887d9b8-3f86-4420-b840-66234458f158.png)

##  Post-layout simulation 
command for post-layout simulation 
![post_simulation_analysis](https://user-images.githubusercontent.com/72103059/130666627-12de80a3-43c8-42b2-acaf-e94a7e83dc17.png)

Post-layout simulation waveform
![Screenshot from 2021-08-28 18-17-25](https://user-images.githubusercontent.com/72103059/131218402-ee6e955d-0455-4064-97d9-fe1d9ad63f00.png)




## Key points to Remember

- Keep the top module name and design name always same, else errors would come in the design.

## Area of improvement

- To perform spice simulation of the final GDS layout.

## References

- [GitLab/OpenLane workshop](https://gitlab.com/gab13c/openlane-workshop)
- [The OpenROAD Project/OpenLane](https://github.com/The-OpenROAD-Project/OpenLane)
- Ahmed Ghazy and Mohamed Shalan, "OpenLane: The Open-Source Digital ASIC Implementation Flow", Article No.21, Workshop on Open-Source EDA Technology (WOSET), 2020. [Paper](https://github.com/woset-workshop/woset-workshop.github.io/blob/master/PDFs/2020/a21.pdf)
- [YOUTUBE/OpenLane Overview](https://www.youtube.com/watch?v=d0hPdkYg5QI)
- [GitHUB/openlane_build_script](https://github.com/nickson-jose/openlane_build_script)
- [GitLab/OpenLANE-Sky130-Physical-Design-Workshop](https://github.com/ripudamank2/OpenLANE-Sky130-Physical-Design-Workshop)

## Acknowledgement

- [Kunal Ghosh](https://github.com/kunalg123), Founder, VSD Corp. Pvt. Ltd

## Author

- [Vanshika Tanwar](https://github.com/vanishka-tanwar), Bachelor of Technology in Electronics & Communication Engineering,Dronacharya Group of Institutions,Greater Noida, U.P.
 

# DDR Controller for Cyclone II

# Vorbereitung
* Micron MT46V16M16TG-6T zu altera/13.0sp1/ip/altera/ddr_ddr2_sdram/constraints/memory_types.dat hinzufügen.<br>
Siehe [memory_types.dat](./ddr_ctl_dokumentation/memory_types.dat) <br>
Alternativ: Micron MT46V16M16TG-5B verwenden. 

* dq[15:] ist an Bank 4 angeschlossen, das lässt sich aber nicht in Megawizard auswählen.
Deswegen eine Bank 4TL zu altera/13.0sp1/ip/altera/ddr_ddr2_sdram/constraints/dat/ep2c35_f484_x8_v02.dat hinzufügen.<br>
Siehe [ep2c35_f484_x8_v02_4TL.dat](./ddr_ctl_dokumentation/ep2c35_f484_x8_v02_4TL.dat)<br>
altera/13.0sp1/ip/altera/ddr_ddr2_sdram/constraints/dat/ep2c35_f484_x8_floorplan_v00.dat ändern:<br>
![floorplan.png](./ddr_ctl_dokumentation/floorplan.png)<br>

# Projekt erstellen
Folge Altera Application Note 380 [Test DDR or DDR2 SDRAM Interfaces on Hardware Using the Example Driver]<br>
* Erstelle Quartus Project<br>
* Tools→Megawizard Plugin Manager→Create a new custom megafunction variation→DDR SDRAM Controller v13.0<br>
* Parameterize <br>
![ddr_ctl_0.png](./ddr_ctl_dokumentation/ddr_ctl_0.png)<br>
![ddr_ctl_1.png](./ddr_ctl_dokumentation/ddr_ctl_1.png)<br>
![ddr_ctl_2.png](./ddr_ctl_dokumentation/ddr_ctl_2.png)<br>
![ddr_ctl_3.png](./ddr_ctl_dokumentation/ddr_ctl_3.png)<br>
![ddr_ctl_4.png](./ddr_ctl_dokumentation/ddr_ctl_4.png)<br>
![ddr_ctl_5.png](./ddr_ctl_dokumentation/ddr_ctl_5.png)<br>
![ddr_ctl_6.png](./ddr_ctl_dokumentation/ddr_ctl_6.png)<br>

* Constraints <br>
![ddr_ctl_constraints.png](./ddr_ctl_dokumentation/ddr_ctl_constraints.png)<br>

* ddr_proj.vhd zum Projekt hizufügen <br>
![ddr_prj_vhd.png](./ddr_ctl_dokumentation/ddr_prj_vhd.png)<br>

* PLL ändern <br>
Tools→Megawizard Plugin Manager→Edit an existing custom megafunction variation <br>
![ddr_ctl_pll_0.png](./ddr_ctl_dokumentation/ddr_ctl_pll_0.png)<br>
Frequenz auf 25 Mhz stellen→Finish→Finish<br>
![ddr_ctl_pll_1.png](./ddr_ctl_dokumentation/ddr_ctl_pll_1.png)<br>
* Pins einstellen<br>
Tools→Tcl Scripts… → ddr_proj.tcl<br>
# Literatur
* Datenblatt Micron MT46V16M16 – 4 Meg x 16 x 4 banks
* Altera Application Note 380 Test DDR or DDR2 SDRAM Interfaces on Hardware Using the Example Driver
* Altera Application Note 361 Interfacing DDR & DDR2 SDRAM with Cyclone II Devices
* Altera Cyclone II Device Handbook, Volume 1 Chapter 9. External Memory Interfaces




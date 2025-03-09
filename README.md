# DDR Controller for Cyclone II Cisco-HWIC-3G board
english version below

# Vorbereitung
* Micron MT46V16M16TG-6T zu altera/13.0sp1/ip/altera/ddr_ddr2_sdram/constraints/memory_types.dat hinzufügen.<br>
Siehe [memory_types.dat](./ddr_ctl_dokumentation/memory_types.dat) <br>
Alternativ: Micron MT46V16M16TG-5B verwenden. 

* dq[15:0] sind an Bank 4 angeschlossen, das lässt sich aber nicht in Megawizard auswählen.
Deswegen eine Bank 4TL zu altera/13.0sp1/ip/altera/ddr_ddr2_sdram/constraints/dat/ep2c35_f484_x8_v02.dat hinzufügen.<br>
Siehe [ep2c35_f484_x8_v02_4TL.dat](./ddr_ctl_dokumentation/ep2c35_f484_x8_v02_4TL.dat)<br>
In altera/13.0sp1/ip/altera/ddr_ddr2_sdram/constraints/dat/ep2c35_f484_x8_floorplan_v00.dat "4TL" zu bytegroup_name hinzufügen:<br>
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

# SignalTap<br>
Für SignalTap TalkBack aktivieren<br>
Tools→Options→Internet Connectivity→TalkBack Options<br>
Haken bei "Enable sending TalkBack data to Altera", auf OK klicken<br>
Auf OK klicken<br>

# Literatur
* Datenblatt Micron MT46V16M16 – 4 Meg x 16 x 4 banks
* Altera Application Note 380 Test DDR or DDR2 SDRAM Interfaces on Hardware Using the Example Driver
* Altera Application Note 361 Interfacing DDR & DDR2 SDRAM with Cyclone II Devices
* Altera Cyclone II Device Handbook, Volume 1 Chapter 9. External Memory Interfaces


# English version

# Preparations
* Add Micron MT46V16M16TG-6T to altera/13.0sp1/ip/altera/ddr_ddr2_sdram/constraints/memory_types.dat.<br>
See [memory_types.dat](./ddr_ctl_dokumentation/memory_types.dat) <br>
Or use Micron MT46V16M16TG-5B. 

* dq[15:0] are connected to bank 4, but you can not select these in Megawizard.
Add bank 4TL to altera/13.0sp1/ip/altera/ddr_ddr2_sdram/constraints/dat/ep2c35_f484_x8_v02.dat.<br>
See [ep2c35_f484_x8_v02_4TL.dat](./ddr_ctl_dokumentation/ep2c35_f484_x8_v02_4TL.dat)<br>
Add "4TL" to bytegroup_name in altera/13.0sp1/ip/altera/ddr_ddr2_sdram/constraints/dat/ep2c35_f484_x8_floorplan_v00.dat:<br>
![floorplan.png](./ddr_ctl_dokumentation/floorplan.png)<br>

# Create project
Just follow Altera Application Note 380 [Test DDR or DDR2 SDRAM Interfaces on Hardware Using the Example Driver]<br>
* Create Quartus project<br>
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

* Add ddr_proj.vhd to project<br>
![ddr_prj_vhd.png](./ddr_ctl_dokumentation/ddr_prj_vhd.png)<br>

* Change PLL<br>
Tools→Megawizard Plugin Manager→Edit an existing custom megafunction variation <br>
![ddr_ctl_pll_0.png](./ddr_ctl_dokumentation/ddr_ctl_pll_0.png)<br>
Set frequency 25 Mhz→Finish→Finish<br>
![ddr_ctl_pll_1.png](./ddr_ctl_dokumentation/ddr_ctl_pll_1.png)<br>
* Set Pins<br>
Tools→Tcl Scripts… → ddr_proj.tcl<br>


# SignalTap<br>
Aktivate TalkBack for SignalTap<br>
Tools→Options→Internet Connectivity→TalkBack Options<br>
Check "Enable sending TalkBack data to Altera", click OK<br>
Click OK<br>

# Literature
* Datenblatt Micron MT46V16M16 – 4 Meg x 16 x 4 banks
* Altera Application Note 380 Test DDR or DDR2 SDRAM Interfaces on Hardware Using the Example Driver
* Altera Application Note 361 Interfacing DDR & DDR2 SDRAM with Cyclone II Devices
* Altera Cyclone II Device Handbook, Volume 1 Chapter 9. External Memory Interfaces


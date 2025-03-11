# DDR Controller for Cyclone II <br> (Cisco-HWIC-3G board)<br>
english version below

# Vorbereitung
* Micron MT46V16M16TG-6T zu altera/13.0sp1/ip/altera/ddr_ddr2_sdram/constraints/memory_types.dat hinzufügen.<br>
Siehe [memory_types.dat](./ddr_ctl_dokumentation/memory_types.dat) <br>
Alternativ: Micron MT46V16M16TG-5B verwenden. 

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
![signaltap.png](./ddr_ctl_dokumentation/signaltap.png)<br>
Signal pnf_per_byte sollte `Fh` sein.<br>

Für SignalTap TalkBack aktivieren<br>
Tools→Options→Internet Connectivity→TalkBack Options<br>
Haken bei "Enable sending TalkBack data to Altera", auf OK klicken<br>
Auf OK klicken<br>


# Literatur
* Datenblatt Micron MT46V16M16 – 4 Meg x 16 x 4 banks
* Altera Application Note 380 Test DDR or DDR2 SDRAM Interfaces on Hardware Using the Example Driver
* Altera Application Note 361 Interfacing DDR & DDR2 SDRAM with Cyclone II Devices
* Altera DDR and DDR2 SDRAM Controller Compiler User Guide
* Altera Cyclone II Device Handbook, Volume 1 Chapter 9. External Memory Interfaces


# English version

# Preparations
* Add Micron MT46V16M16TG-6T to altera/13.0sp1/ip/altera/ddr_ddr2_sdram/constraints/memory_types.dat.<br>
See [memory_types.dat](./ddr_ctl_dokumentation/memory_types.dat) <br>
Or use Micron MT46V16M16TG-5B. 

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

![signaltap.png](./ddr_ctl_dokumentation/signaltap.png)<br>
Signal pnf_per_byte should be `Fh`.<br>

Aktivate TalkBack for SignalTap<br>
Tools→Options→Internet Connectivity→TalkBack Options<br>
Check "Enable sending TalkBack data to Altera", click OK<br>
Click OK<br>
Auf OK klicken<br>

# Literature
* Datenblatt Micron MT46V16M16 – 4 Meg x 16 x 4 banks
* Altera Application Note 380 Test DDR or DDR2 SDRAM Interfaces on Hardware Using the Example Driver
* Altera Application Note 361 Interfacing DDR & DDR2 SDRAM with Cyclone II Devices
* Altera DDR and DDR2 SDRAM Controller Compiler User Guide
* Altera Cyclone II Device Handbook, Volume 1 Chapter 9. External Memory Interfaces


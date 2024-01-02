PCB Description

Dwg. : 6089-127-RevA
Name: APOLLO COMMAND MODULE VERSION 3 (CMv3)

Tech Contact: Charlie Strohman
              Wilson Lab
              Cornell University
              Tel: 607-319-1192
              Email: crs5@cornell.edu

Mechanical:
  Size:     179.97 mm x 277.8 mm (Board without assembly rails) 
						216.4 mm x 303.2" (Including assembly rails)
						2.1 mm (nominal thickness)
  Layers:    18
	Rails:     Add min 0.5" rails routed on all 4 sides with "mouse bites".
	           Add 0.125" tooling holes and 0.040" fiducials to rails.
             In design file "FAB_RAILS.ART", areas that must remain open
						 for overhanging parts are noted.

Material:
   Board:  EM-890
   Lead Free: Yes
   Surface Finish: ENIG (Electroplated Nickel, Immersion Gold)
   Solder Mask: Yes, green

Holes (Plated hole sizes are finished diameter, tolerance +/- 3 mils):
   Total:       Cnt: TBD
      Plated:      Cnt: TBD 
      Non-Plated:  Cnt: TBD    
      Vias:        Cnt: TBD  Drill Size: 8 mil
      Backdrilled from bottom:   Cnt: TBD Backdrill Size : 14 mil
			
Copper:
   Min. Trace:   3 mil
   Min. Space:   3 mil
			
Silkscreen (Legend):
   Top Layer:    White
   Bottom Layer: White

Electrical Testing:
   Required (Netlist / Flying Probe)

Controlled Impedance: Yes
         On layers SIG1, SIG2, SIG3, and SIG4
         3.1 mil traces should be 50 ohms
         3.25 mil pairs should be 100 ohms differential
         See Summit Interconnect External Stackup Report Job d3855 Stack-up 02-03-22
				 
Design Files, Board Stackup
  1   TOP.ART    Top Layer Copper
  2   GND1.ART   Ground Plane
  3   SIG1.ART   Signal Copper
  4   GND2.ART   Ground Plane
  5   SIG2.ART   Signal Copper
  6   GND3.ART   Ground Plane
  7   PWR1.ART   Power Plane
  8   PWR2.ART   Power Plane
  9   PWR3.ART   Power Plane and Signals
  10  PWR4.ART   Power Plane and Signals
  11  PWR5.ART   Power Plane
  12  PWR6.ART   Power Plane
  13  GND4.ART   Ground Plane
  14  SIG3.ART   Signal Copper
  15  GND5.ART   Ground Plane
  16  SIG4.ART   Signal Copper
  17  GND6.ART   Ground Plane
  18  BOTTOM.ART Bottom Layer Copper

  MANUFACTURING.ART       Mechanical Details
  FAB_RAILS.ART           Routed out regions of assembly rails
  SOLDERMASK_TOP.ART      Top Soldermask
  SOLDERMASK_BOTTOM.ART   Bottom Soldermask
  SILKSCREEN_TOP.ART      Top Silkscreen
  SILKSCREEN_BOTTOM.ART   Top Silkscreen

  6089-127-Reva_20-1-18.DRL       Excellon Drill Data
  6089-127-Reva_20-bd-18-17.DRL   Excellon Backdrill Data
  6089-127-Reva_20-bd-18-15.DRL   Excellon Backdrill Data
  6089-127-Reva_20-bd-18-6.DRL    Excellon Backdrill Data
  6089-127-Reva_20-bd-18-4.DRL    Excellon Backdrill Data

  6089-119-RevB_08.IPC            IPC365 file
  d3855 Stack-up 02-03-22.pdf     Summit stackup
  README_FAB_6089-127-RevA.TXT    This file

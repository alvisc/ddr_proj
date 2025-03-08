package require ::quartus::project


set project_name ddr_proj
set current_revision [get_current_revision $project_name]


project_open -revision $current_revision $project_name

#SourceList
source ddr_ctl/verify_timing_for_ddr_ctl.tcl
source ddr_ctl/verify_timing_for_ddr_ctl.tcl
#EndSourceList

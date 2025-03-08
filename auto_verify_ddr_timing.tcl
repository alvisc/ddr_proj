package require ::quartus::project


set project_name ddr_proj
set current_revision [get_current_revision $project_name]


project_open -revision $current_revision $project_name

post_message -type warning "Faked verify_timing_for_ddr_ctl"
exit

#SourceList
source ddr_ctl/verify_timing_for_ddr_ctl.tcl
source ddr_ctl/verify_timing_for_ddr_ctl.tcl
#EndSourceList

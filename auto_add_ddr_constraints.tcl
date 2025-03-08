package require ::quartus::project


set project_name ddr_proj
set current_revision [get_current_revision $project_name]


project_open -revision $current_revision $project_name

#SourceList
source ddr_ctl/add_constraints_for_ddr_ctl.tcl
#EndSourceList
set_global_assignment -name PRE_FLOW_SCRIPT_FILE quartus_sh:auto_add_ddr_constraints.tcl -remove
export_assignments

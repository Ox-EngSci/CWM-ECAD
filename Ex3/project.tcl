
set design "Ex3"
set top top
set sim_top top_tb
set device xcvu9p-fsgd2104-2L-e
set proj_dir ./project
set repo_dir ./ip_repo
set project_constraints constraints.xdc


set test_name "test"

# Build project.
create_project -name ${design} -force -dir "." -part ${device}
set_property source_mgmt_mode DisplayOnly [current_project]  
set_property top ${top} [current_fileset]
puts "Creating Project"

create_fileset -constrset -quiet constraints
#add_files -fileset constraints -norecurse ${project_constraints}
#set_property is_enabled false [get_files ${project_constraints}]


read_verilog "top.v"
read_verilog "top_tb.v"

update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

set_property top ${sim_top} [get_filesets sim_1]
set_property include_dirs ${proj_dir} [get_filesets sim_1]
set_property simulator_language Mixed [current_project]
set_property verilog_define { {SIMULATION=1} } [get_filesets sim_1]
set_property -name xsim.more_options -value {-testplusarg TESTNAME=basic_test} -objects [get_filesets sim_1]
set_property runtime {} [get_filesets sim_1]
set_property target_simulator xsim [current_project]
set_property compxlib.compiled_library_dir {} [current_project]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1

launch_simulation
run 600ns

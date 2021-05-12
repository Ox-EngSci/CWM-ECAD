all: clean project

project:
	@echo "Starting synthesis and implementation..."
	@-vivado -mode batch -source project.tcl 
	@grep -i "syntax error" vivado.log|egrep --color=always '.*syntax.*|$ '|cat $1
	@grep -v -i "syntax error" vivado.log |egrep --color=always "PASSED|FAILED|ERROR" |cat $1
 

sim:
	@echo "Starting test, this may take a minute..."
	@echo "Log is written to run.log. Use \"cat run.log\" to print the log on screen."	
	@vivado -mode batch -source project_sim.tcl > run.log |cat
	@grep -i "syntax error" run.log|egrep --color=always '.*syntax.*|$ '|cat $1
	@grep -v -i "syntax error" run.log |egrep --color=always "PASSED|FAILED|ERROR" |cat $1

simgui: 
	@echo "Starting GUI test, this may take a minute..."
	@echo "Log is written to run.log. Use \"cat run.log\" to print the log on screen."	
	@vivado -mode gui -source project_sim.tcl > run.log | cat
	@grep -i "syntax error" run.log|egrep --color '.*syntax.*|$ '|cat $1
	@grep -i "syntax error" vivado.log|egrep --color=always '.*syntax.*|$ '|cat $1	
	@grep -v -i "syntax error" run.log|egrep --color=always "PASSED|FAILED|ERROR" | cat $1
	@grep -v -i "syntax error" vivado.log|egrep --color=always "PASSED|FAILED|ERROR" | cat $1

clean:
	@rm vivado*.*|cat
	@rm *.log|cat
	@rm -r Ex*.*|cat
	@rm -r .Xil |cat

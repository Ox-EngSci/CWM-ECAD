all: sim

sim:
	@echo "Starting test, this may take a minute..."
	@echo "Log is written to run.log. Use \"cat run.log\" to print the log on screen."
	@mkdir -p ip_repo	
	@vivado -mode batch -source project.tcl > run.log |cat
	@grep -i "syntax error" run.log|egrep --color=always '.*syntax.*|$ '|cat $1
	@grep -v -i "syntax error" run.log |egrep --color=always "PASSED|FAILED|ERROR" |cat $1

simgui: 
	@echo "Starting GUI test, this may take a minute..."
	@echo "Log is written to run.log. Use \"cat run.log\" to print the log on screen."	
	@mkdir -p ip_repo
	@vivado -mode gui -source project.tcl > run.log | cat
	@grep -i "syntax error" run.log|egrep --color '.*syntax.*|$ '|cat $1
	@grep -i "syntax error" vivado.log|egrep --color=always '.*syntax.*|$ '|cat $1	
	@grep -v -i "syntax error" run.log|egrep --color=always "PASSED|FAILED|ERROR" | cat $1
	@grep -v -i "syntax error" vivado.log|egrep --color=always "PASSED|FAILED|ERROR" | cat $1

clean:
	@rm vivado*.* run.log |cat
	@rm -r Ex*.* |cat
	@rm -r .Xil |cat
	@rm -r ip_repo |cat




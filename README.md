# 385-week-5
week 5 part 1 save point


For week 1, set `slc3.sramtop.sv` as top level module. KEY0 (top button) is continue, KEY1 (bottom button) is run. To RESET back to the first instruction, press both buttons simultaneously. You should let go of the Run button first (bottom one), and then let go of the continue button next. IDK why exactly, has to do with the state machine design I think, but its what Professor Cheng recommends.

To go to first instruction, press RUN, then for each subsequent instruction press continue. It should go thru all 155 instructions in `memory_contents.sv`

Other than that just run signaltap. 

.control
* Timestamp: Sat Apr  1 11:15:58 2023
set wr_singlescale  $ makes one x-axis for wrdata
set wr_vecnames     $ puts names at top of columns
listing
op
print line all > ..\results\op1.txt
dc vcc 0 5 0.25
wrdata ..\results\dc1.txt all
tran 1e-05 0.01
wrdata ..\results\tr1.txt all
ac dec 10 10 1000000.0
wrdata ..\results\ac1.txt vdb(out) vp(out)
quit
.endc

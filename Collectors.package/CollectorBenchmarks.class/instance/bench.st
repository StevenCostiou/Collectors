benchmarking
bench
	1 second wait.
	^ [ 1000000 timesRepeat: [ object benchmarkMethod ] ] timeToRun"WithoutGC "
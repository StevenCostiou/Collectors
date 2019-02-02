benchmarking
bench
	^ [ 1000000 timesRepeat: [ object benchmarkMethod ] ] timeToRunWithoutGC 
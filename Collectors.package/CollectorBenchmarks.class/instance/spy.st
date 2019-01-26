benchmarking
spy
	^ TimeProfiler
		spyOn: [ 1000000 timesRepeat: [ object benchmarkMethod ] ]
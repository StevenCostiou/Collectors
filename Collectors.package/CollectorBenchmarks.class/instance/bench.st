as yet unclassified
bench
	^ [ 1000000 timesRepeat: [ object benchmarkMethod ] ] timeToRun
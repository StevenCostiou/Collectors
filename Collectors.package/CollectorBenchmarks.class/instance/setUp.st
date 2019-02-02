initialization
setUp
	node := (AnObjectWithInstVar >> #benchmarkMethod) ast body statements
		first receiver.
	collector := Collector collectValue: node
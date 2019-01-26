initialization
setUp
	node := (AnObjectWithInstVar >> #benchmarkMethod) ast body statements
		first.
	collector := Collector collectValue: node
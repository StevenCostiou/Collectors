benchmarks
basicBenchmark2
	<script>
	|obj node r withoutCollector col withCollector|
	obj := self new.
	node := (AnObjectWithInstVar >> #benchmarkMethod) ast statements first receiver.
	r := 100000.
	
	withoutCollector := [ r timesRepeat: [obj benchmarkMethod]] timeToRunWithoutGC.

	col := Collector collectValue: node.
	withCollector := [ r timesRepeat: [obj benchmarkMethod]] timeToRunWithoutGC.
	col uninstall.
	
	{ withoutCollector.  withCollector. (withCollector/withoutCollector) asFloat.} inspect
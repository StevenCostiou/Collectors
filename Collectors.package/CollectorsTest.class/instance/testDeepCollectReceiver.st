deep collection
testDeepCollectReceiver
self assert:false
	"| col node |
	node := (AnObjectWithInstVar >> #aMethodWithTempVar) ast statements second.
	col := Collector collectValue: node.	
	col deepInstall.
	AnObjectWithInstVar new aMethodWithTempVar.
	self halt."
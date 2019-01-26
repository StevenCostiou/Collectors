accessing
oldValue
	"rawData always starts by: #(collector value node context)
	oldValue is always the value reification. 
	For variables value is always the value before the assignment."
	^ rawData second
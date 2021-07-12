collecting - control
mustCollect: reifications

	^ configuration conditions isEmpty or: [ 
		  configuration conditions allSatisfy: [ :c | 
			  c evaluateWith: reifications ] ]
compiling
evaluateWith: args
	^ [ block valueWithArguments: args ]
		on: Error
		do: [ :err | err ]
testing
aMethodWithTempVar
	| var |
	var := -1.
	var := 100 atRandom. 
	1 to: 10 do: [ :i | 
		var := i.
		instVar2 add: i ]
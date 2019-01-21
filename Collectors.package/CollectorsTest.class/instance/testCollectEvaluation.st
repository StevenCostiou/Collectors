tests
testCollectEvaluation
	| eval args |
	eval := CollectEvaluation new.
	eval source: 'arg1 , arg2'.
	args := #('col' 'toto' 'tata').
	eval compileWith: #(#col #arg1 #arg2).
	self assert: (eval evaluateWith: args) equals: 'tototata'
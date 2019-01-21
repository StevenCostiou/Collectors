tests
testCollectEvaluationBlockBody
	| eval |
	eval := CollectEvaluation new.
	eval source: ' arg1 , arg2'.
	eval compileWith: #(#col #arg1 #arg2).
	self assert: eval block sourceNode body formattedCode equals: 'arg1 , arg2'
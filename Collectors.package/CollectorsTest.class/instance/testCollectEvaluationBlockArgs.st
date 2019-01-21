tests
testCollectEvaluationBlockArgs
	| eval |
	eval := CollectEvaluation new.
	eval source: ' arg1 , arg2'.
	eval compileWith: #(#col #arg1 #arg2).
	self assert: eval block argumentNames second equals: #arg1.
	self assert: eval block argumentNames third equals: #arg2
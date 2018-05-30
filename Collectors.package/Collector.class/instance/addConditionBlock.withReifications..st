behavior - api
addConditionBlock: aConditionBlock withReifications: anArrayOfReifications
	| condition |
	condition := CollectEvaluation new.
	condition source: aConditionBlock sourceNode body formattedCode.
	configuration conditions add: condition.
	self addReifications: anArrayOfReifications
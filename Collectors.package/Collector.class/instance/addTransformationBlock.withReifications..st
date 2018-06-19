behavior - api
addTransformationBlock: aTransformationBlock withReifications: anArrayOfReifications
	| transformation |
	transformation := CollectEvaluation new.
	transformation source: aTransformationBlock sourceNode body formattedCode.
	configuration transformations add: transformation.
	configuration addReifications: anArrayOfReifications
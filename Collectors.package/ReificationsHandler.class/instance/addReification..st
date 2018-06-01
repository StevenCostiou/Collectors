adding - removing
addReification: aReification
	reifications add: aReification.
	browser recomputeBindings	"With: aReification."
	"browser announcer announce: SelectedReificationsHaveChanged"
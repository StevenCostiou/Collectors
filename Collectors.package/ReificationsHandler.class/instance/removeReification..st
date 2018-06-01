adding - removing
removeReification: aReification
	reifications remove: aReification ifAbsent: [  ].
	browser recomputeBindings	"With: aReification."
	"browser announcer announce: SelectedReificationsHaveChanged"
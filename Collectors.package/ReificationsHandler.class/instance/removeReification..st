adding - removing
removeReification: aReification
	reifications remove: aReification ifAbsent: [  ].
	browser announcer announce: SelectedReificationsHaveChanged
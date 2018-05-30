adding - removing
addReification: aReification
	reifications add: aReification.
	browser announcer announce: SelectedReificationsHaveChanged
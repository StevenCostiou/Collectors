building - configuration - deprecated
buildActionButtonsIn: tab
	tab transmit
		from: #itemStack;
		to: #actions;
		andShow: [ :composite :bitItem | self composeActionButtonsFor: bitItem in: composite ]
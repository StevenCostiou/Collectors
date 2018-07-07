building - configuration - deprecated
buildActionButtonsIn: tab forStack: aStack
	tab transmit
		from: #itemStack;
		to: #actions;
		andShow: [ :composite :stackItemIndex | aStack at: stackItemIndex ifPresent: [ :item | self composeActionButtonsFor: item in: composite ] ]
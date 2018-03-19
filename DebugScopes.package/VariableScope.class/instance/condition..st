scoping
condition: aBlock
	self changeCondition: aBlock.
	link invalidate.
	totalCollectedObjects := 0
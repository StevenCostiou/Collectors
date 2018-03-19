baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec repository: 'github://StevenCostiou/Collectors'.
			spec description: 'Collectors implementation'.
			spec package: 'DebugScopes'.
			spec package: 'DebugScopes-Tools'.
			spec package: 'DebugScopes-Collectors' ]
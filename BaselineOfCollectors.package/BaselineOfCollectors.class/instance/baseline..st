baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 	spec baseline: 'ReflectivityDev' 
				with: [ spec repository: 'github://StevenCostiou/Reflectivity-dev/repository' ].
			spec blessing: #baseline.
			spec repository: 'github://ClotildeToullec/Collectors'.
			spec description: 'Collectors implementation'.
			spec package: 'Collectors'. ]

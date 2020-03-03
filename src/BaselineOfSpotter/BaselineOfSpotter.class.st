Class {
	#name : #BaselineOfSpotter,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpotter
}

{ #category : #baselines }
BaselineOfSpotter >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				baseline: 'ContainersTrie'
				with: [ spec repository: 'github://pharo-containers/Containers-Trie/src' ].

			"Packages"
			spec
				package: 'Collections-Streams';
				package: 'RPackage-Core';
				package: 'Spec2-Adapters-Morphic';
				package: 'Tool-Catalog';
				package: 'GT-Spotter' 
					with: [ spec requires: #('Collections-Streams' 
						'RPackage-Core' 'Spec2-Adapters-Morphic' 'Tool-Catalog') ];
				package: 'GT-Spotter-UI' with: [ spec requires: #('GT-Spotter')];
				package: 'GT-SpotterExtensions-Core' with: [ spec requires: #('GT-Spotter')];
				package: 'GT-Spotter-New' 
					with: [ spec requires: #('GT-Spotter' 'GT-Spotter-UI' 'GT-SpotterExtensions-Core')];

				package: 'GT-Spotter-New-Tests' with: [ spec requires: #('GT-Spotter-New')];
				package: 'GT-Spotter-New-Indexes' 
					with: [ spec requires: #('ContainersTrie' 'GT-Spotter-New')];
				package: 'GT-Spotter-New-Indexes-Tests' 
					with: [ spec requires: #('GT-Spotter-New-Indexes')].
					
				spec 
					group: 'default' with: #('GT-Spotter-New' 'GT-Spotter-New-Tests');
					group: 'indexes' with: #('default' 'GT-Spotter-New-Indexes' 'GT-Spotter-New-Indexes-Tests') ]
]

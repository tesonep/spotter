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

			spec postLoadDoIt: #postload:package:.

			spec
				baseline: 'VMTunning'
				with: [ spec repository: 'github://tesonep/pharo-vm-tunning/src' ].

			spec
				baseline: 'Aleph'
				with: [ spec repository: 'github://estebanlm/aleph/src' ].

			"Packages"
			spec
				package: 'Tool-Catalog';
				package: 'GT-Spotter' 
					with: [ spec requires: #('Tool-Catalog') ];
				package: 'GT-Spotter-UI' with: [ spec requires: #('GT-Spotter')];
				package: 'GT-SpotterExtensions-Core' with: [ spec requires: #('GT-Spotter')];
				package: 'GT-Spotter-New' 
					with: [ spec requires: #('GT-Spotter' 'GT-Spotter-UI' 'GT-SpotterExtensions-Core')];

				package: 'GT-Spotter-New-Tests' with: [ spec requires: #('GT-Spotter-New')];
				package: 'GT-Spotter-New-Indexes' 
					with: [ spec requires: #('VMTunning' 'Aleph' 'GT-Spotter-New')];
				package: 'GT-Spotter-New-Indexes-Tests' 
					with: [ spec requires: #('GT-Spotter-New-Indexes')].
					
				spec 
					group: 'default' with: #('GT-Spotter-New' 'GT-Spotter-New-Tests');
					group: 'indexes' with: #('default' 'GT-Spotter-New-Indexes' 'GT-Spotter-New-Indexes-Tests') ]
]

{ #category : #baselines }
BaselineOfSpotter >> postload: loader package: packageSpec [

	Smalltalk
		at: #SptSourceWithIndexFactory
		ifPresent: [ :sourceWithIndexFactory | sourceWithIndexFactory buildIndexes ]
]

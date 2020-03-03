Class {
	#name : #SptWorldMenuProcessor,
	#superclass : #SptSpotterProcessor,
	#category : #'GT-Spotter-New-Processors'
}

{ #category : #'default-settings' }
SptWorldMenuProcessor class >> defaultEnabled [

	^ true
]

{ #category : #filtering }
SptWorldMenuProcessor >> newTextFilteringSource [

	^ ((SptGeneratorBlockIterator
		on: [ :aValuable | self currentWorld worldMenu withAllLeafItemsDo: aValuable ])
		collect: [ :e | SptWorldMenuEntry on: e ]) asSubstringFilter
]

{ #category : #accessing }
SptWorldMenuProcessor >> order [
	
	^ 9
]

{ #category : #configuration }
SptWorldMenuProcessor >> showForEmptyQuery [

	^ true
]

{ #category : #accessing }
SptWorldMenuProcessor >> title [

	^ 'Menu'
]

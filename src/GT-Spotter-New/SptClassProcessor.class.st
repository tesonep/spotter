"
I am simple processor that iterates on the classes
"
Class {
	#name : #SptClassProcessor,
	#superclass : #SptSpotterProcessor,
	#category : #'GT-Spotter-New-Processors'
}

{ #category : #'default-settings' }
SptClassProcessor class >> defaultEnabled [

	^ false
]

{ #category : #accessing }
SptClassProcessor >> newTextFilteringSource [

	^ ((SptClassIterator new select: [ :e | e isMeta not ])
		collect: [ :e | SptClassEntry on: e ]) asSubstringFilter
]

{ #category : #accessing }
SptClassProcessor >> order [
	
	^ 10
]

{ #category : #accessing }
SptClassProcessor >> title [

	^ 'Classes'
]

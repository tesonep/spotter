"
I am simple processor that iterates on the classes
"
Class {
	#name : #SptClassProcessor,
	#superclass : #SptSpotterProcessor,
	#category : #'GT-Spotter-New-Processors'
}

{ #category : #accessing }
SptClassProcessor >> newTextFilteringSource [

	^ ((SptClassIterator new select: [ :e | e isMeta not ])
		collect: [ :e | SptClassEntry on: e ]) asSubstringFilter
]

{ #category : #accessing }
SptClassProcessor >> title [

	^ 'Classes'
]

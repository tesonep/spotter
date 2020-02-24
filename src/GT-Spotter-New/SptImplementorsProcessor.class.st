"
I am simple processor that iterates on the implementors
"
Class {
	#name : #SptImplementorsProcessor,
	#superclass : #SptSpotterProcessor,
	#category : #'GT-Spotter-New-Processors'
}

{ #category : #filtering }
SptImplementorsProcessor >> newTextFilteringSource [

	^ (SptImplementorsIterator new collect: [ :e | SptMethodEntry on: e ]) asSubstringFilter
]

{ #category : #accessing }
SptImplementorsProcessor >> title [

	^ 'Implementors'
]

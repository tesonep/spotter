Class {
	#name : #SptImplementorsProcessor,
	#superclass : #SptSpotterProccessor,
	#category : #'GT-Spotter-New-Processors'
}

{ #category : #filtering }
SptImplementorsProcessor >> newSource [

	^ SptImplementorsIterator new collect: [ :e | SptMethodEntry on: e ]
]

{ #category : #accessing }
SptImplementorsProcessor >> title [

	^ 'Implementors'
]

Class {
	#name : #SptClassProcessor,
	#superclass : #SptSpotterProccessor,
	#category : #'GT-Spotter-New-Processors'
}

{ #category : #accessing }
SptClassProcessor >> newSource [

	^ (SptClassIterator new select: [:e | e isMeta not])
		collect: [ :e | SptClassEntry on: e ]
]

{ #category : #accessing }
SptClassProcessor >> title [

	^ 'Classes'
]

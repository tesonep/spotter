Class {
	#name : #SptClassProcessor,
	#superclass : #SptSpotterProccessor,
	#category : #'GT-Spotter-New'
}

{ #category : #accessing }
SptClassProcessor >> keyBinding [
	
	^ $b meta
]

{ #category : #accessing }
SptClassProcessor >> newSource [

	^ SptClassIterator new collect: [ :e | SptClassEntry on: e ]
]

{ #category : #accessing }
SptClassProcessor >> title [

	^ 'Classes'
]

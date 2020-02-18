Class {
	#name : #GTImplementorsProcessor,
	#superclass : #SptSpotterProccessor,
	#category : #'GT-Spotter-New'
}

{ #category : #accessing }
GTImplementorsProcessor >> keyBinding [
	
	^ $m meta
]

{ #category : #filtering }
GTImplementorsProcessor >> newSource [

	^ SptImplementorsIterator new collect: [ :e | SptMethodEntry on: e ]
]

{ #category : #accessing }
GTImplementorsProcessor >> title [

	^ 'Implementors'
]

Class {
	#name : #SptUnifiedProcessor,
	#superclass : #SptSpotterProccessor,
	#category : #'GT-Spotter-New'
}

{ #category : #filtering }
SptUnifiedProcessor >> maxResults [

	^ 20
]

{ #category : #filtering }
SptUnifiedProcessor >> newSource [

	^ SptCaseSelectorIterator new
		lowercaseIterator: (SptSequenceIterator with: {
			(SptImplementorsIterator new collect: [ :e | SptMethodEntry on: e ]) asBeginsWithFilter.
			(SptImplementorsIterator new collect: [ :e | SptMethodEntry on: e ]) asSubstringFilter});
		uppercaseIterator: (SptSequenceIterator with: {
			(SptClassIterator new collect: [ :e | SptClassEntry on: e ]) asBeginsWithFilter.
			(SptPackageIterator new collect: [ :e | SptPackageEntry on: e ]) asBeginsWithFilter.
			(SptClassIterator new collect: [ :e | SptClassEntry on: e ]) asSubstringFilter.		
			(SptPackageIterator new collect: [ :e | SptPackageEntry on: e ]) asSubstringFilter});
		yourself.


]

{ #category : #filtering }
SptUnifiedProcessor >> title [

	^ 'My Pharo'
]

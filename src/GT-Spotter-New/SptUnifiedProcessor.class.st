Class {
	#name : #SptUnifiedProcessor,
	#superclass : #SptSpotterProccessor,
	#category : #'GT-Spotter-New-Processors'
}

{ #category : #'key-bindings' }
SptUnifiedProcessor >> installKeymappingsOn: aSpotterMorph [

	spotterMorph := aSpotterMorph.

	aSpotterMorph kmDispatcher
				bindKeyCombination: $b meta
				toAction: (MessageSend receiver: self query selector: #filterClasses).

	aSpotterMorph kmDispatcher
				bindKeyCombination: $m meta
				toAction: (MessageSend receiver: self query selector: #filterImplementors).
	
]

{ #category : #filtering }
SptUnifiedProcessor >> maxResults [

	^ 20
]

{ #category : #filtering }
SptUnifiedProcessor >> newSource [

	^ SptCaseSelectorIterator new
		lowercaseIterator: ( SptCategoryFilterIterator category: #Implementors for: 
			((SptImplementorsIterator new collect: [ :e | SptMethodEntry on: e ]) asBeginsWithFilter ,
			(SptImplementorsIterator new collect: [ :e | SptMethodEntry on: e ]) asSubstringFilter ));
		uppercaseIterator: (SptSequenceIterator with: {
			SptCategoryFilterIterator category: #Classes for: (SptClassIterator new collect: [ :e | SptClassEntry on: e ]) asBeginsWithFilter.
			SptCategoryFilterIterator category: #Packages for: (SptPackageIterator new collect: [ :e | SptPackageEntry on: e ]) asBeginsWithFilter.
			SptCategoryFilterIterator category: #Classes for: (SptClassIterator new collect: [ :e | SptClassEntry on: e ]) asSubstringFilter.		
			SptCategoryFilterIterator category: #Packages for: (SptPackageIterator new collect: [ :e | SptPackageEntry on: e ]) asSubstringFilter});
		yourself.


]

{ #category : #filtering }
SptUnifiedProcessor >> title [

	^ 'Results'
]

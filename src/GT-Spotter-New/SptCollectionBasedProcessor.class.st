Class {
	#name : #SptCollectionBasedProcessor,
	#superclass : #SptSpotterProcessor,
	#category : #'GT-Spotter-New-Processors'
}

{ #category : #testing }
SptCollectionBasedProcessor class >> isAbstract [ 

	^ self = SptCollectionBasedProcessor 
]

{ #category : #filtering }
SptCollectionBasedProcessor >> collection [

	^ self subclassResponsibility 
]

{ #category : #filtering }
SptCollectionBasedProcessor >> newEntryOn: anElement [

	^ self subclassResponsibility 
]

{ #category : #filtering }
SptCollectionBasedProcessor >> newTextFilteringSource [

	^ ((SptCollectionIterator on: self collection) 
			collect: [ :e | self newEntryOn: e ]) asSubstringFilter
]

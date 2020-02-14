Class {
	#name : #GeneratorIteratorTest,
	#superclass : #TestCase,
	#category : #'GT-Spotter-New-Tests'
}

{ #category : #tests }
GeneratorIteratorTest >> testCollectionWithSingleElementReturnsIt [

	| gen |
	gen := GeneratorIterator on: #(1).
	self assert: gen next equals: 1
]

{ #category : #tests }
GeneratorIteratorTest >> testCollectionWithSingleManyElementsReturnsTheRequested [

	| gen |
	gen := GeneratorIterator on: #(1 2 3 4 5 6 7 8 9 10).
	
	self assert: gen next equals: 1.
	self assert: gen next equals: 2.
	self assert: gen next equals: 3.
]

{ #category : #tests }
GeneratorIteratorTest >> testCollectionWithSingleManyElementsReturnsTheRequestedInCollection [

	| gen |
	gen := GeneratorIterator on: #(1 2 3 4 5 6 7 8 9 10).
	
	self assertCollection: (gen next:3) hasSameElements: #(1 2 3).

]

{ #category : #tests }
GeneratorIteratorTest >> testCollectionWithSingleWithALotOfElementsReturnsTheRequestedInCollection [

	| gen |
	gen := GeneratorIterator on: (1 to: 10**99).
	
	self assertCollection: (gen next:3) hasSameElements: #(1 2 3).

]

{ #category : #tests }
GeneratorIteratorTest >> testEmptyCollectionIsAtEnd [

	| gen |
	gen := GeneratorIterator on: #().
	self assert: gen atEnd
]

{ #category : #tests }
GeneratorIteratorTest >> testResetRestartsIterationOnTheCollection [

	| gen |
	gen := GeneratorIterator on: #(1 2 3 4 5 6 7 8 9 10).
	
	self assertCollection: (gen next:3) hasSameElements: #(1 2 3).
	gen reset.
	self assertCollection: (gen next:3) hasSameElements: #(1 2 3).
	
]

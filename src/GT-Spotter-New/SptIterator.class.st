Class {
	#name : #SptIterator,
	#superclass : #Object,
	#category : #'GT-Spotter-New'
}

{ #category : #sequencing }
SptIterator >> , aSptGeneratorIterator [ 
	
	^ SptSequenceIterator with: { self. aSptGeneratorIterator }
]

{ #category : #accessing }
SptIterator >> atEnd [ 

	^ self subclassResponsibility 
]

{ #category : #transforming }
SptIterator >> collect: aBlockClosure [ 
	
	^ SptTransformation on: self with: aBlockClosure
]

{ #category : #accessing }
SptIterator >> next [

	self subclassResponsibility 
]

{ #category : #initialization }
SptIterator >> next: aQuantity [

	^ OrderedCollection streamContents: [ :stream | | total last |
			total := 0.
			[ (last := self next) ifNotNil: [ :each | 
				stream nextPut: each.
				total := total + 1 ] ]
				doWhileTrue: [ total < aQuantity and: [ last notNil ] ] ]
]

{ #category : #filtering }
SptIterator >> select: aBlockClosure [ 
	
	^ SptFilter on: self with: aBlockClosure 
]

{ #category : #filtering }
SptIterator >> stringFilter: aString [ 
	
	^ SptSubStringFilter on: self with: aString
]

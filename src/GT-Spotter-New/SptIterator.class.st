Class {
	#name : #SptIterator,
	#superclass : #Object,
	#category : #'GT-Spotter-New'
}

{ #category : #sequencing }
SptIterator >> , aSptGeneratorIterator [ 
	
	^ SptSequenceIterator with: { self. aSptGeneratorIterator }
]

{ #category : #filtering }
SptIterator >> asBeginsWithFilter [
	
	^ self beginsWithFilter: ''
]

{ #category : #filtering }
SptIterator >> asSubstringFilter [
	
	^ self substringFilter: ''
]

{ #category : #accessing }
SptIterator >> atEnd [ 

	^ self subclassResponsibility 
]

{ #category : #filtering }
SptIterator >> beginsWithFilter: aString [ 
	
	^ SptBeginsWithFilter on: self with: aString
]

{ #category : #transforming }
SptIterator >> collect: aBlockClosure [ 
	
	^ SptTransformation on: self with: aBlockClosure
]

{ #category : #filtering }
SptIterator >> filteringText: aString [

	"The subclasses should decide what to do if they handle text filtering"

	^ self subclassResponsibility 
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
SptIterator >> substringFilter: aString [ 
	
	^ SptSubStringFilter on: self with: aString
]

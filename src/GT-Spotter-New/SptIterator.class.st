Class {
	#name : #SptIterator,
	#superclass : #Object,
	#category : #'GT-Spotter-New-Iterators'
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

{ #category : #filtering }
SptIterator >> asWithoutDuplicates [
	
	^ SptWithoutDuplicatesDecorator on: self
]

{ #category : #accessing }
SptIterator >> atEnd [ 

	^ self subclassResponsibility 
]

{ #category : #filtering }
SptIterator >> beginsWithFilter: aString [ 
	
	^ SptBeginsWithFilter on: self with: aString
]

{ #category : #accessing }
SptIterator >> categoriesSelected: categories [
]

{ #category : #transforming }
SptIterator >> collect: aBlockClosure [ 
	
	^ SptTransformation on: self with: aBlockClosure
]

{ #category : #accessing }
SptIterator >> filteringText: aString [

]

{ #category : #accessing }
SptIterator >> next [

	self subclassResponsibility 
]

{ #category : #initialization }
SptIterator >> next: aQuantity [

	^ OrderedCollection streamContents: [ :stream | | total last |
			total := 0.
			[ (last := self next).
				last ifNotNil: [  
					stream nextPut: last.
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

{ #category : #accessing }
SptIterator >> upToEnd [

	^ OrderedCollection
		streamContents:
			[ :stream | [ self atEnd ] whileFalse: [ stream nextPut: self next ] ]
]

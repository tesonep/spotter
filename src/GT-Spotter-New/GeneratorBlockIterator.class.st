Class {
	#name : #GeneratorBlockIterator,
	#superclass : #Object,
	#instVars : [
		'block',
		'generator'
	],
	#category : #'GT-Spotter-New'
}

{ #category : #'instance creation' }
GeneratorBlockIterator class >> on: aBlock [

	^ self basicNew
		block: aBlock;
		initialize;
		yourself
]

{ #category : #accessing }
GeneratorBlockIterator >> atEnd [ 

	^ generator atEnd
]

{ #category : #accessing }
GeneratorBlockIterator >> block: aBlock [

	block := aBlock
]

{ #category : #accessing }
GeneratorBlockIterator >> initialize [
	super initialize.
	self reset
]

{ #category : #accessing }
GeneratorBlockIterator >> next [

	^ generator next
]

{ #category : #accessing }
GeneratorBlockIterator >> next: aQuantity [

	^ generator next: aQuantity
]

{ #category : #accessing }
GeneratorBlockIterator >> reset [
	generator := Generator on: [ :aGenerator | block value: [ :each | aGenerator yield: each ] ]
]

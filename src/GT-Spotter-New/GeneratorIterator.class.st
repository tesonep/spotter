Class {
	#name : #GeneratorIterator,
	#superclass : #Object,
	#instVars : [
		'collection',
		'generator'
	],
	#category : #'GT-Spotter-New'
}

{ #category : #'instance creation' }
GeneratorIterator class >> on: aSequenceableCollection [

	^ self basicNew
		collection: aSequenceableCollection;
		initialize;
		yourself
]

{ #category : #accessing }
GeneratorIterator >> atEnd [ 

	^ generator atEnd
]

{ #category : #accessing }
GeneratorIterator >> collection [
	^ collection
]

{ #category : #accessing }
GeneratorIterator >> collection: anObject [
	collection := anObject
]

{ #category : #accessing }
GeneratorIterator >> doNext: aGenerator [

	collection do: [ :each | aGenerator yield: each ]
]

{ #category : #accessing }
GeneratorIterator >> initialize [
	super initialize.
	self reset
]

{ #category : #accessing }
GeneratorIterator >> next [

	^ generator next
]

{ #category : #accessing }
GeneratorIterator >> next: aQuantity [

	^ generator next: aQuantity
]

{ #category : #accessing }
GeneratorIterator >> reset [
	generator := Generator on: [ :aGenerator | self doNext: aGenerator ]
]

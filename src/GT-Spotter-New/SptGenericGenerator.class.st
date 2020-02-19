Class {
	#name : #SptGenericGenerator,
	#superclass : #SptIterator,
	#instVars : [
		'generator'
	],
	#category : #'GT-Spotter-New-Iterators'
}

{ #category : #accessing }
SptGenericGenerator >> atEnd [ 

	^ generator atEnd
]

{ #category : #accessing }
SptGenericGenerator >> elementsDo: aValuable [

	^ self subclassResponsibility
]

{ #category : #accessing }
SptGenericGenerator >> initialize [
	super initialize.
	self reset
]

{ #category : #accessing }
SptGenericGenerator >> next [

	^ generator next
]

{ #category : #accessing }
SptGenericGenerator >> next: aQuantity [

	^ generator next: aQuantity
]

{ #category : #accessing }
SptGenericGenerator >> reset [
	generator := Generator on: [ :aGenerator | 
		self elementsDo: [ :each | aGenerator yield: each ] ]
]

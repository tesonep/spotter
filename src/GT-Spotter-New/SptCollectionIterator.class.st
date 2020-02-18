Class {
	#name : #SptCollectionIterator,
	#superclass : #SptGenericGenerator,
	#instVars : [
		'collection'
	],
	#category : #'GT-Spotter-New'
}

{ #category : #'instance creation' }
SptCollectionIterator class >> on: aSequenceableCollection [

	^ self basicNew
		collection: aSequenceableCollection;
		initialize;
		yourself
]

{ #category : #accessing }
SptCollectionIterator >> collection [
	^ collection
]

{ #category : #accessing }
SptCollectionIterator >> collection: anObject [
	collection := anObject
]

{ #category : #accessing }
SptCollectionIterator >> elementsDo: aValuable [

	^ collection do: aValuable 
]

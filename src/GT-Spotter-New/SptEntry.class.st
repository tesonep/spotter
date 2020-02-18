Class {
	#name : #SptEntry,
	#superclass : #Object,
	#instVars : [
		'content'
	],
	#category : #'GT-Spotter-New'
}

{ #category : #wrapping }
SptEntry class >> on: aValue [
	
	^ self new
		content: aValue;
		yourself
]

{ #category : #accessing }
SptEntry >> asString [ 

	^ self subclassResponsibility 
]

{ #category : #accessing }
SptEntry >> content [
	^ content
]

{ #category : #accessing }
SptEntry >> content: anObject [
	content := anObject
]

{ #category : #accessing }
SptEntry >> doEvaluate [.

	self subclassResponsibility 
]

{ #category : #accessing }
SptEntry >> evaluateFor: aGTSpotterStep [ 

	self doEvaluate.
	aGTSpotterStep exit.
]

{ #category : #accessing }
SptEntry >> printOn: aStream [
	aStream
		<< self class name;
		<< '( ';
		print: content;
		<< ' )'
]

{ #category : #accessing }
SptEntry >> render [

	^ self subclassResponsibility
]

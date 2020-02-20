Class {
	#name : #SptEntry,
	#superclass : #Object,
	#instVars : [
		'content'
	],
	#category : #'GT-Spotter-New-Entries'
}

{ #category : #wrapping }
SptEntry class >> on: aValue [
	
	^ self new
		content: aValue;
		yourself
]

{ #category : #comparing }
SptEntry >> = anEntry [

	^ self species = anEntry species
		and: [ anEntry content = self content ]
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

{ #category : #'as yet unclassified' }
SptEntry >> gtDisplayString [

	^ content gtDisplayString
]

{ #category : #comparing }
SptEntry >> hash [

	^ content hash
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

{ #category : #accessing }
SptEntry >> spotterActDefault [
	^ content spotterActDefault 
]

{ #category : #'as yet unclassified' }
SptEntry >> spotterPreviewIn: aComposite inContext: aSpotter [

	^ content spotterPreviewCodeIn: aComposite
]

{ #category : #'as yet unclassified' }
SptEntry >> spotterProcessorsFor: aSpotterStep [

	^ content spotterProcessorsFor: aSpotterStep
]

{ #category : #'as yet unclassified' }
SptEntry >> spotterProcessorsFor: aSpotterStep pragma: aPragma [

	^ content spotterProcessorsFor: aSpotterStep pragma: aPragma
]

"
I wrap the return elements from the spotter processor. 
As the processor returns different elements I add the behaviour required to show the element. 

Also, I redirect the messages that should be answer by my content
"
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

{ #category : #converting }
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
SptEntry >> doEvaluate [

	content browse
]

{ #category : #evaluating }
SptEntry >> evaluateFor: aGTSpotterStep [ 

	self doEvaluate.
	aGTSpotterStep exit.
]

{ #category : #'spotter-extensions' }
SptEntry >> gtDisplayString [

	^ content gtDisplayString
]

{ #category : #comparing }
SptEntry >> hash [

	^ content hash
]

{ #category : #printing }
SptEntry >> printOn: aStream [
	aStream
		<< self class name;
		<< '( ';
		print: content;
		<< ' )'
]

{ #category : #accessing }
SptEntry >> render [ 

	^ GTSpotterItemBrick new
		icon: content systemIcon;
		text: content gtDisplayString
]

{ #category : #'spotter-extensions' }
SptEntry >> spotterActDefault [
	^ content spotterActDefault 
]

{ #category : #'spotter-extensions' }
SptEntry >> spotterPreviewIn: aComposite inContext: aSpotter [

	^ content spotterPreviewCodeIn: aComposite
]

{ #category : #'spotter-extensions' }
SptEntry >> spotterProcessorsFor: aSpotterStep [

	^ content spotterProcessorsFor: aSpotterStep
]

{ #category : #'spotter-extensions' }
SptEntry >> spotterProcessorsFor: aSpotterStep pragma: aPragma [

	^ content spotterProcessorsFor: aSpotterStep pragma: aPragma
]

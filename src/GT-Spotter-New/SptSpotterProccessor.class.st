Class {
	#name : #SptSpotterProccessor,
	#superclass : #Object,
	#instVars : [
		'order',
		'filter',
		'results'
	],
	#category : #'GT-Spotter-New'
}

{ #category : #filtering }
SptSpotterProccessor >> actOn: anEntry for: aGTSpotterStep [ 

	^ anEntry evaluateFor: aGTSpotterStep
]

{ #category : #accessing }
SptSpotterProccessor >> allFilteredCandidates [
	
	^ results
]

{ #category : #filtering }
SptSpotterProccessor >> filter [ 
	
	^ filter ifNil: [ filter := self newSource ]
]

{ #category : #filtering }
SptSpotterProccessor >> filterInContext: aSpotterContext [ 

	(aSpotterContext text isEmpty) ifTrue: [ ^ self ].
	
	self filter filteringText: aSpotterContext text.
	results := OrderedCollection new.

	[ self filter atEnd or: [ results size = self maxResults ] ] 
		whileFalse: [ self filter next ifNotNil: [ :aResult | 
				aSpotterContext stream 
					performSymbol: #addCandidate:in:
					withArguments: { aResult. self }.
				results add:aResult.
		]].

	(results size = self maxResults ) 
		ifTrue: [ ^ self ].
	
	aSpotterContext stream 
		performSymbol: #onAmountChanged:in:
		withArguments: { results size. self }
	
]

{ #category : #filtering }
SptSpotterProccessor >> keyBinding [ 

	^ nil
]

{ #category : #configuration }
SptSpotterProccessor >> maxResults [

	^ 10
]

{ #category : #filtering }
SptSpotterProccessor >> newSource [

	^ self subclassResponsibility
]

{ #category : #accessing }
SptSpotterProccessor >> order [
	
	^ order
]

{ #category : #accessing }
SptSpotterProccessor >> order: anObject [
	order := anObject
]

{ #category : #filtering }
SptSpotterProccessor >> render: anEntry [
		
	^ anEntry render
]

{ #category : #filtering }
SptSpotterProccessor >> title [

	^ self subclassResponsibility
]

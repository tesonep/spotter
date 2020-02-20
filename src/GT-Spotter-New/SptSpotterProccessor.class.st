Class {
	#name : #SptSpotterProccessor,
	#superclass : #Object,
	#instVars : [
		'order',
		'filter',
		'results',
		'query',
		'spotterMorph',
		'running'
	],
	#category : #'GT-Spotter-New-Processors'
}

{ #category : #filtering }
SptSpotterProccessor >> actOn: anEntry for: aGTSpotterStep [ 

	^ anEntry evaluateFor: aGTSpotterStep
]

{ #category : #accessing }
SptSpotterProccessor >> allFilteredCandidates [

	self filter 
		filteringText: self query searchingText;
		categoriesSelected: self query categoriesSelected.
		
	^ self filter upToEnd
]

{ #category : #filtering }
SptSpotterProccessor >> executeQuery [

	(self query isSearchEmpty) 
		ifTrue: [ ^ self ].
	
	self filter 
		filteringText: self query searchingText;
		categoriesSelected: self query categoriesSelected.
		
	results := OrderedCollection new.

	[ self filter atEnd or: [ results size = self maxResults ] ] 
		whileFalse: [ self filter next ifNotNil: [ :aResult | 
				self query addResult: aResult.
				results add:aResult.
		]].

	(results size = self maxResults ) 
		ifTrue: [ ^ self ].

	self query informAllResultAmount: results size.	

]

{ #category : #filtering }
SptSpotterProccessor >> filter [ 
	
	^ filter ifNil: [ filter := self newSource ]
]

{ #category : #filtering }
SptSpotterProccessor >> filterInContext: aSpotterContext [ 

	self notifyStarted: aSpotterContext.
	self query updateFromContext: aSpotterContext.
	self executeQuery.
	self notifyEnded: aSpotterContext.

]

{ #category : #'key-bindings' }
SptSpotterProccessor >> installKeymappingsOn: aGTSpotterMorph [ 
	
	"Nothing to do"
]

{ #category : #testing }
SptSpotterProccessor >> isRelevantForQuery: aString [ 
	
	"I will handle... I am old enough"
	^ true
]

{ #category : #testing }
SptSpotterProccessor >> isRunning [ 

	^ running
]

{ #category : #'key-bindings' }
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

{ #category : #events }
SptSpotterProccessor >> notifyEnded: aSpotterContext [

	running := false.
	aSpotterContext stream 
		performSymbol: #processorEnded: 
		withArguments: { self }.

]

{ #category : #events }
SptSpotterProccessor >> notifyStarted: aSpotterContext [

	running := true.
	aSpotterContext stream 
		performSymbol: #processorStarted: 
		withArguments: { self }.

]

{ #category : #accessing }
SptSpotterProccessor >> order [
	
	^ order
]

{ #category : #accessing }
SptSpotterProccessor >> order: anObject [
	order := anObject
]

{ #category : #accessing }
SptSpotterProccessor >> query [

	^ query ifNil: [ query := SptQuery new processor: self; yourself ]
]

{ #category : #filtering }
SptSpotterProccessor >> render: anEntry [
		
	^ anEntry render
]

{ #category : #accessing }
SptSpotterProccessor >> spotterMorph [
	^ spotterMorph
]

{ #category : #filtering }
SptSpotterProccessor >> title [

	^ self subclassResponsibility
]

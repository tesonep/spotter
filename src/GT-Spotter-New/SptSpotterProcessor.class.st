"
I am a extensible spotter processor. 
I perform the integration with Spotter, but also I handle the lifecycle of the query, creating it from the spotter context; storing the results and the filter. 

The filter is divided in two instance variables. The #filter contains the whole iterator that will be used. As some of the parts of the decorator requires to be notified when the filtering text is changed there is a collection of filters that require this.

My subclasses should implement #newTextFilteringSource to return the filtering iterator to use or newSource if the iterator building is more complex (see SptUnifiedProcessor).

My subclasses can override #installKeymappingsOn: to install keybindings in Spotter.
Also, there is #configureFilter to extend the configuration of the source when there is a change in the query.

I also handled the notifications when the query finish, so Spotter UI can show it correctly.
"
Class {
	#name : #SptSpotterProcessor,
	#superclass : #Object,
	#instVars : [
		'order',
		'filter',
		'results',
		'query',
		'spotterMorph',
		'running',
		'textFilteringIterators'
	],
	#category : #'GT-Spotter-New-Processors'
}

{ #category : #'spotter-api' }
SptSpotterProcessor >> actOn: anEntry for: aGTSpotterStep [ 

	^ anEntry evaluateFor: aGTSpotterStep
]

{ #category : #'spotter-api' }
SptSpotterProcessor >> allFilteredCandidates [

	self configureFilter.		
	^ self filter upToEnd
]

{ #category : #filtering }
SptSpotterProcessor >> configureFilter [

	self ensureFilter.
	textFilteringIterators do: [:e | 
		e filteringText: self query searchingText]
]

{ #category : #filtering }
SptSpotterProcessor >> ensureFilter [

	^ filter ifNil: [
		filter := self newSource]
]

{ #category : #filtering }
SptSpotterProcessor >> executeQuery [

	(self query isSearchEmpty) 
		ifTrue: [ ^ self ].
	
	self configureFilter.
		
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
SptSpotterProcessor >> filter [ 
	
	^ filter ifNil: [ self ensureFilter ]
]

{ #category : #'spotter-api' }
SptSpotterProcessor >> filterInContext: aSpotterContext [ 

	self notifyStarted: aSpotterContext.
	self query updateFromContext: aSpotterContext.
	self executeQuery.
	self notifyEnded: aSpotterContext.

]

{ #category : #'key-bindings' }
SptSpotterProcessor >> installKeymappingsOn: aGTSpotterMorph [ 
	
	"Nothing to do"
]

{ #category : #'spotter-api' }
SptSpotterProcessor >> isRelevantForQuery: aString [ 
	
	"I will handle... I am old enough"
	^ true
]

{ #category : #'spotter-api' }
SptSpotterProcessor >> isRunning [ 

	^ running
]

{ #category : #'key-bindings' }
SptSpotterProcessor >> keyBinding [ 
	^ nil
]

{ #category : #configuration }
SptSpotterProcessor >> maxResults [

	^ 10
]

{ #category : #filtering }
SptSpotterProcessor >> newSource [

	| source |
	source := self newTextFilteringSource.

	textFilteringIterators := OrderedCollection new.
	textFilteringIterators add: source.
	
	^ source
	
]

{ #category : #filtering }
SptSpotterProcessor >> newTextFilteringSource [

	self subclassResponsibility 
]

{ #category : #events }
SptSpotterProcessor >> notifyEnded: aSpotterContext [

	running := false.
	aSpotterContext stream 
		performSymbol: #processorEnded: 
		withArguments: { self }.

]

{ #category : #events }
SptSpotterProcessor >> notifyStarted: aSpotterContext [

	running := true.
	aSpotterContext stream 
		performSymbol: #processorStarted: 
		withArguments: { self }.

]

{ #category : #accessing }
SptSpotterProcessor >> order [
	
	^ order
]

{ #category : #accessing }
SptSpotterProcessor >> order: anObject [
	order := anObject
]

{ #category : #accessing }
SptSpotterProcessor >> query [

	^ query ifNil: [ query := SptQuery new processor: self; yourself ]
]

{ #category : #filtering }
SptSpotterProcessor >> render: anEntry [
		
	^ anEntry render
]

{ #category : #accessing }
SptSpotterProcessor >> spotterMorph [
	^ spotterMorph
]

{ #category : #accessing }
SptSpotterProcessor >> title [

	^ self subclassResponsibility
]
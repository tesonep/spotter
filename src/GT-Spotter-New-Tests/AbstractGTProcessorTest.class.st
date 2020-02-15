Class {
	#name : #AbstractGTProcessorTest,
	#superclass : #TestCase,
	#instVars : [
		'text',
		'candidates',
		'context',
		'processor',
		'stream'
	],
	#category : #'GT-Spotter-New-Tests'
}

{ #category : #asserting }
AbstractGTProcessorTest >> assertQuantityOfResults: anInteger [ 
	
	self assert: candidates results size equals: anInteger
]

{ #category : #asserting }
AbstractGTProcessorTest >> assertResultsIncludes: anElement [ 
	
	self assert: (candidates results includes: anElement)
]

{ #category : #asserting }
AbstractGTProcessorTest >> denyResultsIncludes: anElement [ 

	self deny: (candidates results includes: anElement )
]

{ #category : #tests }
AbstractGTProcessorTest >> processor [

	^ self subclassResponsibility 
]

{ #category : #testing }
AbstractGTProcessorTest >> rerunWithText: aText [ 
	
	text := aText.
	context text: aText.
	processor filterInContext: context
]

{ #category : #tests }
AbstractGTProcessorTest >> runForText: aText [

	candidates := GTMockCandidatesList new.
	text := aText.
	stream := GTMockSpotterStream new
		receiver: candidates;
		yourself.

	context:= GTSpotterContext new 
		step: self;
		stream: stream;
		text: text;
		search: text;
		yourself.

	processor := self processor.
			
	processor filterInContext: context.
]

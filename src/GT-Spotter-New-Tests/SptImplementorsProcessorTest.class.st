Class {
	#name : #SptImplementorsProcessorTest,
	#superclass : #AbstractSptProcessorTest,
	#category : #'GT-Spotter-New-Tests'
}

{ #category : #tests }
SptImplementorsProcessorTest >> processor [

	^ SptImplementorsProcessor new
]

{ #category : #tests }
SptImplementorsProcessorTest >> testFindThisMethod [

	self runForText: 'testFindThisMethod'.
	self assertResultsIncludes: thisContext method
]

{ #category : #tests }
SptImplementorsProcessorTest >> testFindThisMethodAfterAddingText [

	self runForText: 'test'.
	self runForText: 'testFindThisMethod'.
	
	self assertResultsIncludes: thisContext method
]

{ #category : #tests }
SptImplementorsProcessorTest >> testPopularStringDoesReturnOnlyTenResults [

	self runForText: 'test'.
	self assertQuantityOfResults: 10.
]

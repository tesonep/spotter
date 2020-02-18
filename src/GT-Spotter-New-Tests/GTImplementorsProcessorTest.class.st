Class {
	#name : #GTImplementorsProcessorTest,
	#superclass : #AbstractGTProcessorTest,
	#category : #'GT-Spotter-New-Tests'
}

{ #category : #tests }
GTImplementorsProcessorTest >> processor [

	^ SptImplementorsProcessor new
]

{ #category : #tests }
GTImplementorsProcessorTest >> testFindThisMethod [

	self runForText: 'testFindThisMethod'.
	self assertResultsIncludes: thisContext method
]

{ #category : #tests }
GTImplementorsProcessorTest >> testFindThisMethodAfterAddingText [

	self runForText: 'test'.
	self runForText: 'testFindThisMethod'.
	
	self assertResultsIncludes: thisContext method
]

{ #category : #tests }
GTImplementorsProcessorTest >> testPopularStringDoesReturnOnlyTenResults [

	self runForText: 'test'.
	self assertQuantityOfResults: 10.
]

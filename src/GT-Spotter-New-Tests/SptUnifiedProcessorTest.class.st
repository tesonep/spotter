Class {
	#name : #SptUnifiedProcessorTest,
	#superclass : #AbstractSptProcessorTest,
	#category : #'GT-Spotter-New-Tests'
}

{ #category : #tests }
SptUnifiedProcessorTest >> processor [

	^ SptUnifiedProcessor new
]

{ #category : #tests }
SptUnifiedProcessorTest >> testFindGTClassProcessorTest [

	self runForText: 'sptunifiedprocessortest'.
	self assertResultsIncludes: self class
]

{ #category : #tests }
SptUnifiedProcessorTest >> testFindGTClassProcessorTestAfterAddingTest [

	self runForText: 'sptun'.
	self rerunWithText: 'sptunifiedprocess'.
	
	self assertResultsIncludes: self class
]

{ #category : #tests }
SptUnifiedProcessorTest >> testFindGTClassProcessorTestWithPartialText [

	self runForText: 'sptunifi'.
	self assertResultsIncludes: self class
]

{ #category : #tests }
SptUnifiedProcessorTest >> testFindThisMethod [

	self runForText: 'testFindThisMethod'.
	self assertResultsIncludes: thisContext method
]

{ #category : #tests }
SptUnifiedProcessorTest >> testFindThisMethodAfterAddingText [

	self runForText: 'test'.
	self runForText: 'testFindThisMethod'.
	
	self assertResultsIncludes: thisContext method
]

{ #category : #tests }
SptUnifiedProcessorTest >> testGTClassProcessorIsRemovedAfterUpdatingText [

	self runForText: 'gtclass'.
	self rerunWithText: 'gtclassprocesst'.
	
	self denyResultsIncludes: SptClassProcessor
]

{ #category : #tests }
SptUnifiedProcessorTest >> testPopularStringDoesReturnOnlyTwentyResults [

	self runForText: 'test'.
	self assertQuantityOfResults: 20.
]

{ #category : #tests }
SptUnifiedProcessorTest >> testPopularStringDoesReturnOnlyTwentyResultsWithCapital [

	self runForText: 'Test'.
	self assertQuantityOfResults: 20.
]

Class {
	#name : #SptClassProcessorTest,
	#superclass : #AbstractSptProcessorTest,
	#category : #'GT-Spotter-New-Tests'
}

{ #category : #tests }
SptClassProcessorTest >> processor [

	^ SptClassProcessor new
]

{ #category : #tests }
SptClassProcessorTest >> testFindGTClassProcessorTest [

	self runForText: 'sptclassprocessortest'.
	self assertResultsIncludes: self class
]

{ #category : #tests }
SptClassProcessorTest >> testFindGTClassProcessorTestAfterAddingTest [

	self runForText: 'sptclass'.
	self rerunWithText: 'sptclassprocess'.
	
	self assertResultsIncludes: self class
]

{ #category : #tests }
SptClassProcessorTest >> testFindGTClassProcessorTestWithPartialText [

	self runForText: 'sptclass'.
	self assertResultsIncludes: self class
]

{ #category : #tests }
SptClassProcessorTest >> testGTClassProcessorIsRemovedAfterUpdatingText [

	self runForText: 'gtclass'.
	self rerunWithText: 'gtclassprocesst'.
	
	self denyResultsIncludes: SptClassProcessor
]

{ #category : #tests }
SptClassProcessorTest >> testPopularStringDoesReturnOnlyTenResults [

	self runForText: 'test'.
	self assertQuantityOfResults: 25.
]

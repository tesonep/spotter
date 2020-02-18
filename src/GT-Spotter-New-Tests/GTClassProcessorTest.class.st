Class {
	#name : #GTClassProcessorTest,
	#superclass : #AbstractGTProcessorTest,
	#category : #'GT-Spotter-New-Tests'
}

{ #category : #tests }
GTClassProcessorTest >> processor [

	^ SptClassProcessor new
]

{ #category : #tests }
GTClassProcessorTest >> testFindGTClassProcessorTest [

	self runForText: 'gtclassprocessortest'.
	self assertResultsIncludes: self class
]

{ #category : #tests }
GTClassProcessorTest >> testFindGTClassProcessorTestAfterAddingTest [

	self runForText: 'gtclass'.
	self rerunWithText: 'gtclassprocess'.
	
	self assertResultsIncludes: self class
]

{ #category : #tests }
GTClassProcessorTest >> testFindGTClassProcessorTestWithPartialText [

	self runForText: 'gtclass'.
	self assertResultsIncludes: self class
]

{ #category : #tests }
GTClassProcessorTest >> testGTClassProcessorIsRemovedAfterUpdatingText [

	self runForText: 'gtclass'.
	self rerunWithText: 'gtclassprocesst'.
	
	self denyResultsIncludes: SptClassProcessor
]

{ #category : #tests }
GTClassProcessorTest >> testPopularStringDoesReturnOnlyTenResults [

	self runForText: 'test'.
	self assertQuantityOfResults: 10.
]

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
SptUnifiedProcessorTest >> testFindThisPackage [

	self runForText: 'gt-spotter-new-tests'.
	self assertResultsIncludes: self class package
]

{ #category : #tests }
SptUnifiedProcessorTest >> testFindThisPackageAfterAddingText [

	self runForText: 'gt-spo'.
	self runForText: 'gt-spotter-new-tests'.

	self assertResultsIncludes: self class package
	
	
]

{ #category : #tests }
SptUnifiedProcessorTest >> testFindThisPackageWithCategory [

	self runForText: '#Packages gt-spotter-new-tests'.
	self assertResultsIncludes: self class package
]

{ #category : #tests }
SptUnifiedProcessorTest >> testFindThisPackageWithOtherCategory [

	self runForText: '#Classes gt-spotter-new-tests'.
	self denyResultsIncludes: self class package
]

{ #category : #tests }
SptUnifiedProcessorTest >> testGTClassProcessorIsRemovedAfterUpdatingText [

	self runForText: 'gtclass'.
	self rerunWithText: 'gtclassprocesst'.
	
	self denyResultsIncludes: SptClassProcessor
]

{ #category : #tests }
SptUnifiedProcessorTest >> testGTSpotterNewIsRemovedAfterAddingText [

	self runForText: 'gt-spotter'.
	self rerunWithText: 'gt-spotter-new-te'.
	
	self denyResultsIncludes: SptClassProcessor package
]

{ #category : #tests }
SptUnifiedProcessorTest >> testPopularStringDoesReturnOnlyTwentyResults [

	self runForText: 'test'.
	self assertQuantityOfResults: 25.
]

{ #category : #tests }
SptUnifiedProcessorTest >> testPopularStringDoesReturnOnlyTwentyResultsForPackage [

	self runForText: '-Test'.
	self assertQuantityOfResults: 25.
]

{ #category : #tests }
SptUnifiedProcessorTest >> testPopularStringDoesReturnOnlyTwentyResultsWithCapital [

	self runForText: 'Test'.
	self assertQuantityOfResults: 25.
]

Class {
	#name : #GTPackageProcessorTest,
	#superclass : #AbstractGTProcessorTest,
	#category : #'GT-Spotter-New-Tests'
}

{ #category : #tests }
GTPackageProcessorTest >> processor [

	^ SptPackageProcessor new
]

{ #category : #tests }
GTPackageProcessorTest >> testFindKernelPackageWithPartialText [

	self runForText: 'ker'.
	self assertResultsIncludes: Object package
]

{ #category : #tests }
GTPackageProcessorTest >> testFindThisPackage [

	self runForText: 'gt-spotter-new-tests'.
	self assertResultsIncludes: self class package
]

{ #category : #tests }
GTPackageProcessorTest >> testFindThisPackageAfterAddingText [

	self runForText: 'gt-spo'.
	self runForText: 'gt-spotter-new-tests'.

	self assertResultsIncludes: self class package
	
	
]

{ #category : #tests }
GTPackageProcessorTest >> testGTSpotterNewIsRemovedAfterAddingText [

	self runForText: 'gt-spotter'.
	self rerunWithText: 'gt-spotter-new-te'.
	
	self denyResultsIncludes: SptClassProcessor package
]

{ #category : #tests }
GTPackageProcessorTest >> testPopularStringDoesReturnOnlyTenResults [

	self runForText: 'test'.
	self assertQuantityOfResults: 10.
]

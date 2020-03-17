Class {
	#name : #SptClassProcessorWithIndexTest,
	#superclass : #SptClassProcessorTest,
	#category : #'GT-Spotter-New-Indexes-Tests'
}

{ #category : #running }
SptClassProcessorWithIndexTest >> setUp [ 
	
	super setUp.
	SptSourceWithIndexFactory forTest
]

Class {
	#name : #SptImplementorsProcessorWithIndexTest,
	#superclass : #SptImplementorsProcessorTest,
	#category : #'GT-Spotter-New-Indexes-Tests'
}

{ #category : #running }
SptImplementorsProcessorWithIndexTest >> setUp [ 
	
	super setUp.
	SptSourceWithIndexFactory forTest
]

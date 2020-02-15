Class {
	#name : #GTMockCandidatesList,
	#superclass : #Object,
	#instVars : [
		'results',
		'totalResults'
	],
	#category : #'GT-Spotter-New-Tests'
}

{ #category : #adding }
GTMockCandidatesList >> addAllCandidates: aCollection in: aProcessor [

	results removeAll.
	results addAll: aCollection
]

{ #category : #adding }
GTMockCandidatesList >> addObject: anObject inProcessor: aProcessor [

	results add: anObject
]

{ #category : #adding }
GTMockCandidatesList >> addObjects: aCollection inProcessor: aProcessor [

	results addAll: aCollection
]

{ #category : #adding }
GTMockCandidatesList >> initialize [ 
	
	super initialize.
	results := OrderedCollection new
]

{ #category : #adding }
GTMockCandidatesList >> onAmountChanged: aQuantity in: processor [

	totalResults := aQuantity
]

{ #category : #accessing }
GTMockCandidatesList >> results [
	^ results
]

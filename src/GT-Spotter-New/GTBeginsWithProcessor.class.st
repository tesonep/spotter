Class {
	#name : #GTBeginsWithProcessor,
	#superclass : #Object,
	#instVars : [
		'order'
	],
	#category : #'GT-Spotter-New'
}

{ #category : #filtering }
GTBeginsWithProcessor >> filterInContext: aSpotterContext [ 

	| filter results |
	aSpotterContext text ifEmpty: [ ^ self ].
	
	filter := BeginsWithFilter on: (GeneratorIterator on: self originalCollection).
	filter filter: aSpotterContext text.
	results := filter next: self maxResults.
	
	aSpotterContext stream 
		performSymbol: #addAllCandidates:in:
		withArguments: { results collect: [ :each | self objectForName: each]. self }.
	
	(results size = self maxResults ) ifTrue: [ ^ self ].
	
	aSpotterContext stream 
		performSymbol: #onAmountChanged:in:
		withArguments: { results size. self }
	
]

{ #category : #configuration }
GTBeginsWithProcessor >> maxResults [

	^ 10
]

{ #category : #filtering }
GTBeginsWithProcessor >> objectForName: each [

	^ self subclassResponsibility 
]

{ #category : #accessing }
GTBeginsWithProcessor >> order [
	
	^ order
]

{ #category : #accessing }
GTBeginsWithProcessor >> order: anObject [
	order := anObject
]

{ #category : #filtering }
GTBeginsWithProcessor >> originalCollection [

	self subclassResponsibility 
]

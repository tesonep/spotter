Class {
	#name : #GTBeginsWithProcessor,
	#superclass : #Object,
	#instVars : [
		'order',
		'filter'
	],
	#category : #'GT-Spotter-New'
}

{ #category : #filtering }
GTBeginsWithProcessor >> filterInContext: aSpotterContext [ 

	| results |

	(aSpotterContext text isEmpty) ifTrue: [ ^ self ].
	
	filter filter: aSpotterContext text.
	results := filter get: self maxResults.
	
	aSpotterContext stream 
		performSymbol: #addAllCandidates:in:
		withArguments: { results collect: [ :each | self objectForName: each]. self }.
	
	(results size = self maxResults ) ifTrue: [ ^ self ].
	
	aSpotterContext stream 
		performSymbol: #onAmountChanged:in:
		withArguments: { results size. self }
	
]

{ #category : #filtering }
GTBeginsWithProcessor >> initialize [

	super initialize.
	filter := self newFilter.

]

{ #category : #configuration }
GTBeginsWithProcessor >> maxResults [

	^ 10
]

{ #category : #filtering }
GTBeginsWithProcessor >> newFilter [

	^ HasSubStringFilter on: self newIterator
]

{ #category : #filtering }
GTBeginsWithProcessor >> newIterator [

	^ GeneratorIterator on: self originalCollection
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

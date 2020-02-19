Class {
	#name : #SptQuery,
	#superclass : #Object,
	#instVars : [
		'query',
		'spotterContext',
		'processor',
		'modifiers'
	],
	#category : #'GT-Spotter-New-Query'
}

{ #category : #results }
SptQuery >> addResult: anEntry [

	spotterContext stream
		performSymbol: #addCandidate:in:
		withArguments: {anEntry. processor }.


]

{ #category : #accessing }
SptQuery >> categoriesSelected [

	^ modifiers 
]

{ #category : #results }
SptQuery >> filterClasses [

	modifiers add: #Classes.
	self updateSearchingMorph
]

{ #category : #results }
SptQuery >> filterImplementors [

	modifiers add: #Implementors.
	self updateSearchingMorph
]

{ #category : #results }
SptQuery >> informAllResultAmount: anInteger [ 

	spotterContext stream
		performSymbol: #onAmountChanged:in:
		withArguments: {anInteger. processor }.
	
]

{ #category : #results }
SptQuery >> initialize [

	super initialize.
	modifiers := OrderedCollection new.
	query:= ''.
]

{ #category : #testing }
SptQuery >> isSearchEmpty [

	^ query isEmpty
]

{ #category : #accessing }
SptQuery >> processor [
	^ processor
]

{ #category : #accessing }
SptQuery >> processor: anObject [
	processor := anObject
]

{ #category : #accessing }
SptQuery >> searchingText [
	
	^ query
]

{ #category : #accessing }
SptQuery >> textInSearchBar [
	^ String
		streamContents: [ :s | 
			modifiers do: [ :e | s print:e; space ].
			s nextPutAll: query ]
]

{ #category : #updating }
SptQuery >> updateFromContext: aGTSpotterContext [
	| textParts |

	modifiers removeAll.
	textParts := (aGTSpotterContext search ifNil:['']) trimBoth
		substrings:
			{Character space.
			Character tab}.
	query := ''.

	textParts
		do: [ :aPart | 
			(aPart beginsWith: '#')
				ifTrue: [ modifiers add: aPart allButFirst asSymbol. ]
				ifFalse: [ query := (query , ' ' , aPart) trimBoth ] ].
			
	spotterContext := aGTSpotterContext
]

{ #category : #results }
SptQuery >> updateSearchingMorph [

	self processor spotterMorph updateText: self textInSearchBar
]

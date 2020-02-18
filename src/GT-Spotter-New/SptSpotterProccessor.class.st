Class {
	#name : #SptSpotterProccessor,
	#superclass : #Object,
	#instVars : [
		'order',
		'filter'
	],
	#category : #'GT-Spotter-New'
}

{ #category : #filtering }
SptSpotterProccessor >> actOn: anEntry for: aGTSpotterStep [ 

	^ anEntry evaluateFor: aGTSpotterStep
]

{ #category : #filtering }
SptSpotterProccessor >> filter [ 
	
	^ filter ifNil: [ filter := self newSource ]
]

{ #category : #filtering }
SptSpotterProccessor >> filterInContext: aSpotterContext [ 

	| count |

	(aSpotterContext text isEmpty) ifTrue: [ ^ self ].
	

	self filter filteringText: aSpotterContext text.

	count := 0. 

	[ self filter atEnd or: [ count = self maxResults ] ] 
		whileFalse: [ self filter next ifNotNil: [ :aResult | 
				aSpotterContext stream 
					performSymbol: #addCandidate:in:
					withArguments: { aResult. self }.
				count := count + 1.
		]].

	(count = self maxResults ) 
		ifTrue: [ ^ self ].
	
	aSpotterContext stream 
		performSymbol: #onAmountChanged:in:
		withArguments: { count. self }
	
]

{ #category : #filtering }
SptSpotterProccessor >> keyBinding [ 

	^ nil
]

{ #category : #configuration }
SptSpotterProccessor >> maxResults [

	^ 10
]

{ #category : #filtering }
SptSpotterProccessor >> newSource [

	^ self subclassResponsibility
]

{ #category : #accessing }
SptSpotterProccessor >> order [
	
	^ order
]

{ #category : #accessing }
SptSpotterProccessor >> order: anObject [
	order := anObject
]

{ #category : #filtering }
SptSpotterProccessor >> render: anEntry [
		
	^ anEntry render
]

{ #category : #filtering }
SptSpotterProccessor >> title [

	^ self subclassResponsibility
]

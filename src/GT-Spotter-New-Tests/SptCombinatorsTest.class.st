Class {
	#name : #SptCombinatorsTest,
	#superclass : #TestCase,
	#category : #'GT-Spotter-New-Tests'
}

{ #category : #tests }
SptCombinatorsTest >> testBeginsWithFilterDoesNotFetchTwiceIfTheFilterIsARefinementOfPreviousText [

	| it |
	it := (SptGeneratorBlockIterator on: [ :x | x value: 'bbb'; value:'bbb1'; error ]) beginsWithFilter: 'b'.
	it next.
	it beginsWithFilter: 'bb'.
	
	self assert: it next equals: 'bbb'
]

{ #category : #tests }
SptCombinatorsTest >> testBeginsWithFilterReturnsValidResults [

	| it |
	it := (SptCollectionIterator on: { 'aaa'. 'bbb'. 'ccc' }) beginsWithFilter: 'b'.
	self assert: it next equals: 'bbb'
]

{ #category : #tests }
SptCombinatorsTest >> testBeginsWithFilterReturnsValidResultsWithTheSameFilter [

	| it |
	it := (SptCollectionIterator on: { 'aaa'. 'bbb'. 'ccc' }) beginsWithFilter: 'b'.
	it beginsWithFilter: 'b'.
	
	self assert: it next equals: 'bbb'
]

{ #category : #tests }
SptCombinatorsTest >> testIteratorOnACollectedCollectionIsFiltered [

	| it |

	it := ((SptCollectionIterator on: #(1 2 3)) 
		collect: [ :e | e * 2 ])
		select: [:e | e even].

	self assertCollection: (it next: 3) hasSameElements: #(2 4 6).

]

{ #category : #tests }
SptCombinatorsTest >> testIteratorOnACollectionIsFiltered [

	| it |

	it := (SptCollectionIterator on: #(1 2 3)) select: [:e | e even].

	self assertCollection: (it next: 3) hasSameElements: #(2).

]

{ #category : #tests }
SptCombinatorsTest >> testIteratorOnACollectionReturnsTheCollection [

	| it |
	it := SptCollectionIterator on: #(1 2 3).
	self assertCollection: (it next:3) hasSameElements: #(1 2 3)
]

{ #category : #tests }
SptCombinatorsTest >> testIteratorOnACollectionReturnsTheFirstValue [

	| it |

	it := SptCollectionIterator on: #(1 2 3).
	self assert: (it next) equals: 1
]

{ #category : #tests }
SptCombinatorsTest >> testIteratorOnACollectionReturnsTheFirstValueAndSecondValue [

	| it |

	it := SptCollectionIterator on: #(1 2 3).
	self assert: (it next) equals: 1.
	self assert: (it next) equals: 2	
]

{ #category : #tests }
SptCombinatorsTest >> testIteratorOnACollectionWithCollectReturnsCorrectFirstValue [

	| it |

	it := (SptCollectionIterator on: #(1 2 3)) collect: [:e | e * 3].

	self assert: (it next) equals: 3.

]

{ #category : #tests }
SptCombinatorsTest >> testIteratorOnACollectionWithCollectReturnsCorrectValues [

	| it |

	it := (SptCollectionIterator on: #(1 2 3)) collect: [:e | e * 3].

	self assertCollection: (it next: 3) hasSameElements: #(3 6 9).

]

{ #category : #tests }
SptCombinatorsTest >> testIteratorOnACollectionWithTwoCollectReturnsCorrectFirstValue [

	| it |

	it := ((SptCollectionIterator on: #(1 2 3)) collect: [:e | e * 3]) collect: [:e | e * 2].

	self assert: (it next) equals: 6.

]

{ #category : #tests }
SptCombinatorsTest >> testIteratorOnACollectionWithTwoCollectReturnsCorrectValues [

	| it |

	it := ((SptCollectionIterator on: #(1 2 3)) collect: [:e | e * 3]) collect: [:e | e * 2].

	self assertCollection: (it next: 3) hasSameElements: #(6 12 18).

]

{ #category : #tests }
SptCombinatorsTest >> testSequenceDetectsAtEnd [

	| it |
	it := (SptCollectionIterator on: #(1 2 3)) , (SptCollectionIterator on: #(4 5 6)).
	it next: 3.
	self deny: it atEnd.
	it next: 3.
	self assert: it atEnd.
		

	
]

{ #category : #tests }
SptCombinatorsTest >> testSequenceReturnsTheSequenceOfAllResults [

	| it |
	it := (SptCollectionIterator on: #(1 2 3)) , (SptCollectionIterator on: #(4 5 6)).
	
	self assertCollection: (it next: 6) hasSameElements: #(1 2 3 4 5 6)
]

{ #category : #tests }
SptCombinatorsTest >> testSequenceReturnsTheSequenceOfAllResultsInParts [

	| it |
	it := (SptCollectionIterator on: #(1 2 3)) , (SptCollectionIterator on: #(4 5 6)).
	
	self assertCollection: (it next: 3) hasSameElements: #(1 2 3).
	self assertCollection: (it next: 3) hasSameElements: #(4 5 6)	
]

{ #category : #tests }
SptCombinatorsTest >> testSubstringFilterDoesNotFetchTwiceIfTheFilterIsARefinementOfPreviousText [

	| it |
	it := (SptGeneratorBlockIterator on: [ :x | x value: '1bbb'; value:'11bbb1'; error ]) substringFilter: 'b'.
	it next.
	it substringFilter: 'bb'.
	
	self assert: it next equals: '1bbb'
]

{ #category : #tests }
SptCombinatorsTest >> testSubstringFilterReturnsValidResults [

	| it |
	it := (SptCollectionIterator on: { 'xxxaaa'. 'xxxbbb'. 'xxxccc' }) substringFilter: 'b'.
	self assert: it next equals: 'xxxbbb'
]

{ #category : #tests }
SptCombinatorsTest >> testSubstringFilterReturnsValidResultsWithTheSameFilter [

	| it |
	it := (SptCollectionIterator on: { 'aaa'. 'xxxbbb'. 'ccc' }) substringFilter: 'b'.
	it substringFilter: 'b'.
	
	self assert: it next equals: 'xxxbbb'
]

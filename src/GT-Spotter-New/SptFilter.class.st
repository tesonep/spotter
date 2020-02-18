Class {
	#name : #SptFilter,
	#superclass : #SptIteratorBlockDecorator,
	#category : #'GT-Spotter-New'
}

{ #category : #initialization }
SptFilter >> filter: aValue [

	^ aBlock value: aValue
]

{ #category : #initialization }
SptFilter >> next [

	| value |

	[ inner atEnd ]
		whileFalse: [ value := inner next.
			(self filter: value)
				ifTrue: [ ^ value ] ].
	^ nil
]

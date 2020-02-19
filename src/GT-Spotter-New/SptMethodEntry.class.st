Class {
	#name : #SptMethodEntry,
	#superclass : #SptEntry,
	#category : #'GT-Spotter-New-Entries'
}

{ #category : #accessing }
SptMethodEntry >> asString [

	^ content selector
]

{ #category : #accessing }
SptMethodEntry >> doEvaluate [

	content browse
]

{ #category : #accessing }
SptMethodEntry >> render [ 

	^ GTSpotterItemBrick new
		icon: content systemIcon;
		text: content gtDisplayString
]

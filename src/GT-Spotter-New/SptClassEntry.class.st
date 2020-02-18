Class {
	#name : #SptClassEntry,
	#superclass : #SptEntry,
	#category : #'GT-Spotter-New'
}

{ #category : #accessing }
SptClassEntry >> asString [

	^ content name
]

{ #category : #accessing }
SptClassEntry >> doEvaluate [

	content browse
]

{ #category : #accessing }
SptClassEntry >> render [ 

	^ GTSpotterItemBrick new
		icon: content systemIcon;
		text: content gtDisplayString
]

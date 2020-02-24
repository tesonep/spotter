"
I wrap a Class or Trait entry, to modify its behavior if required for the class
"
Class {
	#name : #SptClassEntry,
	#superclass : #SptEntry,
	#category : #'GT-Spotter-New-Entries'
}

{ #category : #accessing }
SptClassEntry >> asString [

	^ content name
]

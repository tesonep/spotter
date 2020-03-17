Class {
	#name : #SptSourceWithIndexFactory,
	#superclass : #SptSourceFactory,
	#category : #'GT-Spotter-New-Indexes'
}

{ #category : #'detecting implementations' }
SptSourceWithIndexFactory class >> isAvailable [ 

	^ AlpIndexManager isActive
]

{ #category : #'detecting implementations' }
SptSourceWithIndexFactory class >> priority [ 

	^ 10
]

{ #category : #'sources - classes' }
SptSourceWithIndexFactory >> classesBeginsWithSource [

	 ^ SptClassBeginsWithWithIndex new
]

{ #category : #'sources - classes' }
SptSourceWithIndexFactory >> classesSubstringSource [

	^ SptClassSubstringWithIndex new
]

{ #category : #'sources - implementors' }
SptSourceWithIndexFactory >> implementorsBeginsWithSource [

	^ SptImplementorsBeginsWithWithIndex new
]

{ #category : #'sources - implementors' }
SptSourceWithIndexFactory >> implementorsSubstringSource [

	^ SptImplementorsSubstringWithIndex new
]

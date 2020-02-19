Class {
	#name : #SptPackageProcessor,
	#superclass : #SptSpotterProccessor,
	#category : #'GT-Spotter-New-Processors'
}

{ #category : #filtering }
SptPackageProcessor >> newSource [

	^ SptPackageIterator new collect: [ :e | SptClassEntry on: e ]
]

{ #category : #accessing }
SptPackageProcessor >> title [
	^ 'Packages'
]

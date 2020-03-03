Class {
	#name : #SptCatalogProjectsProcessor,
	#superclass : #SptCollectionBasedProcessor,
	#category : #'GT-Spotter-New-Processors'
}

{ #category : #'default-settings' }
SptCatalogProjectsProcessor class >> defaultEnabled [

	^ true
]

{ #category : #filtering }
SptCatalogProjectsProcessor >> collection [

	^ CatalogProvider default projects
]

{ #category : #filtering }
SptCatalogProjectsProcessor >> newEntryOn: anElement [

	^ SptCatalogProjectEntry on: anElement
]

{ #category : #accessing }
SptCatalogProjectsProcessor >> order [
	
	^ 90
]

{ #category : #accessing }
SptCatalogProjectsProcessor >> title [

	^ 'Catalog Projects'
]

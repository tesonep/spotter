Extension { #name : #MenuMorph }

{ #category : #'*GT-Spotter-New' }
MenuMorph >> withAllLeafItemsDo: aBlockClosure [ 
	
	self items do: [:anItem | anItem withAllLeafItemsDo: aBlockClosure]
]

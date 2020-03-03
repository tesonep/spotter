Extension { #name : #MenuItemMorph }

{ #category : #'*GT-Spotter-New' }
MenuItemMorph >> withAllLeafItemsDo: aBlockClosure [

	self subMenu ifNil: [ ^ aBlockClosure cull: self ].
	self subMenu items do: [ :anItem | anItem withAllLeafItemsDo: aBlockClosure ]
]

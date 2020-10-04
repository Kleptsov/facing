Class {
	#name : #FMorphController,
	#superclass : #FMicroController,
	#category : #'Facing-Core'
}

{ #category : #updating }
FMorphController >> updateMorph: aModel [
	| morphRenderer new |
	morphRenderer := aModel morphRenderer.
	new := morphRenderer render: aModel selector: selector.
	^ canvas
		ifNotNil: [ canvas owner
						ifNotNil: [canvas owner replaceSubmorph: canvas by: new. ]
						ifNil: [ canvas := new ] ]
		ifNil: [ canvas := new ].
]

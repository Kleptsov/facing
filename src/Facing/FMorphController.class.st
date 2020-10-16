Class {
	#name : #FMorphController,
	#superclass : #FMicroController,
	#category : #'Facing-Core'
}

{ #category : #updating }
FMorphController >> updateMorph [
	| morphRenderer new sub |
	sub := model perform: selector.
	morphRenderer := sub morphRenderer.
	new := morphRenderer render: sub selector: selector.
	^ canvas
		ifNotNil: [ canvas owner
						ifNotNil: [canvas owner replaceSubmorph: canvas by: new. ]
						ifNil: [ canvas := new ] ]
		ifNil: [ canvas := new ].
]

{ #category : #updating }
FMorphController >> updateView [
	^ self updateMorph.
]

Class {
	#name : #FMorphController,
	#superclass : #FMicroController,
	#instVars : [
		'morphBehavior',
		'morphFinalize'
	],
	#category : #'Facing-Core'
}

{ #category : #accessing }
FMorphController >> morphBehavior [
	^ morphBehavior ifNil: [ morphBehavior := [ :m| ] ]
]

{ #category : #accessing }
FMorphController >> morphBehavior: anObject [
	morphBehavior := anObject
]

{ #category : #accessing }
FMorphController >> morphFinalize [
	^ morphFinalize ifNil: [ morphFinalize := [ :m| ] ]
]

{ #category : #accessing }
FMorphController >> morphFinalize: anObject [
	morphFinalize := anObject
]

{ #category : #updating }
FMorphController >> updateMorph [
	| morphRenderer new sub |
	sub := model perform: selector.
	morphRenderer := sub morphRenderer.
	new := morphRenderer render: sub selector: selector.
	new setProperty: #fController toValue: self. "self no gc"
	self morphBehavior value: new.
	self morphFinalize value: canvas.
	canvas
		ifNotNil: [ canvas setProperty: #fController toValue: nil.
						canvas owner
							ifNotNil: [canvas owner replaceSubmorph: canvas by: new ] ].
	^ canvas := new.
]

{ #category : #updating }
FMorphController >> updateView [
	^ self updateMorph.
]

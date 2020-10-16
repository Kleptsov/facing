Class {
	#name : #FMicroController,
	#superclass : #Object,
	#instVars : [
		'canvas',
		'selector',
		'submodel',
		'model'
	],
	#category : #'Facing-Core'
}

{ #category : #updating }
FMicroController >> listen: aSelector from: aModel [
	selector := aSelector.
	aModel addDependent: self.
	model := aModel.
	^ self update: aSelector with: model.
]

{ #category : #accessing }
FMicroController >> selector [
	^ selector
]

{ #category : #accessing }
FMicroController >> selector: anObject [
	selector := anObject
]

{ #category : #updating }
FMicroController >> update: aSelector with: aModel [

	^ selector == aSelector
			ifTrue: [ model := aModel.
						self updateView ]
			ifFalse: [ nil ]
]

{ #category : #updating }
FMicroController >> updateMorph [
	| morphRenderer new |
	morphRenderer := model morphRenderer.
	new := morphRenderer render: model selector: selector.
	^ canvas
		ifNotNil: [ canvas owner
						ifNotNil: [canvas owner replaceSubmorph: canvas by: new. ]
						ifNil: [ canvas := new ] ]
		ifNil: [ canvas := new ].
]

{ #category : #updating }
FMicroController >> updateView [
	^ self subclassResponsibility
]

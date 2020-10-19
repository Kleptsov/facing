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

{ #category : #updating }
FMicroController >> update: aSelector with: aModel [

	^ selector == aSelector
			ifTrue: [ model := aModel.
						self updateView ]
			ifFalse: [ nil ]
]

{ #category : #updating }
FMicroController >> updateView [
	^ self subclassResponsibility
]

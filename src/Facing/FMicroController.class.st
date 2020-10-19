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
FMicroController >> updateView [
	^ self subclassResponsibility
]

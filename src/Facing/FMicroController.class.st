Class {
	#name : #FMicroController,
	#superclass : #Object,
	#instVars : [
		'canvas',
		'selector'
	],
	#category : #'Facing-Core'
}

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

	selector == aSelector
		ifTrue: [ self updateModel: aModel ]
]

{ #category : #updating }
FMicroController >> updateModel: aModel [
	^ self subclassResponsibility
]

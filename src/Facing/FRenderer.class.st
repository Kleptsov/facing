Class {
	#name : #FRenderer,
	#superclass : #Object,
	#category : #Facing
}

{ #category : #rendering }
FRenderer >> render: aModel order: anOrder [
	self subclassResponsibility.
]

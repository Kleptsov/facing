Class {
	#name : #FProxyController,
	#superclass : #FMorphController,
	#category : #'Facing-Core'
}

{ #category : #updating }
FProxyController >> updateView [
	canvas ifNil: [ self updateMorph ].
	model changed: selector.
	^ canvas
]

Class {
	#name : #FProxyController,
	#superclass : #FMorphController,
	#category : #'Facing-Core'
}

{ #category : #updating }
FProxyController >> updateModel: aModel [
	canvas ifNil: [ self updateMorph: aModel ].
	aModel changed: selector.
	^ canvas
]

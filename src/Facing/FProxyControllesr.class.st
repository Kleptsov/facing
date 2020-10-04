Class {
	#name : #FProxyControllesr,
	#superclass : #FMorphController,
	#category : #'Facing-Core'
}

{ #category : #updating }
FProxyControllesr >> updateModel: aModel [
	canvas ifNil: [ self updateMorph: aModel ].
	aModel changed: selector.
	^ canvas
]

Class {
	#name : #FDirectController,
	#superclass : #FMorphController,
	#category : #'Facing-Core'
}

{ #category : #updating }
FDirectController >> updateModel: aModel [
	^ self updateMorph: aModel.
]

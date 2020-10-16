Class {
	#name : #FTextModelRenderer,
	#superclass : #FMorphRenderer,
	#category : #'Facing-Model'
}

{ #category : #rendering }
FTextModelRenderer >> render [
	^ FTextField on: model selector: #val.
]

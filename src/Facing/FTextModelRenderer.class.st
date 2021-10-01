Class {
	#name : #FTextModelRenderer,
	#superclass : #FMorphRenderer,
	#category : #'Facing-Model'
}

{ #category : #rendering }
FTextModelRenderer >> render [
	| textField |
	"^ FTextField on: model selector: #val."
	textField := FRubTextFieldArea new.
	textField
		model: model; selector: #val.
	textField extent: 10@52; beWrapped.
	textField vResizing: #spaceFill.
	textField hResizing: #spaceFill.
	^ textField
]

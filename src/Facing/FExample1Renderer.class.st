Class {
	#name : #FExample1Renderer,
	#superclass : #FMorphRenderer,
	#category : #'Facing-Example'
}

{ #category : #rendering }
FExample1Renderer >> render [
	| a b c d e f |
	a := FText on: model label: 'a' selector: #a.
	a extent: 250@40.
	b := FText on: model label: 'b' selector: #c.
	b extent: 250@40; hResizing: #spaceFill.
	c := FText on: model label: 'c' selector: #a.
	d := FText on: model label: 'd' selector: #c.
	e := FText on: model label: 'e' selector: #b.
	f := FText on: model label: 'f' selector: #b.
	self owner addMorphBack: a; addMorphBack: b; addMorphBack: c; addMorphBack: d; addMorphBack: e; addMorphBack: f.
	^ owner.
]

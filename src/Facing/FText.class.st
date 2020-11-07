Class {
	#name : #FText,
	#superclass : #Morph,
	#instVars : [
		'aLabel',
		'label',
		'labelMorph',
		'textModel',
		'text',
		'accept',
		'acceptAction',
		'textField',
		'morph'
	],
	#category : #'Facing-Morphs'
}

{ #category : #creating }
FText class >> on: model label: aLabel selector: aSelector [

^ self new
	textModel: model;
	label: aLabel;
	text: aSelector;
	accept: aSelector, ':';
	acceptAction: [ :a| ];
	initializeMorph.
]

{ #category : #creating }
FText class >> on: model label: aLabel text: aText accept: anAccept acceptAction: anAction [

^ self new
	textModel: model;
	label: aLabel;
	text: aText;
	accept: anAccept;
	acceptAction: anAction;
	initializeMorph.

"| labelMorph  m txtField |
labelMorph := StringMorph contents: anLabel.
	
txtField := ATextField on: model text: aText accept: anAccept acceptAction: anAction.
txtField setProperty: #relativeExtent toValue: 1.0@0.5. 

m := Morph new
		layoutPolicy: (AAbsoluteRelativeLayout new direction: #rightUp);
		extent: 300@60;
		addMorph: txtField;
		addMorph: labelMorph.
m color: (m color alpha: 0.0).
^ m"
]

{ #category : #accessing }
FText >> accept [
	^ accept
]

{ #category : #accessing }
FText >> accept: anObject [
	accept := anObject
]

{ #category : #accessing }
FText >> acceptAction [
	^ acceptAction ifNil: [ acceptAction := [  ] ]
]

{ #category : #accessing }
FText >> acceptAction: anObject [
	acceptAction := anObject
]

{ #category : #initialization }
FText >> initializeLabel [
	labelMorph := StringMorph contents: self label.
	"labelMorph extent: 100@17."
	labelMorph hResizing: #spaceFill.
]

{ #category : #initialization }
FText >> initializeMorph [
	self initializeLabel.
	self initializeTextField.
	self
		layoutPolicy: (AAbsoluteRelativeLayout new direction: #rightDown);
		extent: 300@100;
		addMorph: labelMorph;
		addMorph: textField;
		color: (self color alpha: 0.0).
]

{ #category : #initialization }
FText >> initializeTextField [
	textField := FRubTextFieldArea new.
	textField
		model: textModel; selector: text.
	textField extent: 10@52; beWrapped.
	textField vResizing: #spaceFill.
	textField hResizing: #spaceFill.
]

{ #category : #accessing }
FText >> label [
	^ label
]

{ #category : #accessing }
FText >> label: anObject [
	label := anObject
]

{ #category : #accessing }
FText >> labelMorph [
	^ labelMorph
]

{ #category : #accessing }
FText >> labelMorph: anObject [
	labelMorph := anObject
]

{ #category : #accessing }
FText >> morph [
	^ morph
]

{ #category : #accessing }
FText >> morph: anObject [
	morph := anObject
]

{ #category : #accessing }
FText >> text [
	^ text
]

{ #category : #accessing }
FText >> text: anObject [
	text := anObject
]

{ #category : #accessing }
FText >> textField [
	^ textField
]

{ #category : #accessing }
FText >> textField: anObject [
	textField := anObject
]

{ #category : #accessing }
FText >> textModel [
	^ textModel
]

{ #category : #accessing }
FText >> textModel: anObject [
	textModel := anObject
]

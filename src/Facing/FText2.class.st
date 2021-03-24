Class {
	#name : #FText2,
	#superclass : #Morph,
	#instVars : [
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
FText2 class >> on: model label: aLabel selector: aSelector [

^ self new
	textModel: model;
	label: aLabel;
	text: aSelector;
	accept: aSelector, ':';
	acceptAction: [ :a| ];
	initializeMorph.
]

{ #category : #creating }
FText2 class >> on: model label: aLabel text: aText accept: anAccept acceptAction: anAction [

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

{ #category : #initialization }
FText2 >> initialize [
	super initialize.
	self initializeMorph.
]

{ #category : #initialization }
FText2 >> initializeLabel [
	labelMorph := StringMorph contents: self label.
	"labelMorph extent: 100@17."
	labelMorph hResizing: #spaceFill.
]

{ #category : #initialization }
FText2 >> initializeMorph [
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
FText2 >> initializeTextField [
	textField := FRubTextFieldArea2 new.
	textField extent: 10@52;
		beWrapped;
		vResizing: #spaceFill;
		hResizing: #spaceFill.
]

{ #category : #accessing }
FText2 >> label [
	^ label
]

{ #category : #accessing }
FText2 >> label: anObject [
	label := anObject
]

{ #category : #accessing }
FText2 >> labelMorph [
	^ labelMorph
]

{ #category : #accessing }
FText2 >> labelMorph: anObject [
	labelMorph := anObject
]

{ #category : #accessing }
FText2 >> morph [
	^ morph
]

{ #category : #accessing }
FText2 >> morph: anObject [
	morph := anObject
]

{ #category : #accessing }
FText2 >> text [
	text
]

{ #category : #accessing }
FText2 >> text: anObject [
	text := anObject
]

{ #category : #accessing }
FText2 >> textField [
	^ textField
]

{ #category : #accessing }
FText2 >> textField: anObject [
	textField := anObject
]

{ #category : #accessing }
FText2 >> textModel [
	^ textModel
]

{ #category : #accessing }
FText2 >> textModel: anObject [
	textModel := anObject
]

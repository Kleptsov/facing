Class {
	#name : #FLabeledText,
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
	#category : #'Facing-Example'
}

{ #category : #creating }
FLabeledText class >> on: model label: aLabel selector: aSelector [

^ self new
	textModel: model;
	label: aLabel;
	text: aSelector;
	accept: aSelector, ':';
	acceptAction: [ :a| ];
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

{ #category : #creating }
FLabeledText class >> on: model label: aLabel text: aText accept: anAccept acceptAction: anAction [

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
FLabeledText >> accept [
	^ accept
]

{ #category : #accessing }
FLabeledText >> accept: anObject [
	accept := anObject
]

{ #category : #accessing }
FLabeledText >> acceptAction [
	^ acceptAction
]

{ #category : #accessing }
FLabeledText >> acceptAction: anObject [
	acceptAction := anObject
]

{ #category : #initialization }
FLabeledText >> initializeLabel [
	labelMorph := StringMorph contents: self label
]

{ #category : #initialization }
FLabeledText >> initializeMorph [
	self initializeLabel.
	self initializeTextField.
	self
		layoutPolicy: (AAbsoluteRelativeLayout new direction: #rightUp);
		extent: 300@60;
		addMorph: textField;
		addMorph: labelMorph;
		color: (self color alpha: 0.0).
]

{ #category : #initialization }
FLabeledText >> initializeTextField [
	textField := ATextField on: textModel text: text accept: accept acceptAction: acceptAction.
	textField setProperty: #relativeExtent toValue: 1.0@0.5. 
]

{ #category : #accessing }
FLabeledText >> label [
	^ label
]

{ #category : #accessing }
FLabeledText >> label: anObject [
	label := anObject
]

{ #category : #accessing }
FLabeledText >> labelMorph [
	^ labelMorph
]

{ #category : #accessing }
FLabeledText >> labelMorph: anObject [
	labelMorph := anObject
]

{ #category : #accessing }
FLabeledText >> morph [
	^ morph
]

{ #category : #accessing }
FLabeledText >> morph: anObject [
	morph := anObject
]

{ #category : #accessing }
FLabeledText >> text [
	^ text
]

{ #category : #accessing }
FLabeledText >> text: anObject [
	text := anObject
]

{ #category : #accessing }
FLabeledText >> textField [
	^ textField
]

{ #category : #accessing }
FLabeledText >> textField: anObject [
	textField := anObject
]

{ #category : #accessing }
FLabeledText >> textModel [
	^ textModel
]

{ #category : #accessing }
FLabeledText >> textModel: anObject [
	textModel := anObject
]

Class {
	#name : #FRubTextFieldArea,
	#superclass : #RubEditingArea,
	#instVars : [
		'selector',
		'isChanging'
	],
	#category : #'Facing-Morphs'
}

{ #category : #'as yet unclassified' }
FRubTextFieldArea >> defaultMargins [

	^ Margin left: 1 right: 1 top: 1 bottom: 1
]

{ #category : #initialize }
FRubTextFieldArea >> initialize [
	super initialize.
	
]

{ #category : #accessing }
FRubTextFieldArea >> isChanging [
	^ isChanging ifNil: [ isChanging := false ].
]

{ #category : #accessing }
FRubTextFieldArea >> isChanging: aBoolean [
	isChanging := aBoolean.
]

{ #category : #accessing }
FRubTextFieldArea >> model: aModel [
	super model: aModel.
	model ifNil: [ ^ self ].
	model addDependent: self.
	self announcer when: RubTextChanged do: [ :a|
		self isChanging: true.		
		model perform: (self selector, #':') with: editor text string.
		self isChanging: false. ].
	selector ifNotNil: [model changed: selector].
]

{ #category : #accessing }
FRubTextFieldArea >> selector [
	^ (selector ifNil: [ #yourself ]) asSymbol
]

{ #category : #accessing }
FRubTextFieldArea >> selector: anObject [
	selector := anObject.
	model ifNotNil: [ model changed: selector ].
]

{ #category : #accessing }
FRubTextFieldArea >> source: aModel selector: aSelector [
	super model: aModel.
	selector := aSelector.
	model ifNil: [ ^ self ].
	model addEvent: #updateText: receiver: self.
	self addEvent: aSelector asSymbol receiver: model.
	self announcer when: RubTextChanged do: [ :a|
		self isChanging: true.		
		self sEvent: aSelector asSymbol arg: editor text string.
		self isChanging: false. ].
	selector ifNotNil: [model sEvent: #updateText arg: (model perform: selector)].
]

{ #category : #accessing }
FRubTextFieldArea >> update: aSelector [
	aSelector = selector
		ifFalse: [ ^ self ].
	self isChanging
		ifTrue: [ ^ self ].
	self "updateTextWith"privateText: (model perform: aSelector asSymbol) asString.
]

{ #category : #accessing }
FRubTextFieldArea >> update: aSelector with: anObject [
	anObject = #forcibly ifFalse: [ 
		aSelector = selector ifFalse: [ ^ self ].
		self isChanging ifTrue: [ ^ self ] ].
	self updateTextWith:"privateText:" (model perform: aSelector asSymbol) asString.
]

{ #category : #accessing }
FRubTextFieldArea >> updateText: aSelector [
	aSelector = selector
		ifFalse: [ ^ self ].
	self isChanging
		ifTrue: [ ^ self ].
	self updateTextWith:"privateText" (model perform: aSelector asSymbol) asString.
]

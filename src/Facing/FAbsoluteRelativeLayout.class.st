Class {
	#name : #FAbsoluteRelativeLayout,
	#superclass : #LayoutPolicy,
	#instVars : [
		'height',
		'carriage',
		'box',
		'direction'
	],
	#category : #'Facing-Core'
}

{ #category : #examples }
FAbsoluteRelativeLayout class >> createSubmorphsFor: aMorph [
	| m1 m2 m3 w |
	5
		timesRepeat: [ m1 := Morph new.
			m1 color: Color random.
			m1 extent: 300 atRandom @ 300 atRandom.
			aMorph addMorph: m1 ].
	m2 := Morph new.
	m2 color: Color random.
	m2 setProperty: #relativeExtent toValue: 0.4 @ 0.2.
	aMorph addMorph: m2.
	m3 := Morph new.
	m3 color: Color random.
	m3 extent: 100 @ 100.
	m3 hResizing: #spaceFill.
	aMorph addMorph: m3.
	w := StandardWindow new.
	w addMorph: aMorph frame: LayoutFrame new.
	^ w open
]

{ #category : #examples }
FAbsoluteRelativeLayout class >> example1 [
	| m |
	m := Morph new.
	m color: Color blue.
	m layoutPolicy: (self new direction: #rightDown).
	self createSubmorphsFor: m
]

{ #category : #examples }
FAbsoluteRelativeLayout class >> example2 [
	| m |
	m := Morph new.
	m color: Color blue.
	m layoutPolicy: (self new direction: #leftDown).
	self createSubmorphsFor: m
]

{ #category : #examples }
FAbsoluteRelativeLayout class >> example3 [
	| m |
	m := Morph new.
	m color: Color blue.
	m layoutPolicy: (self new direction: #rightUp).
	self createSubmorphsFor: m
]

{ #category : #examples }
FAbsoluteRelativeLayout class >> example4 [
	| m |
	m := Morph new.
	m color: Color blue.
	m layoutPolicy: (self new direction: #leftUp).
	self createSubmorphsFor: m
]

{ #category : #layout }
FAbsoluteRelativeLayout >> direction: aDirection [
	direction := aDirection
	
]

{ #category : #accessing }
FAbsoluteRelativeLayout >> height [
	^ height ifNil: [ height := 0 ]
]

{ #category : #initialization }
FAbsoluteRelativeLayout >> initialize [
	super initialize.
	direction := #rightDown.
]

{ #category : #initialization }
FAbsoluteRelativeLayout >> initializeCarriage [
	direction ifNil: [ ^ self ].
	direction = #rightDown
		ifTrue: [ carriage := box topLeft ].
	direction = #rightUp
		ifTrue: [ carriage := box bottomLeft ].
	direction = #leftDown
		ifTrue: [ carriage := box topRight ].
	direction = #leftUp
		ifTrue: [ carriage := box bottomRight ]
]

{ #category : #layout }
FAbsoluteRelativeLayout >> layout: aMorph in: aBox [
	"Compute the layout for the given morph based on the new bounds"

	aMorph hasSubmorphs
		ifFalse: [ ^ self ].
	box := aBox.
	height := 0.
	self initializeCarriage.
	aMorph submorphsDo: [ :m | self layoutSubmorph: m ]
]

{ #category : #layout }
FAbsoluteRelativeLayout >> layoutSubmorph: aMorph [
	direction = #rightDown
		ifTrue: [ ^ self rightDown: aMorph ].
	direction = #rightUp
		ifTrue: [ ^ self rightUp: aMorph ].
	direction = #leftDown
		ifTrue: [ ^ self leftDown: aMorph ].
	direction = #leftUp
		ifTrue: [ ^ self leftUp: aMorph ]
]

{ #category : #layout }
FAbsoluteRelativeLayout >> leftDown: aSubmorph [
	"укладка справа потом вниз"

	"уложить морф"

	self leftDownLayout: aSubmorph.

	"если морф выходит за пределы переход на новую строку"
	aSubmorph left < box left
		ifTrue: [ carriage := box right @ (carriage y + height).
			"уложить с новой строки"
			height := 0.
			self leftDownLayout: aSubmorph ].
	carriage := aSubmorph left @ aSubmorph top.

	"смещение новой строки"
	self height < aSubmorph height
		ifTrue: [ height := aSubmorph height ]
]

{ #category : #layout }
FAbsoluteRelativeLayout >> leftDownLayout: aSubmorph [
	| ext rExt |
	"укладка обычная"
	ext := aSubmorph extent.
	aSubmorph position: (carriage x - ext x) @ carriage y.
	aSubmorph extent: ext x @ ext y.

	"укладка относительная"
	rExt := aSubmorph valueOfProperty: #relativeExtent ifAbsent: [ nil ].
	rExt
		ifNotNil: [ (rExt x isNil or: [ rExt x = 0 ])
				ifFalse: [ ext := (box extent x * rExt x) @ ext y ].
			(rExt y isNil or: [ rExt y = 0 ])
				ifFalse: [ ext := ext x @ (box extent y * rExt y) ].
			aSubmorph position: (carriage x - ext x) @ carriage y.
			aSubmorph extent: ext ].

	"укладка с заполнением"
	aSubmorph hResizing = #spaceFill
		ifTrue: [ aSubmorph position: box left @ carriage y.
			aSubmorph extent: (carriage x - box left) @ aSubmorph height ].
	aSubmorph vResizing = #spaceFill
		ifFalse: [ ^ self ].
	aSubmorph position: (carriage x - aSubmorph width) @ carriage y.
	aSubmorph extent: aSubmorph width @ (box bottom - carriage y)
]

{ #category : #layout }
FAbsoluteRelativeLayout >> leftUp: aSubmorph [
	"укладка справа потом вниз"

	"уложить морф"

	self leftUpLayout: aSubmorph.

	"если морф выходит за пределы переход на новую строку"
	aSubmorph left < box left
		ifTrue: [ carriage := box right @ (carriage y - height).
			"уложить с новой строки"
			height := 0.
			self leftUpLayout: aSubmorph ].
	carriage := aSubmorph left @ aSubmorph bottom.

	"смещение новой строки"
	self height < aSubmorph height
		ifTrue: [ height := aSubmorph height ]
]

{ #category : #layout }
FAbsoluteRelativeLayout >> leftUpLayout: aSubmorph [
	| ext rExt |
	"укладка обычная"
	ext := aSubmorph extent.
	aSubmorph position: (carriage x - ext x) @ (carriage y - ext y).
	aSubmorph extent: ext x @ ext y.

	"укладка относительная"
	rExt := aSubmorph valueOfProperty: #relativeExtent ifAbsent: [ nil ].
	rExt
		ifNotNil: [ (rExt x isNil or: [ rExt x = 0 ])
				ifFalse: [ ext := (box extent x * rExt x) @ ext y ].
			(rExt y isNil or: [ rExt y = 0 ])
				ifFalse: [ ext := ext x @ (box extent y * rExt y) ].
			aSubmorph position: (carriage x - ext x) @ (carriage y - ext y).
			aSubmorph extent: ext ].

	"укладка с заполнением"
	aSubmorph hResizing = #spaceFill
		ifTrue: [ aSubmorph extent: (carriage x - box left) @ aSubmorph height.
					aSubmorph position: box left @ (carriage y - aSubmorph height). ].
	aSubmorph vResizing = #spaceFill
		ifFalse: [ ^ self ].
	aSubmorph extent: aSubmorph width @ (box bottom - carriage y).
	aSubmorph position: (carriage x - aSubmorph width) @ box top.
]

{ #category : #layout }
FAbsoluteRelativeLayout >> rightDown: aSubmorph [
	"укладка справа потом вниз"

	"уложить морф"

	self rightDownLayout: aSubmorph.

	"если морф выходит за пределы переход на новую строку"
	aSubmorph right > box right
		ifTrue: [ carriage := box left @ (carriage y + height).
			"уложить с новой строки"
			height := 0.
			self rightDownLayout: aSubmorph ].
	carriage := aSubmorph right @ aSubmorph top.

	"смещение новой строки"
	self height < aSubmorph height
		ifTrue: [ height := aSubmorph height ]
]

{ #category : #layout }
FAbsoluteRelativeLayout >> rightDownLayout: aSubmorph [
	| ext rExt |
	"укладка обычная"
	ext := aSubmorph extent.
	aSubmorph position: carriage x @ carriage y.
	aSubmorph extent: ext x @ ext y.

	"укладка относительная"
	rExt := aSubmorph valueOfProperty: #relativeExtent ifAbsent: [ nil ].
	rExt
		ifNotNil: [ (rExt x isNil or: [ rExt x = 0 ])
				ifFalse: [ ext := (box extent x * rExt x) @ ext y ].
			(rExt y isNil or: [ rExt y = 0 ])
				ifFalse: [ ext := ext x @ (box extent y * rExt y) ].
			aSubmorph extent: ext rounded ].

	"укладка с заполнением"
	aSubmorph hResizing = #spaceFill
		ifTrue: [ aSubmorph extent: (box right - carriage x) @ aSubmorph height ].
	aSubmorph vResizing = #spaceFill
		ifFalse: [ ^ self ].
	aSubmorph extent: aSubmorph width @ (box bottom - carriage y)
]

{ #category : #layout }
FAbsoluteRelativeLayout >> rightUp: aSubmorph [
	"укладка справа потом вниз"

	"уложить морф"

	self rightUpLayout: aSubmorph.

	"если морф выходит за пределы переход на новую строку"
	aSubmorph right > box right
		ifTrue: [ carriage := box left @ (carriage y - height).
			"уложить с новой строки"
			height := 0.
			self rightUpLayout: aSubmorph ].
	carriage := aSubmorph right @ aSubmorph bottom.

	"смещение новой строки"
	self height < aSubmorph height
		ifTrue: [ height := aSubmorph height ]
]

{ #category : #layout }
FAbsoluteRelativeLayout >> rightUpLayout: aSubmorph [
	| ext rExt |
	"укладка обычная"
	ext := aSubmorph extent.
	aSubmorph position: carriage x @ (carriage y - ext y).
	aSubmorph extent: ext x @ ext y.

	"укладка относительная"
	rExt := aSubmorph valueOfProperty: #relativeExtent ifAbsent: [ nil ].
	rExt
		ifNotNil: [ (rExt x isNil or: [ rExt x = 0 ])
				ifFalse: [ ext := (box extent x * rExt x) @ ext y ].
			(rExt y isNil or: [ rExt y = 0 ])
				ifFalse: [ ext := ext x @ (box extent y * rExt y) ].
			aSubmorph position: carriage x @ (carriage y - ext y).
			aSubmorph extent: ext rounded ].

	"укладка с заполнением"
	aSubmorph hResizing = #spaceFill
		ifTrue: [ aSubmorph extent: (box right - carriage x) @ aSubmorph height ].
	aSubmorph vResizing = #spaceFill
		ifFalse: [ ^ self ].
	aSubmorph extent: aSubmorph width @ (carriage y - box top).
	aSubmorph position: aSubmorph left @ box top.
]

Class {
	#name : #FButton,
	#superclass : #PluggableButtonMorph,
	#category : #'Facing-Morphs'
}

{ #category : #creating }
FButton class >> label: aLabelOrMorph action: anAction [
	^ self label: aLabelOrMorph action: anAction help: aLabelOrMorph asString.
]

{ #category : #creating }
FButton class >> label: aLabelOrMorph action: anAction help: aHelpString [
	^ self
			newButtonFor: anAction
			action: #value
			label: aLabelOrMorph
			help: aHelpString
]

{ #category : #creating }
FButton class >> model: aModel label: aLabelOrMorph action: anAction [
	^ self model: aModel
			label: aLabelOrMorph
			action: anAction
			help: aLabelOrMorph asString.
]

{ #category : #creating }
FButton class >> model: aModel label: aLabel action: anAction help: aHelpString [
	^ (self
			newButtonFor: aModel
			action: anAction
			label: aLabel
			help: aHelpString)
]

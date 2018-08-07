Extension { #name : #Dictionary }

{ #category : #'*FogBi2' }
Dictionary >> html [
	| content |
	content := self associations inject: '' into: [ :acc :a | acc , '<tr><td>' , a key , '</td>' , '<td>' , a value html , '</td></tr>' ].
	^ '
<table class="table table-hover table-bordered" 
	{1}
</table>
' format: {content}
]

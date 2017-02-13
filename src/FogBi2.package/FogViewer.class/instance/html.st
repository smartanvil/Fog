accessing
html
	| content |
	content := mirror instanceMirror properties inject: '' into: [ :acc :p | acc , '<tr><td>' , p name , '</td>' , '<td>' , (p value: instance) html , '</td></tr>' ].
	^ '
<!DOCTYPE html>

<html lang="en">
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<style>
{2}
</style>
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/doc.min.css" rel="stylesheet">
</head>
<div class="container">
	<br/>
  <div class=bs-example data-example-id=hoverable-table>
		<h4>
		  <p>Inspecting an instance of {3}</p>
		</h4>
		<br/>
		<table class="table table-hover table-bordered" 
		  <thead>
  		  <tr>
   			   <th>Attribute</th>
    		   <th>Value</th> 
   		  </tr>
		</thead>
		<tbody>
			{1}
		</tbody>			
		</table>
	</div>
</div>
</html>
' format: {content . self style . instance contract fromFile basename }
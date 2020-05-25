<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<link rel="stylesheet" href="css/bootstrapValidator.css">

<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/bootstrapValidator.js"></script>
<title>Registra Mueble</title>
</head>
<body>

<div class="container">
<h1>Registra Mueble</h1>

	<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />

	<form action="insertaMueble" id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Precio</label>
				<input class="form-control" type="text" id="id_precio" name="precio" placeholder="Ingrese el precio">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_apellido">Stock</label>
				<input class="form-control" type="text" id="id_stock" name="stock" placeholder="Ingrese el stock">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crea Mueble</button>
			</div>
	</form>
</div>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">
$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        fields:{
        	nombre :{
          		selector : '#id_precio',
        		validators :{
        			notEmpty :{
        				message :"El precio es obligatorio"
        			},
        			stringLength :{
                     	message:"ingrese precio",
                     	min : 1,
                     	max : 5
                    }
        		}
        	},
        	apellido :{
          		selector : '#id_stock',
        		validators :{
        			notEmpty :{
        				message :"El stock es obligatorio"
        			},
        			stringLength :{
                     	message:"ingrese stock",
                     	min : 1,
                     	max : 5
                    }
        		}
        	},
        	
        	
        	
        	
        }
  
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#id_form').bootstrapValidator('validate');
    });
});
</script>

</body>
</html>





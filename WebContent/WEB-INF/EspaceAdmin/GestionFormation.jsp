

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/template/header.jsp" />
<title>Gestion des formations</title>
</head>

<body>
	<jsp:include page="/WEB-INF/template/sidebar.jsp" />
	<!--content start-->
	<div class="content">
		<jsp:include page="/WEB-INF/template/topnavbar.jsp" />
		<jsp:include page="/WEB-INF/template/message.jsp" />
		
		<!--top navbar end-->

		<!--title page with add button start-->
		<div class="titlePage">
			<h2>Gestion des formations</h2>
			<button
				onclick="document.getElementById('id01').style.display='block'">
				<i class="fas fa-user-plus"></i>Ajouter un formation
			</button>
		</div>
		<!--title page with add button end-->
		<!--add modal start-->
		<div id="id01" class="modal">

			<form class="modal-content animate" action="AjouterFormation"
				method="post">
				<div class="container1">
					<h2>Ajouter un formation</h2>
					<label><b>Nom de formations</b></label> <input type="text"
						placeholder="Entrer le nom de formation" name="nom" required>
					<label><b>Abr�viation de formation</b></label>
					<input type="text" placeholder="Entrer l'abr�viation de formation" name="abr" required>
					
					<label for="spe"><b>Sp�cialit�</b></label>
					<select id="spe" name="spe" >
						<option value="GL">GL</option>
						<option value="MI">MI</option>
						<option value="SCI">SCI</option>
						<option value="SI">SI</option>
						<option value="TI">TI</option>
					</select>
					
					<label for="cycle"><b>Cycle</b></label>
					<select id="cycle" name="cycle">
							<option value="licence">Licence</option>
							<option value="master">Master</option>
					</select>

					<label><b>Ann�e</b></label>
					<input type="number" placeholder="Entrer l'ann�e" name="Annee" min="1" max="5" required>
					<label for="dep">D�partement </label>
					<select id="dep" name="dep">
							<option value="TLSI">TLSI</option>
							<option value="IFA">IFA</option>
							<option value="MI">MI</option>
					</select>
					<input type="submit" value="Ajouter" class="submitbtn"> <input
						type="reset" value="Supprimer content" class="cancelbtn">
					<input type="button" value="Cancel"
						onclick="document.getElementById('id01').style.display='none'"
						class="cancelbtn">
				</div>


			</form>
		</div>
		<!--add modal start-->
		<!--table start-->
		<div class="tableDiv">
			<!--filterage option start-->
			<div class="text">
				<h3>Filtrer</h3>
				<input type="text" id="myInput" onkeyup="search()"
					placeholder="Recherche...">
				<div style="clear: both"></div>
				<div class="opt">
					<label>Sexe <select onselect="">
							<option value="">Aucun</option>
							<option value="Homme">Homme</option>
							<option value="Femme">Femme</option>
					</select>
					</label> <label>Situation Familiale <select onselect="">
							<option value="">Aucun</option>
							<option value="mari�">mari�</option>
							<option value="divorc�">divorc�</option>
							<option value="s�par�">s�par�</option>
							<option value="c�libataire">c�libataire</option>
							<option value="veuf">veuf</option>
					</select>
					</label>
					<label>D�partement<select onselect="">
							<option value="">Aucun</option>
							<option value="TLSI">TLSI</option>
							<option value="IFA">IFA</option>
							<option value="MI">MI</option>
					</select></label>
					 <label>Formation <select onselect="">
							<option value="">Aucun</option>
							<option value="GL">GL</option>
							<option value="MI">MI</option>
							<option value="SCI">SCI</option>
							<option value="SI">SI</option>
							<option value="TI">TI</option>
					</select>
					</label> <label>Module <select onselect="">
							<option value="">Aucun</option>
							<option value="GL">GL</option>
							<option value="MI">DAAW</option>
							<option value="SCI">TL</option>
							<option value="SI">POO</option>
							<option value="TI">ASD</option>
					</select>
					</label>
				</div>
			</div>
			<!--filterage option end-->
			<!--table  start-->
			<div class="table-responsive">
				<c:choose>
					<c:when test="${ empty sessionScope.Formations}">
						<h1 style="text-align: center">la liste vide</h1>
					</c:when>
					<c:otherwise>

						<table class="table table-hover">
							<tr>
								<th>Nom de formation</th>
								<th>Abr�viation de formation</th>
								<th>Sp�cialit�</th>
								<th>Cycle</th>
								<th>Ann�e</th>
								<th>D�partement</th>
								<th>Op�ration</th>
							</tr>

							<c:forEach var="et" items="${sessionScope.Formations}">
								<tr>
									<td><c:out value="${et.getNomFormation()}"></c:out></td>
									<td><c:out value="${et.getAbrFormation()}"></c:out></td>
									<td><c:out value="${et.getSpecialite()}"></c:out></td>
									<td><c:out value="${et.getCycle()}"></c:out></td>
									<td><c:out value="${et.getAnnee()}"></c:out></td>
									<td><c:out value="${et.getDepartement()}"></c:out></td>
									<td><a
										href="Modifier?type=formation&abr=${et.getAbrFormation()}"><i
											class="fas fa-user-edit fa-lg"></i></a> <a
										href="Supprimer?type=formation&abr=${et.getAbrFormation()}"
										onclick="return(confirm('Etes-vous s�r de vouloir supprimer \n ${et.getAbrFormation()}'));"><i
											class="fas fa-trash-alt fa-lg"></i></a></td>
								</tr>
							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>
				<!--table end-->
			</div>
			<!--table end-->
			<!--pagination start-->
			<center>
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
				<!--pagination end-->
			</center>
		</div>
		<!--footer start-->
		<div class="footer">
			<p>Tous droits r�serv�s � 2020</p>
		</div>
		<!--sidebar end-->
	</div>
	<!--sidebar end-->
	<script>
		var modal = document.getElementById('id01');
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
	<jsp:include page="/WEB-INF/template/footer.jsp" />
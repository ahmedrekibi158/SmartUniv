<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/template/header.jsp" />
<title>Espace Chef D�partement</title>
</head>

<body>
	<jsp:include page="/WEB-INF/template/ChefSidebar.jsp" />
	<!--content start-->
	<div class="content">
		<jsp:include page="/WEB-INF/template/topnavbar.jsp" />
		<jsp:include page="/WEB-INF/template/message.jsp" />
		
		<!--top navbar end-->

		<!--title page with add button start-->
		<div class="tableDiv">
		
		<div class="titlePage">
			<h2>La liste des absences justifi�es</h2>
		</div>
			<c:choose>
				<c:when test="${ empty sessionScope.listAbsencesJustifie}">
					<h1 style="text-align: center">La liste vide</h1>
				</c:when>
				<c:otherwise>
		
						<table class="table table-hover">
							<tr><th>N�</th>
							<th>Id absence</th>
							<th>Id s�ance</th>
							<th>Nom</th>
							<th>Pr�nom</th>
							<th>Date et heure de s�ance</th>
							<th>Type de s�ance/Module</th>
							<th>Groupe</th>
							<th>Formation</th></tr>
								
							<c:set var="i" value="${1}"></c:set>
							<c:forEach var="list" items="${sessionScope.listAbsencesJustifie}">
								<tr><td><c:out value="${i}"></c:out></td>
									<td><c:out value="${list.getIdAbsence()}"></c:out></td>
									<td><c:out value="${list.getSeance().getIdSeance()}"></c:out></td>
									<td><c:out value="${list.getEtudiants().getNom()}"></c:out></td>
									<td><c:out value="${list.getEtudiants().getPrenom()}"></c:out></td>
									<td><fmt:formatDate value="${list.getSeance().getTemp()}" type="date" pattern="yyyy/MM/dd hh:mm"/></td>
									<td><c:out value="${list.getSeance().getType()} "></c:out>
										<c:out value="${list.getSeance().getModule().getAbrModule()}"></c:out></td>
									<td><c:out value="${list.getSeance().getGroupe().getNumGroupe()}"></c:out></td>
									<td><c:out value="${list.getEtudiants().getFormation().getAbrFormation()}"></c:out></td>
									<td><a class="btn btn-info" href="detailleJustification?idAbsence=${list.getIdAbsence()}">Voir la justification</a></td>
									</tr>
									
								<c:set var="i" value="${i+1}"></c:set>	
							</c:forEach>	
						
						</table>
				</c:otherwise>
			</c:choose>
			<!--table end-->
		</div>
		
		
		<!--footer start-->
		<div class="footer">
			<p>Tous droits r�serv�s � 2020</p>
		</div>
		<!--sidebar end-->
	</div>
	<!--sidebar end-->
	<jsp:include page="/WEB-INF/template/footer.jsp" />
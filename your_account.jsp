<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	font-family: "Lato", sans-serif;
}

.sidenav {
	height: 100%;
	width: 200px;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #111;
	overflow-x: hidden;
	padding-top: 20px;
}

.sidenav form button {
background:none;
    border:none;
    margin:0;
    padding:0;
	padding: 6px 6px 6px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
}

.sidenav form button:hover {
	color: #f1f1f1;
}

.main {
	margin-left: 200px; /* Same as the width of the sidenav */
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav form button {
		font-size: 18px;
	}
}
</style>
</head>

<body>
 		<h2 style="text-align: left;color: #4CAF50 ; text-transform: uppercase;;" >PATIENTS' DETAILS</h2>
   	     <s:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/doctorsinfo"
         user = "root"  password = "root"/>
 		
      <s:query dataSource = "${snapshot}" var = "result"> 
         SELECT * from patients;
      </s:query>
      <c:forEach var = "row" items = "${result.rows}">
   		<h2 style="text-align: left;color: #66CDAA ;" >	<c:out value="${row }"></c:out></h2>
   			<br></br>
      </c:forEach> 
 
</body>
</html>

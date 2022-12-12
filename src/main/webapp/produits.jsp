<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ page
	import="java.util.ArrayList,java.util.List,com.nextu.entities.Produit"%>
<%
List<Produit> produits = new ArrayList<Produit>();
if (request.getAttribute("produits") != null) {
	produits = (ArrayList<Produit>) request.getAttribute("produits");
}
%>
<div class="container-fluid">
	<div class="row">
		<%@ include file="/WEB-INF/template/menu.jsp"%>
		<main class="col-md-10 ml-sm-auto col-lg-10 pt-3 px-4">

			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center">
					<h1 style="display: flex; align-items: center;" class="h2">
						<svg style="margin-right: 20px" width="25px"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
							<!--! Font Awesome Pro 6.2.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
							<path
								d="M50.7 58.5L0 160H208V32H93.7C75.5 32 58.9 42.3 50.7 58.5zM240 160H448L397.3 58.5C389.1 42.3 372.5 32 354.3 32H240V160zm208 32H0V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V192z" /></svg>
						Product
					</h1>
				</div>
				<div class="btn-toolbar mb-2 mb-md-0">
					<div class="btn-group mr-2">
						<a href="form-produit.jsp" class="btn btn-sm btn-primary">Add
							new Product</a>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/error/error-message.jsp"%>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 pr-0 mb-3">
					<div class="card-collapsible card">
						<div class="card-body">
							<table class="table">
								<thead class="thead bg-primary text-white">
									<tr>
										<th scope="col">Product</th>
										<th scope="col">Actions</th>
									</tr>
								</thead>
								<tbody>
									<%
									for (Produit sp : produits) {
									%>
									<tr>
										<td><%=sp.getLibelle()%></td>
										<td><a class="btn btn-sm btn-success"
											href="modifierProduit?codeProduit=<%=sp.getCode()%>">Edit</a>
											<!-- Button trigger modal --> <a
											href="deleteProduit?codeProduit=<%=sp.getCode()%>"
											class="btn btn-sm btn-danger"> Delete </a></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
</div>
</body>
</html>




<style>
header.navbar.bg-primary {
	background-color: rgba(213, 213, 213, 0.6) !important;
	-webkit-backdrop-filter: saturate(180%) blur(20px) !important;
	backdrop-filter: saturate(180%) blur(20px) !important;
}

header.navbar.bg-primary a.navbar-brand {
	color: black !important;
}

.container-fluid .row aside.sidebar {
	padding-top: 40px !important;
	height: calc(100vh - 40px);
}

a.btn-primary {
	border: 2px solid #007bff !important;
	background-color: transparent !important;
	color: #007bff !important;
	transition: .2s !important;
}

a.btn-primary:hover {
	background-color: #007bff !important;
	color: white !important;
}

a.btn-danger {
	border: 2px solid #dc3545 !important;
	background-color: transparent !important;
	color: #dc3545 !important;
	transition: .2s !important;
}

a.btn-danger:hover {
	background-color: #dc3545 !important;
	color: white !important;
}

a.nav-link {
	color: black !important;
	background: transparent !important;
	transition: .2s !important;
	border-radius: 20px !important;
}

a.nav-link:hover {
	color: black !important;
	background: #d7d7d7 !important;
}

li.nav-item {
	display: flex !important;
	flex-direction: column !important;
	gap: 10px !important;
}

h6.sidebar-heading {
	display: none;
}

div.card {
	border: none !important;
	background: white !important;
	box-shadow: 0 4px 26px 33px rgba(152, 152, 152, 0.07);
	border-radius: 8px !important;
}
</style>
<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ page
	import="java.util.ArrayList,java.util.List,com.nextu.entities.Categorie"%>
<%
List<Categorie> categories = new ArrayList<Categorie>();
if (request.getAttribute("categories") != null) {
	categories = (ArrayList<Categorie>) request.getAttribute("categories");
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
						<svg width="25px" style="margin-right: 20px"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
							<!--! Font Awesome Pro 6.2.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                    <path
								d="M40 48C26.7 48 16 58.7 16 72v48c0 13.3 10.7 24 24 24H88c13.3 0 24-10.7 24-24V72c0-13.3-10.7-24-24-24H40zM192 64c-17.7 0-32 14.3-32 32s14.3 32 32 32H480c17.7 0 32-14.3 32-32s-14.3-32-32-32H192zm0 160c-17.7 0-32 14.3-32 32s14.3 32 32 32H480c17.7 0 32-14.3 32-32s-14.3-32-32-32H192zm0 160c-17.7 0-32 14.3-32 32s14.3 32 32 32H480c17.7 0 32-14.3 32-32s-14.3-32-32-32H192zM16 232v48c0 13.3 10.7 24 24 24H88c13.3 0 24-10.7 24-24V232c0-13.3-10.7-24-24-24H40c-13.3 0-24 10.7-24 24zM40 368c-13.3 0-24 10.7-24 24v48c0 13.3 10.7 24 24 24H88c13.3 0 24-10.7 24-24V392c0-13.3-10.7-24-24-24H40z" />
                                </svg>
						Category
					</h1>
				</div>
				<div class="btn-toolbar mb-2 mb-md-0">
					<div class="btn-group mr-2">
						<a href="creerCategorie" class="btn btn-sm btn-primary">Add
							new Category</a>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 pr-0 mb-3">
					<div class="card-collapsible card">
						<div class="card-body">
							<table class="table">
								<thead class="thead bg-primary text-white">
									<tr>
										<th scope="col">Category</th>
										<th scope="col">Product</th>
										<th scope="col">Actions</th>
									</tr>
								</thead>
								<tbody>
									<%
									for (Categorie dsp : categories) {
									%>
									<tr>
										<td><%=dsp.getLibelle()%></td>
										<td><%=dsp.getProduit().getLibelle()%></td>
										<td><a class="btn btn-sm btn-success"
											href="modifierCategorie?codeCategorie=<%=dsp.getCode()%>">Edit</a>
											</td>
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
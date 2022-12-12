<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ page import="com.nextu.entities.Produit"%>
<div class="container-fluid">
	<div class="row">
		<%@ include file="/WEB-INF/template/menu.jsp"%>
		<main class="col-md-10 ml-sm-auto col-lg-10 pt-3 px-4">
			<%@ include file="/WEB-INF/error/error-message.jsp"%>
			<div
				class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
				<h1 class="h2">
					<i class="fa fa-pencil-square-o"></i> Edit product
				</h1>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 pr-0 mb-3">
					<div class="card-collapsible card">
						<div class="card-body">
							<form method="post" action="modifierProduit">
								<div class="form-group">
									<input type="hidden" name="codeProduit" value="${produit.code }">
									<input type="text" class="form-control"
										placeholder="Product Name" name="libelle"
										value="${produit.libelle}">
								</div>
								<div class="form-group row">
									<div class="col-sm-10">
										<button type="submit" class="btn btn-primary">
											<i class="fa fa-send"></i> Save
										</button>
										<a href="./" class="btn btn-danger"> <i
											class="fa fa-close"></i> Cancel
										</a>
									</div>
								</div>
							</form>
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
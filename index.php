<?php
include "inc/koneksi.php";
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>SI PANGKAT</title>
	<!-- BOOTSTRAP STYLES-->
	<link href="assets/css/bootstrap.css" rel="stylesheet" />
	<!-- FONTAWESOME STYLES-->
	<link href="assets/css/font-awesome.css" rel="stylesheet" />
	<!-- CUSTOM STYLES-->
	<link href="assets/css/custom.css" rel="stylesheet" />
	<!-- GOOGLE FONTS-->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

	<link rel="stylesheet" href="dist/css/select2.min.css" />

	<link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<style>
		.swal2-popup {
			font-size: 1.6rem !important;
		}
	</style>

</head>

<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="index.php" class="navbar-brand">
					<i class="glyphicon glyphicon-send"></i>TARUMAJAYA</a>
			</div>
		</nav>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li class="text-center">
						<img src="assets/img/ttj2.png" class="user-image img-responsive" width="40%" />
					</li>
					<li>
						<a href="dashboard.php">
							<i class="fa fa-user fa-2x"></i> Login</a>
					</li>
				</ul>
			</div>
		</nav>
		<!-- /. PAGE WRAPPER  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<marquee>
							<b>- SISTEM INFORMASI PENGADUAN MASYARAKAT PEDESAAN BERBASIS WEBSITE | SILAHKAN REGISTRASI TERLEBIH DAHULU -
							</b>
						</marquee>
						<!-- <?php
								if (isset($_GET['page'])) {
									$hal = $_GET['page'];

									switch ($hal) {
										case 'user_login':
											include "login/login.php";
											break;

										default:
											echo "<center><h1> ERROR !</h1></center>";
											break;
									}
								}
								?> -->
						<?php
						function generate_uuid()
						{
							return sprintf(
								'%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
								mt_rand(0, 0xffff),
								mt_rand(0, 0xffff),
								mt_rand(0, 0xffff),
								mt_rand(0, 0x0fff) | 0x4000,
								mt_rand(0, 0x3fff) | 0x8000,
								mt_rand(0, 0xffff),
								mt_rand(0, 0xffff),
								mt_rand(0, 0xffff)
							);
						}

						$UUID = generate_uuid();
						?>
						<div class="panel panel-primary">
							<div class="panel-heading">
								<b>Registrasi Pengguna Baru</b>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12">
										<form method="POST">

											<div class="form-group">
												<label>Nama Pengguna</label>
												<input class="form-control" name="nama_pengadu" required />
											</div>
											<div class="form-group">
												<label>Nomor NIK</label>
												<input class="form-control" name="nomer_nik" type="tel" minlength="16" maxlength="16" required />
											</div>

											<div class="form-group">
												<label>Jenis Kelamin :</label>
												<select name="jekel" class="form-control">
													<option value="">- Pilih -</option>
													<option>LK</option>
													<option>PR</option>
												</select>
											</div>

											<div class="form-group">
												<label>No HP</label>
												<input class="form-control" name="no_hp" type="tel" minlength="10" maxlength="13" required />
											</div>

											<div class="form-group">
												<label>Alamat</label>
												<input class="form-control" name="alamat" required />
											</div>

											<div class="form-group">
												<label>Username</label>
												<input class="form-control" name="username" required />
											</div>

											<div class="form-group">
												<label>Password</label>
												<input class="form-control" name="password" type="password" minlength="6" maxlength="12" required />
											</div>

											<div>
												<input type="submit" name="Simpan" value="Simpan" class="btn btn-primary">
												<a href="?page=user_data" title="Kembali" class="btn btn-default">Batal</a>
											</div>
									</div>
									</form>
								</div>
							</div>
						</div>

						<?php

						if (isset($_POST['Simpan'])) {

							$cekusername = mysqli_query($koneksi, "SELECT * FROM tb_pengguna WHERE username = '" . $_POST['username'] . "'");

							if (mysqli_fetch_assoc($cekusername)) {
								echo "<script>
							Swal.fire({title: 'Username Sudah Tersedia !',text: '',icon: 'error',confirmButtonText: 'OK'
							}).then((result) => {if (result.value)
								{window.location = 'index.php?page=pengadu_view';
								}
							})</script>";
								return false;
							}

							$sql_simpan = "INSERT INTO tb_pengadu (id_pengadu, nama_pengadu, jekel, no_hp, alamat) VALUES (
							'$UUID',
							'" . $_POST['nama_pengadu'] . "',
							'" . $_POST['jekel'] . "',
							'" . $_POST['no_hp'] . "',
							'" . $_POST['alamat'] . "')";
							$query_simpan = mysqli_query($koneksi, $sql_simpan);

							$sql_pengguna = "INSERT INTO tb_pengguna (id_pengguna, nama_pengguna, nomer_nik , username, password) VALUES (
							'$UUID',
							'" . $_POST['nama_pengadu'] . "',
							'" . $_POST['nomer_nik'] . "',
							'" . $_POST['username'] . "',
							'" . $_POST['password'] . "')";
							$query_pengguna = mysqli_query($koneksi, $sql_pengguna);

							if ($query_simpan && $query_pengguna) {
								echo "<script>
							Swal.fire({title: 'Berhasil, Silahkan Login !',text: '',icon: 'success',confirmButtonText: 'OK'
							}).then((result) => {if (result.value)
								{window.location = 'index.php?page=pengadu_view';
								}
							})</script>";
							} else {
								echo "<script>
							Swal.fire({title: 'Tambah Gagal',text: '',icon: 'error',confirmButtonText: 'OK'
							}).then((result) => {if (result.value)
								{window.location = 'index.php?page=pengadu_view';
								}
							})</script>";
							}
						}
						?>
					</div>
				</div>
				<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
				<!-- JQUERY SCRIPTS -->
				<script src="assets/js/jquery-1.10.2.js"></script>
				<!-- BOOTSTRAP SCRIPTS -->
				<script src="assets/js/bootstrap.min.js"></script>
				<!-- METISMENU SCRIPTS -->
				<script src="assets/js/jquery.metisMenu.js"></script>
				<!-- CUSTOM SCRIPTS -->

				<script src="assets/js/dataTables/jquery.dataTables.js"></script>
				<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
				<script>
					$(document).ready(function() {
						$('#dataTables-example').dataTable();
					});
				</script>

				<script src="dist/js/select2.min.js"></script>
				<script>
					$(document).ready(function() {
						$("#no_pdd").select2({
							placeholder: "-- Pilih Penduduk --"
						});
						$("#no_kk").select2({
							placeholder: "-- Pilih No.KK --"
						});
					});
				</script>
				<!-- CUSTOM SCRIPTS -->
				<script src="assets/js/custom.js"></script>


</body>

</html>

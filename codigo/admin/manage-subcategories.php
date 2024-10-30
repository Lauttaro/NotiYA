<?php
session_start();
include('includes/config.php');
error_reporting(0);
if(strlen($_SESSION['login'])==0)
  { 
header('location:index.php');
}
else{
if($_GET['action']=='del' && $_GET['scid'])
{
	$id=intval($_GET['scid']);
	$query=mysqli_query($con,"update  tblsubcategory set Is_Active='0' where SubCategoryId='$id'");
	$msg="Categoria eliminada!";
}
if($_GET['resid'])
{
	$id=intval($_GET['resid']);
	$query=mysqli_query($con,"update  tblsubcategory set Is_Active='1' where SubCategoryId='$id'");
	$msg="Categoria restaurada!";
}

if($_GET['action']=='perdel' && $_GET['scid'])
{
	$id=intval($_GET['scid']);
	$query=mysqli_query($con,"delete from   tblsubcategory  where SubCategoryId='$id'");
	$delmsg="Categoria eliminada para siempre!";
}

?>
<!DOCTYPE html>
<html lang="en">
    <head>

        <title> NotiYA | Administrar Subcategorias</title>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/core.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/components.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/pages.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/menu.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/responsive.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="../plugins/switchery/switchery.min.css">
        <script src="assets/js/modernizr.min.js"></script>

    </head>


    <body class="fixed-left">


        <div id="wrapper">


<?php include('includes/topheader.php');?>


<?php include('includes/leftsidebar.php');?>




            <div class="content-page">

                <div class="content">
                    <div class="container">


                        <div class="row">
							<div class="col-xs-12">
								<div class="page-title-box">
                                    <h4 class="page-title">Administrador de SubCategorias</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">Admin</a>
                                        </li>
                                        <li>
                                            <a href="#">SubCategoria </a>
                                        </li>
                                        <li class="active">
                                        Administrador de SubCategorias
                                        </li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
							</div>
						</div>



<div class="row">
<div class="col-sm-6">  
 
<?php if($msg){ ?>
<div class="alert alert-success" role="alert">
<strong>Bien Hecho!</strong> <?php echo htmlentities($msg);?>
</div>
<?php } ?>

<?php if($delmsg){ ?>
<div class="alert alert-danger" role="alert">
<strong>Increible!</strong> <?php echo htmlentities($delmsg);?></div>
<?php } ?>


</div>
                                    <div class="row">
										<div class="col-md-12">
											<div class="demo-box m-t-20">
<div class="m-b-30">
<a href="add-subcategory.php">
<button id="addToTable" class="btn btn-success waves-effect waves-light">Agregar <i class="mdi mdi-plus-circle-outline" ></i></button>
</a>
 </div>

												<div class="table-responsive">
                                                    <table class="table m-0 table-colored-bordered table-bordered-primary">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th> Categoria</th>
                                                                <th>Sub Categoria</th>
                                                                <th>Descripcion</th>
                                                          
                                                                <th>Fecha de Publicacion</th>
                                                                  <th>Ultima edicion</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
<?php 
$query=mysqli_query($con,"Select tblcategory.CategoryName as catname,tblsubcategory.Subcategory as subcatname,tblsubcategory.SubCatDescription as SubCatDescription,tblsubcategory.PostingDate as subcatpostingdate,tblsubcategory.UpdationDate as subcatupdationdate,tblsubcategory.SubCategoryId as subcatid from tblsubcategory join tblcategory on tblsubcategory.CategoryId=tblcategory.id where tblsubcategory.Is_Active=1");
$cnt=1;
$rowcount=mysqli_num_rows($query);
if($rowcount==0)
{
?>
<tr>

<td colspan="7" align="center"><h3 style="color:red">No se Encontró</h3></td>
<tr>
<?php 
} else {

while($row=mysqli_fetch_array($query))
{
?>


 <tr>
<th scope="row"><?php echo htmlentities($cnt);?></th>
<td><?php echo htmlentities($row['catname']);?></td>
<td><?php echo htmlentities($row['subcatname']);?></td>
<td><?php echo htmlentities($row['SubCatDescription']);?></td>
<td><?php echo htmlentities($row['subcatpostingdate']);?></td>
<td><?php echo htmlentities($row['subcatupdationdate']);?></td>
<td><a href="edit-subcategory.php?scid=<?php echo htmlentities($row['subcatid']);?>"><i class="fa fa-pencil" style="color: #29b6f6;"></i></a> 
	&nbsp;<a href="manage-subcategories.php?scid=<?php echo htmlentities($row['subcatid']);?>&&action=del"> <i class="fa fa-trash-o" style="color: #f05050"></i></a> </td>
</tr>
<?php
$cnt++;
 }} ?>
</tbody>
                                                  
                                                    </table>
                                                </div>




											</div>

										</div>
									</div>

                                    
<div class="row">
<div class="col-md-12">
<div class="demo-box m-t-20">
<div class="m-b-30">

 <h4><i class="fa fa-trash-o" ></i> Subcategorias Borradas</h4>

 </div>

<div class="table-responsive">
   <table class="table m-0 table-colored-bordered table-bordered-danger">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th> Categoria</th>
                                                                <th>Sub Categoria</th>
                                                                <th>Descripcion</th>
                                                          
                                                                <th>Fecha de publicacion</th>
                                                                  <th>Ultima Actualizacion</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
<?php 
$query=mysqli_query($con,"Select tblcategory.CategoryName as catname,tblsubcategory.Subcategory as subcatname,tblsubcategory.SubCatDescription as SubCatDescription,tblsubcategory.PostingDate as subcatpostingdate,tblsubcategory.UpdationDate as subcatupdationdate,tblsubcategory.SubCategoryId as subcatid from tblsubcategory join tblcategory on tblsubcategory.CategoryId=tblcategory.id where tblsubcategory.Is_Active=0");
$cnt=1;
$rowcount=mysqli_num_rows($query);
if($rowcount==0)
{
?>
<tr>

<td colspan="7" align="center"><h3 style="color:red">No Encontrado</h3></td>
<tr>
<?php 
} else {

while($row=mysqli_fetch_array($query))
{
?>

 <tr>
<th scope="row"><?php echo htmlentities($cnt);?></th>
<td><?php echo htmlentities($row['catname']);?></td>
<td><?php echo htmlentities($row['subcatname']);?></td>
<td><?php echo htmlentities($row['SubCatDescription']);?></td>
<td><?php echo htmlentities($row['subcatpostingdate']);?></td>
<td><?php echo htmlentities($row['subcatupdationdate']);?></td>
<td><a href="manage-subcategories.php?resid=<?php echo htmlentities($row['subcatid']);?>"><i class="ion-arrow-return-right" title="Restaura esta Subcategoria></i></a>
    &nbsp;<a href="manage-subcategories.php?scid=<?php echo htmlentities($row['subcatid']);?>&&action=perdel"> <i class="fa fa-trash-o" style="color: #f05050"></i></a> </td>
</tr>
<?php
$cnt++;
 } }?>
</tbody>
                                                  
                                                    </table>
                                                </div>



                                                
											</div>

										</div>

							
									</div>                  
                    </div>

                </div>
<?php include('includes/footer.php');?>
            </div>

        </div>
        <script>
            var resizefunc = [];
        </script>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/detect.js"></script>
        <script src="assets/js/fastclick.js"></script>
        <script src="assets/js/jquery.blockUI.js"></script>
        <script src="assets/js/waves.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>
        <script src="../plugins/switchery/switchery.min.js"></script>
        <script src="assets/js/jquery.core.js"></script>
        <script src="assets/js/jquery.app.js"></script>

    </body>
</html>
<?php } ?>
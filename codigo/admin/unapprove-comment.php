<?php
session_start();
include('includes/config.php');
error_reporting(0);
if(strlen($_SESSION['login'])==0)
  { 
header('location:index.php');
}
else{
if( $_GET['disid'])
{
	$id=intval($_GET['disid']);
	$query=mysqli_query($con,"update tblcomments set status='0' where id='$id'");
	$msg="Comment unapprove ";
}
if($_GET['appid'])
{
	$id=intval($_GET['appid']);
	$query=mysqli_query($con,"update tblcomments set status='1' where id='$id'");
	$msg="Comment approved";
}

if($_GET['action']=='del' && $_GET['rid'])
{
	$id=intval($_GET['rid']);
	$query=mysqli_query($con,"delete from  tblcomments  where id='$id'");
	$delmsg="Category deleted forever";
}

?>
<!DOCTYPE html>
<html lang="en">
    <head>

        <title> | Administrar Categorias</title>
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
                                    <h4 class="page-title">Administrar Comentarios Rechazados</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">Admin</a>
                                        </li>
                                        <li>
                                            <a href="#">Comentarios</a>
                                        </li>
                                        <li class="active">
                                          Comentarios Desaprobados 
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
<strong>Eliminado!</strong> <?php echo htmlentities($msg);?>
</div>
<?php } ?>

<?php if($delmsg){ ?>
<div class="alert alert-danger" role="alert">
<strong>Error!</strong> <?php echo htmlentities($delmsg);?></div>
<?php } ?>


</div>
                                 

                                    <div class="row">
										<div class="col-md-12">
											<div class="demo-box m-t-20">

												<div class="table-responsive">
                                                    <table class="table m-0 table-colored-bordered table-bordered-primary">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Nombre</th>
                                                                <th>Mail</th>
                                                                <th width="300">Comentario</th>
                                                                 <th>Estado</th>
                                                                <th>Noticia</th>
                                                                <th>Fecha</th>
                                                                <th>Accion</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
<?php 
$query=mysqli_query($con,"Select tblcomments.id,  tblcomments.name,tblcomments.email,tblcomments.postingDate,tblcomments.comment,tblposts.id as postid,tblposts.PostTitle from  tblcomments join tblposts on tblposts.id=tblcomments.postId where tblcomments.status=0");
$cnt=1;
while($row=mysqli_fetch_array($query))
{
?>

 <tr>
<th scope="row"><?php echo htmlentities($cnt);?></th>
<td><?php echo htmlentities($row['name']);?></td>
<td><?php echo htmlentities($row['email']);?></td>
<td><?php echo htmlentities($row['comment']);?></td>
<td><?php $st=$row['status'];
if($st=='0'):
echo "Esperando aprobacion";
else:
echo "Aprobado";
endif;
?></td>


<td><a href="edit-post.php?pid=<?php echo htmlentities($row['postid']);?>"><?php echo htmlentities($row['PostTitle']);?></a> </td>
<td><?php echo htmlentities($row['postingDate']);?></td>
<td>
<?php if($st=='0'):?>
    <a href="unapprove-comment.php?disid=<?php echo htmlentities($row['id']);?>" title="Desabruebe este Comentario"><i class="ion-arrow-return-right" style="color: #29b6f6;"></i></a> 
<?php else :?>
  <a href="unapprove-comment.php?appid=<?php echo htmlentities($row['id']);?>" title="Apruebe este comentario"><i class="ion-arrow-return-right" style="color: #29b6f6;"></i></a> 
<?php endif;?>

	&nbsp;<a href="unapprove-comment.php?rid=<?php echo htmlentities($row['id']);?>&&action=del"> <i class="fa fa-trash-o" style="color: #f05050"></i></a> </td>
</tr>
<?php
$cnt++;
 } ?>
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
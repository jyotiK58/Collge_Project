<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');
if (strlen($_SESSION['fosaid'] == 0)) {
  header('location:logout.php');
} else {

  if (isset($_POST['submit'])) {

    $oid = $_GET['orderid'];
    $ressta = $_POST['status'];
    $remark = $_POST['restremark'];


    $query = mysqli_query($con, "insert into tblfoodtracking(OrderId,remark,status) value('$oid','$remark','$ressta')");
    $query = mysqli_query($con, "update   tblorderaddresses set OrderFinalStatus='$ressta' where Ordernumber='$oid'");
    if ($query) {
      $msg = "Order Has been updated";
    } else {
      $msg = "Something Went Wrong. Please try again";
    }


  }


  ?>
  <!DOCTYPE html>
  <html>

  <head>



    <title>Cake Bakery System</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="css/plugins/steps/jquery.steps.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/adminstyle.css" rel="stylesheet">

  </head>

  <body>

    <div id="wrapper">

      <?php include_once('includes/leftbar.php'); ?>

      <div id="page-wrapper" class="gray-bg">
        <?php include_once('includes/header.php'); ?>
        <div class="row border-bottom">

        </div>
        <div class="row wrapper border-bottom white-bg page-heading">
          <div class="col-lg-10">
            <h2>Order Details #
              <?php echo $_GET['orderid']; ?>
            </h2>
            <ol class="breadcrumb">
              <li class="breadcrumb-item">
                <a href="dashboard.php">Home</a>
              </li>
              <li class="breadcrumb-item">
                <a>Order Detail</a>
              </li>
              <li class="breadcrumb-item active">
                <strong>Update</strong>
              </li>
            </ol>
          </div>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">

          <div class="row">
            <div class="col-lg-12">
              <div class="ibox">

                <div class="ibox-content">
                  <?php
                  $oid = $_GET['orderid'];
                  $ret = mysqli_query($con, "select * from tblorderaddresses join tbluser on tbluser.ID=tblorderaddresses.UserId where tblorderaddresses.Ordernumber='$oid'");
                  $cnt = 1;
                  while ($row = mysqli_fetch_array($ret)) {

                    ?>
                    <div class="row">
                      <div class="col-6">
                        <p style="font-size:16px; color:red; text-align: center">
                          <?php if ($msg) {
                            echo $msg;
                          } ?>
                        </p>
                        <table border="1" class="table table-bordered mg-b-0">
                          <tr align="center">
                            <td colspan="2" style="font-size:20px;color:blue">
                              User Details</td>
                          </tr>

                          <tr>
                            <th>Order Number</th>
                            <td>
                              <?php echo $row['Ordernumber']; ?>
                            </td>
                          </tr>
                          <tr>
                            <th>First Name</th>
                            <td>
                              <?php echo $row['FirstName']; ?>
                            </td>
                          </tr>
                          <tr>
                            <th>Last Name</th>
                            <td>
                              <?php echo $row['LastName']; ?>
                            </td>
                          </tr>
                          <tr>
                            <th>Email</th>
                            <td>
                              <?php echo $row['Email']; ?>
                            </td>
                          </tr>
                          <tr>
                            <th>Mobile Number</th>
                            <td>
                              <?php echo $row['MobileNumber']; ?>
                            </td>
                          </tr>
                          <tr>
                            <th>Flat no./buldng no.</th>
                            <td>
                              <?php echo $row['Flatnobuldngno']; ?>
                            </td>
                          </tr>
                          <tr>
                            <th>StreetName</th>
                            <td>
                              <?php echo $row['StreetName']; ?>
                            </td>
                          </tr>
                          <tr>
                            <th>Area</th>
                            <td>
                              <?php echo $row['Area']; ?>
                            </td>
                          </tr>
                          <tr>
                            <th>Land Mark</th>
                            <td>
                              <?php echo $row['Landmark']; ?>
                            </td>
                          </tr>
                          <tr>
                            <th>City</th>
                            <td>
                              <?php echo $row['City']; ?>
                            </td>
                          </tr>
                          <tr>
                            <th>Order Date</th>
                            <td>
                              <?php echo $row['OrderTime']; ?>
                            </td>
                          </tr>
                          <tr>
                            <th>Order Final Status</th>
                            <td>
                              <?php
                              $orserstatus = $row['OrderFinalStatus'];
                              if ($row['OrderFinalStatus'] == "Order Confirmed") {
                                echo "Order Confirmed";
                              }

                              if ($row['OrderFinalStatus'] == "Cake being Prepared") {
                                echo "Cake being Prepared";
                              }
                              if ($row['OrderFinalStatus'] == "Cake Pickup") {
                                echo "Cake Pickup";
                              }
                              if ($row['OrderFinalStatus'] == "Cake Delivered") {
                                echo "Cake Delivered";
                              }
                              if ($row['OrderFinalStatus'] == "") {
                                echo "Wait for restaurants approval";
                              }
                              if ($row['OrderFinalStatus'] == "Order Cancelled") {
                                echo "Order Cancelled";
                              }


                              ; ?>
                            </td>
                          </tr>
                        </table>
                      </div>
                      <div class="col-6" style="margin-top:2%">
                        <?php
                        $query = mysqli_query($con, "SELECT tblfood.Image, tblfood.ItemName, tblfood.ItemDes, tblfood.ItemPrice, tblfood.ItemQty, tblorders.FoodId, tblorders.Mode FROM tblorders JOIN tblfood ON tblfood.ID=tblorders.FoodId WHERE tblorders.IsOrderPlaced=1 AND tblorders.OrderNumber='$oid'");
                        $num = mysqli_num_rows($query);
                        $cnt = 1;
                        ?>
                        <table border="1" class="table table-bordered mg-b-0">
                          <tr align="center">
                            <td colspan="4" style="font-size:20px;color:blue">
                              Order Details
                            </td>
                          </tr>
                          <tr>
                            <th>#</th>
                            <th>Cake Image</th>
                            <th>Item Name</th>
                            <th>Delivery Type</th>
                            <th>Price</th>
                          </tr>
                          <?php
                          while ($row1 = mysqli_fetch_array($query)) {
                            ?>
                            <tr>
                              <td>
                                <?php echo $cnt; ?>
                              </td>
                              <td>
                                <img src="itemimages/<?php echo $row1['Image']; ?>" width="60" height="40"
                                  alt="<?php echo $row1['ItemName']; ?>">
                              </td>
                              <td>
                                <?php echo $row1['ItemName']; ?>
                              </td>
                              <td>
                                <?php echo $row1['Mode']; ?>
                              </td>
                              <td>
                                $
                                <?php echo $total = $row1['ItemPrice']; ?>
                              </td>
                            </tr>
                            <?php
                            $cnt++;
                          }
                          if ($num > 0) {
                            $grandtotal = 0; // Initialize grandtotal
                            mysqli_data_seek($query, 0); // Reset the query result pointer
                            while ($row1 = mysqli_fetch_array($query)) {
                              $total = $row1['ItemPrice'];
                              $alltotal = $total * $row1['ItemQty'];
                              $grandtotal += $alltotal;
                            }
                          }
                          ?>
                          <tr>
                            <th colspan="3" style="text-align:center">Grand Total</th>
                            <td>
                              $
                              <?php echo $grandtotal; ?>
                            </td>
                          </tr>
                        </table>
                      </div>



                    </div>




                    <table class="table mb-0">

                      <?php

                      if ($orserstatus == "Order Confirmed" || $orserstatus == "Cake being Prepared" || $orserstatus == "Cake Pickup" || $orserstatus == "") { ?>


                        <form name="submit" method="post">
                          <tr>
                            <th>Restaurant Remark :</th>
                            <td>
                              <textarea name="restremark" placeholder="" rows="12" cols="14" class="form-control wd-450"
                                required="true"></textarea>
                            </td>
                          </tr>

                          <tr>
                            <th>Restaurant Status :</th>
                            <td>
                              <select name="status" class="form-control wd-450" required="true">
                                <option value="Order Confirmed" selected="true">Order Confirmed</option>
                                <option value="Order Cancelled">Order Cancelled</option>
                                <option value="Cake being Prepared">Cake being Prepared</option>
                                <option value="Cake Pickup">Cake Pickup</option>
                                <option value="Cake Delivered">Cake Delivered</option>
                              </select>
                            </td>
                          </tr>
                          <tr align="center">
                            <td colspan="2"><button type="submit" name="submit" class="btn btn-primary">Update order</button>
                            </td>
                          </tr>
                        </form>
                      <?php } ?>



                    </table>

                  <?php } ?>


                  <?php if ($orserstatus != "") {
                    $ret = mysqli_query($con, "select tblfoodtracking.OrderCanclledByUser,tblfoodtracking.remark,tblfoodtracking.status as fstatus,tblfoodtracking.StatusDate from tblfoodtracking where tblfoodtracking.OrderId ='$oid'");
                    $cnt = 1;

                    $cancelledby = $row['OrderCanclledByUser'];
                    ?>
                    <table id="datatable" class="table table-bordered dt-responsive nowrap"
                      style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                      <tr align="center">
                        <th colspan="4">Cake Tracking History</th>
                      </tr>
                      <tr>
                        <th>#</th>
                        <th>Remark</th>
                        <th>Status</th>
                        <th>Time</th>
                      </tr>
                      <?php
                      while ($row = mysqli_fetch_array($ret)) {
                        ?>
                        <tr>
                          <td>
                            <?php echo $cnt; ?>
                          </td>
                          <td>
                            <?php echo $row['remark']; ?>
                          </td>
                          <td>
                            <?php echo $row['fstatus'];
                            if ($cancelledby == 1) {
                              echo "(" . "by user" . ")";
                            } else {

                              echo "(" . "by Bakery" . ")";
                            }

                            ?>
                          </td>
                          <td>
                            <?php echo $row['StatusDate']; ?>
                          </td>
                        </tr>
                        <?php $cnt = $cnt + 1;
                      } ?>
                    </table>
                  <?php }
                  ?>
                </div>
              </div>
            </div>

          </div>
        </div>
        <?php include_once('includes/footer.php'); ?>

      </div>
    </div>



    <!-- Mainly scripts -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>

    <!-- Steps -->
    <script src="js/plugins/steps/jquery.steps.min.js"></script>

    <!-- Jquery Validate -->
    <script src="js/plugins/validate/jquery.validate.min.js"></script>


    <script>
      $(document).ready(function () {
        $("#wizard").steps();
        $("#form").steps({
          bodyTag: "fieldset",
          onStepChanging: function (event, currentIndex, newIndex) {
            // Always allow going backward even if the current step contains invalid fields!
            if (currentIndex > newIndex) {
              return true;
            }

            // Forbid suppressing "Warning" step if the user is to young
            if (newIndex === 3 && Number($("#age").val()) < 18) {
              return false;
            }

            var form = $(this);

            // Clean up if user went backward before
            if (currentIndex < newIndex) {
              // To remove error styles
              $(".body:eq(" + newIndex + ") label.error", form).remove();
              $(".body:eq(" + newIndex + ") .error", form).removeClass("error");
            }

            // Disable validation on fields that are disabled or hidden.
            form.validate().settings.ignore = ":disabled,:hidden";

            // Start validation; Prevent going forward if false
            return form.valid();
          },
          onStepChanged: function (event, currentIndex, priorIndex) {
            // Suppress (skip) "Warning" step if the user is old enough.
            if (currentIndex === 2 && Number($("#age").val()) >= 18) {
              $(this).steps("next");
            }

            // Suppress (skip) "Warning" step if the user is old enough and wants to the previous step.
            if (currentIndex === 2 && priorIndex === 3) {
              $(this).steps("previous");
            }
          },
          onFinishing: function (event, currentIndex) {
            var form = $(this);

            // Disable validation on fields that are disabled.
            // At this point it's recommended to do an overall check (mean ignoring only disabled fields)
            form.validate().settings.ignore = ":disabled";

            // Start validation; Prevent form submission if false
            return form.valid();
          },
          onFinished: function (event, currentIndex) {
            var form = $(this);

            // Submit form input
            form.submit();
          }
        }).validate({
          errorPlacement: function (error, element) {
            element.before(error);
          },
          rules: {
            confirm: {
              equalTo: "#password"
            }
          }
        });
      });
    </script>

  </body>

  </html>
<?php } ?>
<?php
session_start();
include_once('includes/dbconnection.php');

if (isset($_POST['submit'])) {
    $orderid = mysqli_real_escape_string($con, $_GET['oid']);
    $ressta = "Order Cancelled";
    $remark = $_POST['restremark'];
    $canclbyuser = 1;

    $insertQuery = "INSERT INTO tblfoodtracking(OrderId, remark, status, OrderCanclledByUser) VALUES (?, ?, ?, ?)";
    $stmt = mysqli_prepare($con, $insertQuery);
    mysqli_stmt_bind_param($stmt, 'sssi', $orderid, $remark, $ressta, $canclbyuser);
    $query = mysqli_stmt_execute($stmt);

    $updateQuery = "UPDATE tblorderaddresses SET OrderFinalStatus = ? WHERE Ordernumber = ?";
    $stmt = mysqli_prepare($con, $updateQuery);
    mysqli_stmt_bind_param($stmt, 'ss', $ressta, $orderid);
    $query = mysqli_stmt_execute($stmt);

    if ($query) {
        $msg = "Order has been updated";
    } else {
        $msg = "Something went wrong. Please try again";
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Order Cancellation</title>
</head>

<body>

    <div style="margin-left: 50px;">
        <?php
        $orderid = mysqli_real_escape_string($con, $_GET['oid']);
        $query = mysqli_query($con, "SELECT Ordernumber, OrderFinalStatus FROM tblorderaddresses WHERE Ordernumber='$orderid'");
        $num = mysqli_num_rows($query);
        $cnt = 1;
        ?>

        <table border="1" cellpadding="10" style="border-collapse: collapse; border-spacing:0; width: 100%; text-align: center;">
            <tr align="center">
                <th colspan="4">Cancel Order #<?php echo $orderid; ?></th>
            </tr>
            <tr>
                <th>Order Number</th>
                <th>Current Status</th>
            </tr>
            <?php
            if (mysqli_num_rows($query) > 0) {
                while ($row = mysqli_fetch_array($query)) {
                    ?>
                    <tr>
                        <td><?php echo $orderid; ?></td>
                        <td><?php
                            $status = $row['OrderFinalStatus'];
                            if ($status == "") {
                                echo "Waiting for confirmation";
                            } else {
                                echo $status;
                            }
                            ?></td>
                    </tr>
                    <?php
                }
            } else {
                echo "<tr><td colspan='2'>Invalid Order ID</td></tr>";
            }
            ?>

        </table>

        <?php if ($status == "" || $status == "Order Accept") { ?>
            <form method="post">
                <table>
                    <tr>
                        <th>Reason for Cancel</th>
                        <td><textarea name="restremark" placeholder="" rows="12" cols="50" class="form-control wd-450" required="true"></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><button type="submit" name="submit" class="btn btn-primary">Update Order</button></td>
                    </tr>
                </table>
            </form>
        <?php } else { ?>
            <?php if ($status == 'Order Cancelled') { ?>
                <p style="color:red; font-size:20px;">Order Cancelled</p>
            <?php } else { ?>
                <p style="color:red; font-size:20px;">You can't cancel this. Order is on the way or delivered</p>
            <?php } ?>
        <?php } ?>

    </div>

</body>

</html>

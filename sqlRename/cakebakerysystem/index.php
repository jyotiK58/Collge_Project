<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');
if (isset($_POST['submit'])) {
    $foodid = $_POST['foodid'];
    $userid = $_SESSION['fosuid'];
    $query = mysqli_query($con, "insert into tblorders(UserId,FoodId) values('$userid','$foodid') ");
    if ($query) {
        echo "<script>alert('Cake has been added in to the cart');</script>";
    } else {
        echo "<script>alert('Something went wrong.');</script>";
    }
}
$query = "SELECT * FROM tbldiscount";

// Execute the query and fetch the data
$result = mysqli_query($con, $query);


$discount_offers = array();
$coupon_codes_displayed = array(); // Array to keep track of displayed coupon codes
while ($row = mysqli_fetch_assoc($result)) {
    // Check if the coupon code has already been displayed
    $couponCode = $row['coupon_code'];
    if (!in_array($couponCode, $coupon_codes_displayed)) {
        $discount_offers[] = $row;
        // Add the coupon code to the displayed list
        $coupon_codes_displayed[] = $couponCode;
    }
}

?>
<!DOCTYPE html>
<html lang="en">

<head>

    <title>BakeHub || Home Page</title>

    <!-- Icon css link -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="vendors/linearicons/style.css" rel="stylesheet">
    <link href="vendors/flat-icon/flaticon.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Rev slider css -->
    <link href="vendors/revolution/css/settings.css" rel="stylesheet">
    <link href="vendors/revolution/css/layers.css" rel="stylesheet">
    <link href="vendors/revolution/css/navigation.css" rel="stylesheet">
    <link href="vendors/animate-css/animate.css" rel="stylesheet">

    <!-- Extra plugin css -->
    <link href="vendors/owl-carousel/owl.carousel.min.css" rel="stylesheet">
    <link href="vendors/magnifc-popup/magnific-popup.css" rel="stylesheet">

    <link href="css/newstyle.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <style>
        video {
            width: 100%;
            height: 10%;
            /* opacity: 0.6; */
        }

        .quotes {
            position: relative;
            width: 100%;
        }

        .quotes-body {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }

        .quotes-title {
            font-size: 50px;
            font-weight: bold;
        }

        .quotes-content {
            margin-top: 20px;
            font-size: 24px;
            color: #347AB8;
        }

        /* Increase button size */
        .quotes-title .btn {
            font-size: 32px;
            /* Adjust the font size to your preference */
            padding: 16px 30px;
            /* Adjust the padding to increase the button size */
        }
        .offer-container {
            position: relative;
            overflow: hidden;
            position: relative;
            height: 300px;
        }

        .offer-container img {
            /* Set image width to match carousel-inner width */
            width: 100%;
            z-index: -1;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
        }

        .offer-body {
            background-color: rgba(0, 0, 0, 0.3);
            /* Add a semi-transparent background for better text readability */
            padding: 10px;
            text-align: center;
            height: 300px;
        }

        .offer-title {
            font-size: 24px;
            font-weight: bold;
            margin-top: 10px;
            color: #fff;
        }

        .offer-description {
            font-size: 16px;
            margin-top: 10px;
            color: #fff;
        }

        .offer-discount {
            font-size: 20px;
            font-weight: bold;
            color: #E61c21;
            margin-top: 10px;
        }
        .carousel-item {
            height: 300px;
        }
        .carousel-item img {
        width: 100%;
        height: 500px;
    }
    </style>
    

</head>

<body>

    <!--================Main Header Area =================-->
    <?php include_once('includes/header.php'); ?>
    <!--================End Main Header Area =================-->

    <!--================Start Discount Area =================-->
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
        <?php
        // Loop through the discount offers fetched from the database and create carousel items
        $active = true; // To mark the first carousel item as active
        foreach ($discount_offers as $offer) {
            $title = $offer['title'];
            $description = $offer['description'];
            $offer_text = $offer['offer'];
            $image = $offer['image']; // Construct the absolute URL

            // Output the carousel item
            echo '<div class="carousel-item ' . ($active ? 'active' : '') . '">
                <div class="offer-container">
                    <img class="d-block w-100" src="admin/itemimages/' . $image . '" alt="' . $title . '">
                    <div class="offer-body">
                        <h2 class="offer-title">' . $title . '</h2>
                        <p class="offer-description">' . $description . '</p>
                        <p class="offer-discount">' . $offer_text . '</p>
                        <p class="text-center">
                            <a href="./cake.php"><button class="btn btn-primary">Buy Now</button></a>
                        </p>
                    </div>
                </div>
            </div>';

            $active = false; // Mark the first carousel item as inactive for subsequent iterations
        }
        ?>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<!--================End Discount Area =================-->

    <div class="quotes">
        <video autoplay muted loop>
            <source src="./videos/video2.mp4" type="video/mp4">
        </video>
        <div class="quotes-body">
            <div class="quotes-title">
                <a href="./cake.php" class="btn btn-danger">BakeHub</a>
            </div>
            <div class="quotes-content">
                Cake is for life, not just for birthdays!
            </div>
        </div>
    </div>
    
    <!--================Welcome Area =================-->
    <section class="welcome_bakery_area">
        <div class="container">
            <div class="welcome_bakery_inner p_100">
                <div class="row">
                    <div class="col-lg-6">
                        <?php

                        $ret = mysqli_query($con, "select * from tblpage where PageType='aboutus' ");
                        $cnt = 1;
                        while ($row = mysqli_fetch_array($ret)) {

                            ?>
                            <div class="main_title">
                                <h2>
                                    <?php echo $row['PageTitle']; ?>
                                </h2>
                                <p>
                                    <?php echo $row['PageDescription']; ?>
                                </p>
                            </div>
                        <?php } ?>
                    </div>
                    <div class="col-lg-6">
                        <div class="welcome_img">
                            <img class="img-fluid" src="img/cake-feature/welcome-right.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="cake_feature_inner">
                <div class="main_title">
                    <h2>Our Featured Cakes</h2>
                    <h5> Sweetest slice of paradise</h5>
                </div>
                <div class="cake_feature_slider owl-carousel">
                    <?php


                    $ret = mysqli_query($con, "select * from tblfood");
                    $cnt = 1;
                    while ($row = mysqli_fetch_array($ret)) {

                        ?>
                        <div class="item">
                            <div class="cake_feature_item">
                                <div class="cake_img">
                                    <img src="admin/itemimages/<?php echo $row['Image']; ?>" width="400" height="180">
                                </div>
                                <div class="cake_text">
                                    <h4>$
                                        <?php echo $row['ItemPrice']; ?>
                                    </h4>
                                    <h3><a href="cake-detail.php?fid=<?php echo $row['ID']; ?>"><?php echo $row['ItemName']; ?></a></h3>
                                    <?php if ($_SESSION['fosuid'] == "") { ?>
                                        <a href="login.php" class="pest_btn">Add to Cart</a>
                                    <?php } else { ?>
                                        <form method="post">
                                            <input type="hidden" name="foodid" value="<?php echo $row['ID']; ?>">
                                            <button type="submit" name="submit" class="pest_btn">Add to Cart</button>
                                        </form>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                    <?php } ?>


                </div>
            </div>
        </div>
    </section>
    <!--================End Welcome Area =================-->




    <?php include_once('includes/footer.php'); ?>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- Rev slider js -->
    <script src="vendors/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script src="vendors/revolution/js/jquery.themepunch.revolution.min.js"></script>
    <script src="vendors/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <script src="vendors/revolution/js/extensions/revolution.extension.video.min.js"></script>
    <script src="vendors/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
    <script src="vendors/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
    <script src="vendors/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
    <!-- Extra plugin js -->
    <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
    <script src="vendors/magnifc-popup/jquery.magnific-popup.min.js"></script>
    <script src="vendors/datetime-picker/js/moment.min.js"></script>
    <script src="vendors/datetime-picker/js/bootstrap-datetimepicker.min.js"></script>
    <script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
    <script src="vendors/jquery-ui/jquery-ui.min.js"></script>
    <script src="vendors/lightbox/simpleLightbox.min.js"></script>

    <script src="js/theme.js"></script>
</body>

</html>
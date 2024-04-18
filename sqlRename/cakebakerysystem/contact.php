<?php
include('includes/dbconnection.php');
session_start();
error_reporting(0);

if(isset($_POST['submit']))
  {
    $name=$_POST['name'];
    $email=$_POST['email'];
    $message=$_POST['message'];
     
    $query=mysqli_query($con, "insert into tblcontact(Name,Email,Message) value('$name','$email','$message')");
    if ($query) {
   echo "<script>alert('Your message was sent successfully!.');</script>";
echo "<script>window.location.href ='contact.php'</script>";
  }
  else
    {
       echo '<script>alert("Something Went Wrong. Please try again")</script>';
    }

  
}
  ?>
<!DOCTYPE html>
<html lang="en">
    
<head>
        <title>Cake Bakery System|| Contact Us</title>

        <!-- Icon css link -->
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="vendors/linearicons/style.css" rel="stylesheet">
        <link href="vendors/flat-icon/flaticon.css" rel="stylesheet">
        <link href="vendors/stroke-icon/style.css" rel="stylesheet">
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
          .contact_form_area {
  padding: 100px 0;
}

.contact_form_area .main_title {
  margin-bottom: 50px;
  text-align: center;
}

.contact_form_area .main_title h2 {
  font-size: 36px;
  margin-bottom: 10px;
}

.contact_form_area .main_title h5 {
  font-size: 18px;
  margin: 0;
}

.contact_form_area .row {
  justify-content: center;
}

.contact_form_area form {
  max-width: 500px;
  margin: 0 auto;
}

.contact_form_area .form-group {
  margin-bottom: 20px;
}

.contact_form_area .form-control {
  width: 100%;
  padding: 15px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.contact_form_area textarea.form-control {
  resize: vertical;
}

.contact_form_area .btn {
  width: 100%;
  background-color: #ff9800;
  color: #fff;
  border: none;
  padding: 15px;
  border-radius: 4px;
  transition: background-color 0.3s ease;
}

.contact_form_area .btn:hover {
  background-color: #f57c00;
  cursor: pointer;
}

.contact_form_area .btn:active {
  background-color: #e65100;
}

.contact_form_area .btn:focus {
  outline: none;
  box-shadow: 0 0 0 3px rgba(255, 152, 0, 0.3);
}

.contact_form_area .contact_details {
  background-color: #f9f9f9;
  padding: 30px;
  text-align: center;
  border-radius: 4px;
}

.contact_form_area .contact_d_item h3,
.contact_form_area .contact_d_item h5 {
  margin: 0;
}

.contact_form_area .contact_d_item p {
  margin-bottom: 0;
}

        </style>
    </head>
    <body>
        
        <!--================Main Header Area =================-->
		<?php include_once('includes/header.php');?>
        <!--================End Main Header Area =================-->
        
        <!--================End Main Header Area =================-->
        <section class="banner_area">
        	<div class="container">
        		<div class="banner_text">
        			<h3>Contact Us</h3>
        			<ul>
        				<li><a href="index.php">Home</a></li>
        				<li><a href="contact.php">Contact Us</a></li>
        			</ul>
        		</div>
        	</div>
        </section>
        <!--================End Main Header Area =================-->
        
        <!--================Contact Form Area =================-->
        <section class="contact_form_area p_100">
        	<div class="container">
        		<div class="main_title">
					<h2>Get In Touch</h2>
					<h5>Do you have anything in your mind to let us know?  Kindly don't delay to connect to us by means of our contact form.</h5>
				</div>
       			<div class="row">
       				<div class="col-lg-7">
       					
               <form class="row contact_us_form" action="" method="post" onsubmit="return contactForm()">
	<div class="form-group col-md-6">
		<input type="text" class="form-control" id="name" name="name" placeholder="Your name">
	</div>
	<div class="form-group col-md-6">
		<input type="email" class="form-control" id="email" name="email" placeholder="Email address">
	</div>
	<div class="form-group col-md-12">
		<textarea class="form-control" name="message" id="message" rows="1" placeholder="Write message"></textarea>
	</div>
	<div class="form-group col-md-12">
		<button type="submit" value="submit" name="submit" class="btn order_s_btn form-control">Submit now</button>
	</div>
</form>


       				</div>
       				<div class="col-lg-4 offset-md-1">
       					<div class="contact_details">
       						<?php

$ret=mysqli_query($con,"select * from tblpage where PageType='contactus' ");
$cnt=1;
while ($row=mysqli_fetch_array($ret)) {

?>
       						<div class="contact_d_item">
       							<h3>Address :</h3>
       							<p><?php  echo $row['PageDescription'];?></p>
       						</div>
       						<div class="contact_d_item">
       							<h5>Phone : <?php  echo $row['MobileNumber'];?></h5>
       							<h5>Email : <?php  echo $row['Email'];?></h5>
       						</div>
       						
       					</div>
       				</div><?php } ?>
       			</div>
        	</div>
        </section>
        <!--================End Contact Form Area =================-->
        

      <!-- Validation for contact form -->
        <script>
function contactForm() {
	// Get the form input values
	var name = document.getElementById('name').value;
	var email = document.getElementById('email').value;
	var message = document.getElementById('message').value;

	// Perform validation
	if (name === '') {
		alert('Please enter your name.');
		return false;
	}

	if (name.length <= 2) {
		alert('Name must be at least 3 characters long.');
		return false;
	}


	if (email === '') {
		alert('Please enter your email address.');
		return false;
	}

	// Validate email format
	var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	if (!emailRegex.test(email)) {
		alert('Please enter a valid email address.');
		return false;
	}

	if (message === '') {
		alert('Please enter your message.');
		return false;
	}

	// Form is valid, allow submission
	return true;
}
</script>

       
       <?php include_once('includes/footer.php');?>
        
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
        <!--gmaps Js-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
        <script src="js/gmaps.min.js"></script>
        <script src="js/map-active.js"></script>
        
        <!-- contact js -->
        <script src="js/jquery.form.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/contact.js"></script>
        
        <script src="js/theme.js"></script>
    </body>

</html>
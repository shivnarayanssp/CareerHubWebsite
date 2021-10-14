<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>CAREER HUB!</title>
        <link rel="icon" href="resource/CareerHub-icon.png"/>
        
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
        
        <!-- AOS css and JS -->
        <link rel="stylesheet" href="resource/aos/aos.css">
        <script src="resource/aos/aos.js"></script>
        <!-- AOS css and JS END-->

        <!-- fontawesome -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" >
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <!-- fontawesome END -->

        <!-- Lightbox CSS & Script -->
        <script src="resource/lightbox/ekko-lightbox.js"></script>
        <link rel="stylesheet" href="resource/lightbox/ekko-lightbox.css"/>

        

        <!-- custom css-->
        <link rel="stylesheet" href="resource/custom.css"/>
        <!-- custom css END-->

        <meta name="author" content="Shiv Narayan Prasad"/>
        <meta name="description" content="This is a Career Hub website"/>
        <meta name="keywords" content="Best JobSeeker Portal! "/>
    </head>
    <body>
        <p style='background-color:yellow;text-align:center;'> ${loginResult} </p>
        <c:if test="${userName==null}">
	        <nav class="navbar navbar-expand-sm sticky-top bg-light">
	            <a class="navbar-brand c-font" href="index.jsp">
	              <img src='resource/CareerHub-icon.png' width="30px"/> <span class="text-danger font-weight-bold ">Career</span><span class="text-muted">Hub</span>
	            </a>
	            <button class="navbar-toggler bg-light" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	                <!-- <span class="navbar-toggler-icon text-dark"> <i class="fas fa-sort-down"></i> </span> -->
	                <span class="fa fa-bars"></span> Menu
	            </button>
	            <div class="collapse navbar-collapse " id="collapsibleNavbar"  >
	              <ul class="navbar-nav mx-auto ">
	                <li class="nav-item">
	                  <a class="nav-link text-secondary" href="index.jsp">HOME</a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link text-secondary" href="Company.jsp">Company</a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link text-secondary" href="" data-toggle="modal" data-target="#signInModal">User-Sign In</a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link text-secondary" href="" data-toggle="modal" data-target="#signUpModal">User-Sign Up</a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link text-secondary" href="contact.jsp">CONTACT</a>
	                </li>    
	              </ul>
	              <div >
	                  <a class="text-danger h5 mr-3" href="tel:+91-8448616645">CALL US TODAY: +91-8448616645</a>
	              </div>
	            </div>
	        </nav>
        </c:if>
        <c:if test="${userName!=null}">
        <nav class="navbar navbar-expand-sm sticky-top bg-light">
			<img class="navbar-brand c-font" src='resource/CareerHub-icon.png'
				width="30px" /> <span class="text-danger font-weight-bold ">Career</span><span
				class="text-muted">Hub</span>
	
			<button class="navbar-toggler bg-light" type="button"
				data-toggle="collapse" data-target="#collapsibleNavbar">
				<!-- <span class="navbar-toggler-icon text-dark"> <i class="fas fa-sort-down"></i> </span> -->
				<span class="fa fa-bars"></span> Menu
			</button>
			<div class="collapse navbar-collapse " id="collapsibleNavbar">
				<ul class="navbar-nav mx-auto ">
					<li class="nav-item"><a class="nav-link text-secondary"
						href="/">HOME</a></li>
					<li class="nav-item"><label class="nav-link"> Welcome:
							<b>${userName}</b> 
							<img src="getUserImage?email=${userEmail}" height="30px"/>
					</label></li>
					<li class="nav-item"><a class="nav-link text-secondary"
						href="UserProfile">Profile</a></li>
					<li class="nav-item"><a class="nav-link text-secondary"
						href="Logout">Logout</a></li>
				</ul>
				<div>
					<a class="text-danger h5 mr-3" href="tel:+91-9811981198">CALL US
						TODAY: +91-8448616645</a>
				</div>
			</div>
		</nav>
		</c:if>
        <c:if test="${result!=null}">
        	<p style='background-color:yellow;text-align:center;padding:10px;'> ${result} </p>
        </c:if>
        <section class="c-banner text-white">
            <div class="container">
              <div class="row align-items-center" >
                <div class="col-sm-8">
                  <h1>Career Hub Is Easiest<br/> And Fastest Way To Get Hired.</h1>
                  <p>
                    <i class="fas fa-check"></i>
                    Qucikly Accessible!
                    <br/>
                    <i class="fas fa-check"></i>
                    Get Relevant Jobs for the coverage you need
                  </p>
                </div>
                <div class="col-sm-4 bg-danger text-center p-4" data-aos="fade-left" data-aos-duration="1000">
                    <h1>Search Jobs</h1>
                    <form action='SearchJob' method="post" >
                      	Tech <input type="radio" name="category" value='Tech' checked/>
        				Non-Tech <input type="radio" name="category" value='Non-Tech' /> <br/><br/>
                      	<button class="btn btn-dark w-100 p-3 my-2" name='submit'  type="submit">Search</button>
                    </form>
                </div>
              </div>
            </div>
        </section>
        <section class="c-card">
          <div class="container">
            <div class="row">
              <div class="col-sm-4">
                <div class="card">
                  <i class="far fa-thumbs-up"></i>
                  <h3>Free & Easy To Use</h3>
                  <p>We are providing best and modern equipment.</p>
                </div>
              </div>
              <div class="col-sm-4">
                <div class="card">
                  <i class="far fa-clock"></i>
                  <h3>Save Time & Money</h3>
                  <p>We are providing best and modern equipment.</p>
                </div>
              </div>
              <div class="col-sm-4">
                <div class="card">
                  <i class="far fa-file-alt"></i>
                  <h3>No Obligation Quote</h3>
                  <p>We are providing best and modern equipment.</p>
                </div>
              </div>
            </div>
          </div>
        </section>
        <section class="my-4">
          <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <ul class="carousel-indicators">
              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1" ></li>
              <li data-target="#myCarousel" data-slide-to="2"></li>
            </ul>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="resource/slide1.jpg" class="w-100" >
                <div class="carousel-caption">
                  <h3>Image 1</h3>
                </div>   
              </div>
              <div class="carousel-item">
                <img src="resource/slide2.jpg" class="w-100" >
                <div class="carousel-caption">
                  <h3>Image 2</h3>
                </div>    
              </div>
              <div class="carousel-item">
                <img src="resource/slide3.jpg" class="w-100" >
                <div class="carousel-caption">
                  <h3>Image 3</h3>
                </div>   
              </div>
            </div>
            <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
              <!-- <span class="carousel-control-prev-icon"></span> -->
              <i class="fas fa-arrow-left text-danger"></i>
            </a>
            <a class="carousel-control-next" href="#myCarousel" data-slide="next">
              <span class="carousel-control-next-icon"></span>
            </a>
          </div>
        </section>
        <section class="container-fluid jumbotron  my-4 ">
            <div class="container">
              <h1 class="text-center">Photo Gallery</h1>
              <div class="row">
                <div class="col-sm-4">
                  <a href="resource/person1.jpg" data-toggle="lightbox" data-gallery="example-gallery">
                    <img src="resource/person1.jpg" class="img-fluid" alt=""/>
                  </a>
                </div>
                <div class="col-sm-4">
                  <a href="resource/person2.jpg" data-toggle="lightbox" data-gallery="example-gallery">
                    <img src="resource/person2.jpg" class="img-fluid" alt=""/>
                  </a>
                </div>
                <div class="col-sm-4">
                  <a href="resource/person3.jpg" data-toggle="lightbox" data-gallery="example-gallery">
                    <img src="resource/person3.jpg" class="img-fluid" alt=""/>
                  </a>
                </div>
                <!-- Images do not visible on page but in gallery slider (lightbox) -->
                <div class="col-sm">
                  <a href="resource/image1.jpg" data-toggle="lightbox" data-gallery="example-gallery">
                  </a>
                </div>
                <div class="col-sm">
                  <a href="resource/image1.jpg" data-toggle="lightbox" data-gallery="example-gallery">
                  </a>
                </div>
              </div>
            </div>
            
        </section>
        <footer class="bg-dark p-4">
          <p class="text-white">
            Design by <a href="https://www.incapp.in" target="_blank">SHIV NARAYAN PRASAD</a> &copy; Rights reserved
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Social Media: 
            <a href="https://www.facebook.com/shivnarayan.prasad.395/"><i class="fab fa-facebook"></i></a>
            &nbsp;
            <a href="https://www.instagram.com/shivnarayan_/"><i class="fab fa-instagram"></i></a>
          </p>
        </footer>

        <a id="myTopBtn"><i class="fas fa-chevron-circle-up display-4 text-danger"></i></a>
        
        <!-- Modal Sign IN code -->
        <div class="modal fade" id="signInModal"  aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header bg-primary text-white">
                <h3 class="modal-title" >User Login</h3>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <form action="UserLogin" method="post">
                  <div class="form-group">
                    <label for="email">User Email ID:</label>
                    <input type="email" class="form-control" placeholder="Enter User email id" id="email" name="email" required>
                  </div>
                  <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" placeholder="Enter password" id="pwd" name="password" required>
                  </div>
                  <button type="submit" class="btn btn-primary">Login</button>
                </form>
                <a href='ForgetPassword.jsp'>Forget Password?</a>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
        <!-- Modal Sign UP code -->
        <div class="modal fade" id="signUpModal"  aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header bg-success text-white">
                <h3 class="modal-title" >User Registration</h3>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <form action="UserRegister" method="post" enctype="multipart/form-data">
                  <div class="form-group">
                    <label for="email">User Email ID:</label>
                    <input type="email" class="form-control" placeholder="Enter email id" id="email" name="email" required>
                  </div>
                  <div class="form-group">
                    <label for="email">User Name:</label>
                    <input type="text" class="form-control" placeholder="Enter name" id="name" name="name" required>
                  </div>
                  <div class="form-group">
                    <label for="email">User Phone:</label>
                    <input type="text" class="form-control" placeholder="Enter Phone" id="phone" name="phone" required>
                  </div>
                  <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" placeholder="Enter password" id="pwd" name="password" required>
                  </div>
                  <button type="submit" class="btn btn-primary">Register</button>
                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
    </body>
    <script>
      AOS.init();

      //script for light box
      $(document).on('click', '[data-toggle="lightbox"]', function(event) {
          event.preventDefault();
          $(this).ekkoLightbox();
      });

      //Script for Scroll to Top button for hide and show
      $(window).scroll(function() {
          if ($(this).scrollTop()) {
              $('#myTopBtn').fadeIn();
          } else {
              $('#myTopBtn').fadeOut();
          }
      });
      //script for scroll to top
      $("#myTopBtn").click(function () {
        $("html, body").animate({scrollTop: 0}, 1000);
      });

      
    </script>
</html>
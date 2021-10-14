<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${companyName==null}">
	<% 
	session.setAttribute("result","Plz login First");
	response.sendRedirect("Company"); 
	%>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <title>Career Hub</title>
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
        <nav class="navbar navbar-expand-sm sticky-top bg-light">
            <img class="navbar-brand c-font" src='resource/CareerHub-icon.png' width="30px"/> <span class="text-danger font-weight-bold ">Career</span><span class="text-muted">Hub</span>
            
            <button class="navbar-toggler bg-light" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <!-- <span class="navbar-toggler-icon text-dark"> <i class="fas fa-sort-down"></i> </span> -->
                <span class="fa fa-bars"></span> Menu
            </button>
            <div class="collapse navbar-collapse " id="collapsibleNavbar"  >
              <ul class="navbar-nav mx-auto ">
                <li class="nav-item">
                  <a class="nav-link text-secondary" href="companyHome">HOME</a>
                </li>
                <li class="nav-item">
                </li>
                <li class="nav-item">
                  <a class="nav-link text-secondary" href="ViewAllJobs">View All Jobs</a>
                </li> 
                <li class="nav-item">
                  <a class="nav-link text-secondary" href="CompanyProfile">Profile</a>
                </li>  
                <li class="nav-item">
                  <a class="nav-link text-secondary" href="Logout">Logout</a>
                </li>    
              </ul>
              <div >
                  <a class="text-danger h5 mr-3" href="tel:+91-8448616645">CALL US TODAY: +91-8448616645</a>
              </div>
            </div>
        </nav>
        
        <section class='container p-4'>
        	
        	<c:forEach items="${jobs}" var="Job">
				<div class='p-2'>
					<p class='bg-light p-2 my-2'>  
    				Name: <b>${Job.jname}</b> 
    				<br/> 
    				Location: <b>${Job.location}</b>
    				<br/>
    				Category: <b>${Job.category}</b>
    				<br/>
    				Description: <b>${Job.description}</b>
    				<br/>
    				Expreience: <b>${Job.expreience}</b>
    				<br>
    				<br/>
    				</p>
    			</div>
			</c:forEach>
   			
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

        
    </body>
</html>
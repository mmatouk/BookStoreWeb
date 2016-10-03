<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page language = "java" session = "true" %>
<%@ page import = "com.abc.bookstore.*" %>
<%@ page import = "java.text.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%  
   BookBean book = ( BookBean ) session.getAttribute( "bookToAdd" );
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= book.getTitle() %></title>
        
	    <link href="assets/css/bootstrap.css" rel="stylesheet" />
	    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
	    <link href="assets/css/font-awesome-animation.css" rel="stylesheet" />
	    <link href="assets/css/style.css" rel="stylesheet" />
	    <!-- GOOGLE FONT -->
	    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    </head>
    <body>
	    <!-- NAV SECTION -->
	    <div class="navbar navbar-inverse navbar-fixed-top">
	        <div class="container">
	            <div class="navbar-header">
	                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                </button>
	                <a class="navbar-brand" href="#">BOOKS</a>
	            </div>
	            <div class="navbar-collapse collapse">
	                <ul class="nav navbar-nav navbar-right">
	                    <li><a href="index.html">HOME</a></li>
	                    <li><a href="books.jsp">BOOKS</a></li>
	                     <li><a href="contact.jsp">CONTACT</a></li>
	                    <li><a href="viewCart.jsp">CART</a></li>
	                </ul>
	            </div>
	           
	        </div>
	    </div>
	     <!--END NAV SECTION -->
     
        <h1><%= book.getTitle() %></h1>
    
        <table>
            <tr>
                <!-- create table cell for product image -->
                <td rowspan = "5">  <!-- cell spans 5 rows -->
                    <img style = "border: thin solid black" src =  
                    "images/<%= book.getImageFile() %>" 
                    alt = "<%= book.getTitle() %>"  />
                </td>
 
                <!-- create table cells for price in row 1 -->
                <td class = "bold" style="padding-left: 20px;">Price:</td>

                <td style="padding-left: 20px;"><%= new DecimalFormat("0.00").format( book.getPrice() ) %></td>
            </tr>

            <tr>

                <!-- create table cells for ISBN in row 2 -->
                <td class = "bold" style="padding-left: 20px;">ISBN #:</td>

                <td style="padding-left: 20px;"><%= request.getParameter("isbn")%></td>
            </tr>
         
            <tr>

                <!-- create table cells for edition in row 3 -->
                <td class = "bold" style="padding-left: 20px;">Edition:</td>

                <td style="padding-left: 20px;"><%= book.getEditionNumber() %></td>
            </tr>
         
            <tr>

                <!-- create table cells for copyright in row 4 -->
                <td class = "bold" style="padding-left: 20px;">Copyright:</td>

                <td style="padding-left: 20px;"><%= book.getCopyright() %></td>
            </tr>
         
            <tr>

                <!-- create Add to Cart button in row 5 -->
                <td style="padding-left: 20px;">
                    <form method = "post" action="addToCart">
                        <p ><input style="width: 150px;" class="btn btn-success btn-lg btn-block" type = "submit" value = "Add to Cart" /></p>
                    </form>
                </td>

                <!-- create View Cart button in row 5 -->
                <td style="padding-left: 20px;">
                    <form method = "get" action="viewCart.jsp">
                        <p><input style="width: 150px;" class="btn btn-primary btn-lg btn-block" type = "submit" value = "View Cart" /></p>
                    <form>
                </td>
            </tr>
        
        </table>
        <br><br><br>
        <!--FOOTER SECTION -->
	    <div id="footer">
	        2016 | All Right Reserved | Terms | Policies | Licenses 
	    </div>
	    <!-- END FOOTER SECTION -->
    </body>
</html>
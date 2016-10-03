<?xml version = "1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- viewCart.jsp -->

<%-- JSP page settings --%>
<%@ page language = "java" session = "true" %>
<%@ page import = "com.abc.bookstore.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>         

<html xmlns = "http://www.w3.org/1999/xhtml">

<head>
   <title>Shopping Cart</title>

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
	  <section  id="services-sec">
        <div class="container">
        	<div class="row ">
   <h4>Shopping Cart</h4>

<%-- start scriptlet to display shopping cart contents --%>
<%  
   Map cart = ( Map ) session.getAttribute( "cart" );
   double total = 0;

   if ( cart == null || cart.size() == 0 ) 
      out.println( "<p>Shopping cart is currently empty.</p>" );
   else {  

      // create variables used in display of cart
      Set cartItems = cart.keySet();
      Iterator iterator = cartItems.iterator();

      BookBean book;
      CartItemBean cartItem;

      int quantity;
      double price, subtotal;

%> <%-- end scriptlet for literal XHTML output --%>

   <table style="width: 70%;">
      <thead><tr>
         <th>Product</th>
         <th>Quantity</th>
         <th>Price</th>
         <th>Total</th>
      </tr></thead>

<% // continue scriptlet 

      while ( iterator.hasNext() ) {

         // get book data; calculate subtotal and total
         cartItem = ( CartItemBean ) cart.get( iterator.next() );
         book = cartItem.getBook();
         quantity = cartItem.getQuantity();
         price = book.getPrice();
         subtotal = quantity * price;
         total += subtotal;

%> <%-- end scriptlet for literal XHTML and   --%>
   <%-- JSP expressions output from this loop --%>

         <%-- display table row of book title, quantity, --%>
         <%-- price and subtotal --%>
         <tr>
            <td><%= book.getTitle() %></td>

            <td><%= quantity %></td>

            <td class = "right">
               <%= 
                  new DecimalFormat( "0.00" ).format( price )
               %>
            </td>

            <td class = "bold right">
               <%= 
                  new DecimalFormat( "0.00" ).format( subtotal ) 
               %>
            </td>
         </tr>

<% // continue scriptlet 

      }  // end of while loop

%> <%-- end scriptlet for literal XHTML and   --%>

      <%-- display table row containing shopping cart total --%>
      <tr>
         <td colspan = "4" class = "bold right"><h4>
         
         <br /><br />
         Total: <%= new DecimalFormat( "0.00" ).format( total ) %></h4>
         </td>
      </tr>
   </table>

<% // continue scriptlet 

      // make current total a session attribute
      session.setAttribute( "total", new Double( total ) );
   }  // end of else

%> <%-- end scriptlet --%>

   <!-- link back to books.jsp to continue shopping -->
   <p class = "bold green">
      
   </p>

   <!-- form to proceed to checkout -->
   <form method = "get" action = "order.html">
   	  <a class="btn btn-primary"  href = "books.jsp">Continue Shopping</a>
      <input class="btn btn-danger" type = "submit" value = "Check Out" />
   </form>
   <br /><br /><br />
   </div></div></section>
    
    <!--FOOTER SECTION -->
    <div id="footer">
        2016 | All Right Reserved | Terms | Policies | Licenses 
    </div>
    <!-- END FOOTER SECTION -->
</body>

</html>

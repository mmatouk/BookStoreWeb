<?xml version = "1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- books.jsp -->

<%-- JSP page settings --%>
<%@ 
   page language = "java" 
   import = "com.abc.bookstore.*, java.util.*" 
   session = "true"
%>

<!-- begin document -->
<html xmlns = "http://www.w3.org/1999/xhtml">

<head>
   <title>Book List</title>

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
    <!--BOOKS SECTION-->    
    <section  id="services-sec">
        <div class="container">
        	<div class="row ">
			<% 
			TitlesBean titlesBean = new TitlesBean();
			List titles = titlesBean.getTitles();
			BookBean currentBook;
			
			// store titles in session for further use
			session.setAttribute( "titles", titles );
			
			// obtain an Iterator to the set of keys in the List
			Iterator iterator = titles.iterator();
			%>
            <h1>AVAILABLE BOOKS : <%= titles.size() %></h1>
            <div class="col-md-12 text-center">
		   <%-- begin JSP scriptlet to create list of books --%>
		   <%

		 
		      // use the Iterator to get each BookBean and create
		      // a link to each book
		      int count =0;
		      while ( iterator.hasNext() ) {
		         currentBook = ( BookBean ) iterator.next();
		         count++;
		
		   %> <%-- end scriptlet to insert literal XHTML and --%>
		      <%-- JSP expressions output from this loop     --%>
		      <div class="col-md-4 ">
				<div class="service-div"  style="height: 300px; padding-top: 10px;">
					<img style = "border: thin solid black" src ="images/<%= currentBook.getImageFile() %>" alt = "" width="50px" height="70px"  />
 
					<h4><%=currentBook.getTitle()%> - <%=currentBook.getPrice()%>$</h4>
					<p>
						<a class="btn btn-success btn btn-block" href="displayBook?isbn=<%=currentBook.getISBN()%>"> VIEW DETAILS </a>
					</p>
				</div>
			</div>
			<%
				// continue scriptlet  
				} // end while loop
			%> <%-- end scriptlet --%> 
		   </div>
		   </div>
        </div>
    </section>
    <!--END SERVICES SECTION-->
    <!--FOOTER SECTION -->
    <div id="footer">
        2016 | All Right Reserved | Terms | Policies | Licenses 
    </div>
    <!-- END FOOTER SECTION -->


</body> 

</html>


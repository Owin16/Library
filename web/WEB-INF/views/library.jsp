<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/css/bootstrap.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=utf8">
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
<div class="container-fluid">
<a class="navbar-brand">LIBRARY</a>
<ul class="nav navbar-nav">
<li class="active"><a href="#newBook" data-toggle="modal">New Book</a></li>
</ul>
</div>
</nav>

<div class="container" style="margin-top: 70px">
<div class="pagination pagination-centered">
<ul class="list-group">

	<c:if test="${!empty bookList}">
		<c:forEach items="${bookList}" var="book">
		<a href="get/${book.id}" class="list-group-item">
			<li>${book.title} - ${book.author}</li>
		</a>
		</c:forEach>
	</c:if>

</ul>
</div>
</div>

<div id="newBook" class="modal fade">
<div class="modal-dialog">
<div class="modal-content">
	<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 class="modal-title">New Book</h4>
	</div>
	<div class="modal-body">
		<form:form method="post" enctype="multipart/form-data" action="add" commandName="book">
		  <div class="form-group" has-feedback >
		    <form:label path="title">Title</form:label>
		    <form:input path="title" class="form-control" type="text" required="required" pattern="[a-zA-Z0-9]{}" placeholder="Book's title"/>
		  </div>
		  <div class="form-group" has-feedback>
		    <form:label path="author">Author</form:label>
		    <form:input path="author" class="form-control" type="text" required="required" pattern="[A-Za-z]{}" placeholder="Book's author"/>
		  </div>
		  <div class="form-group" has-feedback>
		    <form:label path="year">Year</form:label>
		    <form:input path="year" class="form-control" type="number" required="required" min="1000" max="2018" placeholder="Year of create book"/>
		  </div>
		  <div class="form-group" has-feedback>
		    <form:label path="description">Description</form:label>
		    <form:input path="description" class="form-control" type="text" required="required" pattern="[a-zA-Z0-9]{,255}" placeholder="About book"/>
		  </div>
		  	<input type="file" class="form-control" name="file"/>
        		<br />
		  <button id="addBook" type="submit" class="btn btn-success">Add Book</button>
		</form:form>
	</div>
	<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	</div>
</div>
</div>
</div>

<script>
  $(function() {
    $('#addBook').click(function() {
      $('input').each(function() {
      var formGroup = $(this).parents('.form-group');
      if (this.checkValidity()) {
        formGroup.addClass('has-success').removeClass('has-error');
      } else {
        formGroup.addClass('has-error').removeClass('has-success');
        formValid = false;  
      }
    });
  });
});
</script>

</body>
</html>
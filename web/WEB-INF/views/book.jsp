<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../resources/css/bootstrap.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="../resources/js/bootstrap.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=utf8">
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
<div class="container-fluid">
<a href="../" class="navbar-brand">LIBRARY</a>
<ul class="nav navbar-nav">
<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown">Menu<b class="caret"></b></a>
<ul class="dropdown-menu">
<li><a id="edit">Edit book</a></li>
<li><a href="delete/${getBook.id}">Delete book</a></li>
</ul>
</li>
</ul>
</div>
</nav>

<div class="container" style="margin-top: 70px">
<form:form method="post" action="edit" commandName="editBook">
	<div class="visible-xs">
		<form:input path="id"/>
	</div>
  <div class="form-group" has-feedback>
    <form:label path="title">Title</form:label>
    <form:input path="title" class="form-control" type="text" required="required" pattern="[a-zA-Z0-9]{}" placeholder="${getBook.title}" disabled="true"/>
  </div>
  <div class="form-group" has-feedback>
    <form:label path="author">Author</form:label>
    <form:input path="author" class="form-control" type="text" required="required" pattern="[A-Za-z]{}" placeholder="${getBook.author}" disabled="true"/>  
  </div>
  <div class="form-group" has-feedback>
    <form:label path="year">Year</form:label>
    <form:input path="year" class="form-control" type="number" required="required" min="1000" max="2018" placeholder="${getBook.year}" disabled="true"/>
  </div>
  <div class="form-group" has-feedback>
    <form:label path="description">Description</form:label>
    <form:input path="description" class="form-control" type="text" required="required" pattern="[a-zA-Z0-9]{,255}" placeholder="${getBook.description}" disabled="true"/>
  </div>
  <button id="saveBook" type="submit" class="btn btn-success" disabled>Save</button>
</form:form>


<script>
$(function (){
$('#edit').click(function (){
$('input').removeAttr('disabled');
$('textarea').removeAttr('disabled');
$('button').removeAttr('disabled');
});
$('#saveBook').click(function() {
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
</div>
</body>
</html>
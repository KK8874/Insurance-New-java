<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
new TomSelect('#select-person',{
	create: true,
	sortField: {
		field: 'text',
		direction: 'asc'
	}
});
</style>
</head>
<body>
<form>
	<select id="select-person" placeholder="Select a person..." required>
		<option value="">Select a person...</option>
		<option value="4">Thomas Edison</option>
		<option value="1">Nikola</option>
		<option value="3">Nikola Tesla</option>
		<option value="5">Arnold Schwarzenegger</option>
	</select>
	<div class="py-3">
		<button type="submit" class="btn btn-primary">Submit</button>
	</div>
</form>
</body>
</html>

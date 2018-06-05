<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>submitReimburstment</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
        integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="../ReimbursementCss/bootstrap.css/">
</head>
<body>
			<%@ page import="com.revature.employee.GenericEmployee" %>
			<%GenericEmployee emp = (GenericEmployee) request.getSession().getAttribute("authorizedUser"); %>
            <% if (emp != null) { %>
            <div class="container">
                <div class="jumbotron">
                    <h1 class="display-4">Submit a Reinburstment for approval</h1>
                    <hr class="my-4">
                </div>
            </div>

            <div class="container">
                    <nav class="navbar navbar-inverse">
                            <div class="navbar-header col-md-2">
                                <a href="./employeeHome.jsp" class="navbar-brand">Home</a>
                            </div>
                            <ul class="navbar-nav nav col-md-6">
                                <li><a href="./employeeInfo.jsp">Info</a></li>
                                <li><a href="./viewEmployeeReimburstment.jsp">View</a></li>
                                <li  class="active"><a href="./submitEmployeeReimburstment.jsp">Submit</a></li>
                            </ul>
                            <ul class="navbar-nav nav navbar-right col-md-2 offset-md-2">
                                <li><a href="logout.do">Log out <span class="glyphicon glyphicon-log-out"></span></a></li> 
                            </ul>
                        
                    </nav>
                </div>
                <div class="container">
		<div class ="container">
        <div class ="col-md-6 col-offset-3">
        <form enctype="multipart/form-data" action="reburEmp.do" method="post">
				<div class="form-group">
					<input type="text" name="category" class="form-control" required
						placeholder="Category">
				</div>
				<div class="form-group">
					<input type="text" name="amount" class="form-control"
						required placeholder="Amount">
				</div>
				<div class="form-group">
				<input type="file" name="photo" id="photo" accept=".png">
 				</div>
				<div class="button-group">
					<input type="submit" class="btn btn-success" value="Submit">
					<input type="reset" class="btn btn-danger" value="Reset">
				</div>
			</form>
        </div>
        </div>
                        <% } else {%>

<% } %>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>
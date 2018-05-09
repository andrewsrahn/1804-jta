<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Home</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
        integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="../ReimbursementCss/bootstrap.css/">
</head>
<body>
            <div class="container">
                <div class="jumbotron">
                    <h1 class="display-4">Create A User</h1>
                    <hr class="my-4">
                </div>
            </div>

            <div class = "col-md-3 col-md-offset-5">
                    <form action-"#">
                        <div class="form-group well">
                            <label for="Username"><strong>Username</strong></label>
                            <input type="text" name="username" id="username" required class = "form-control">
                
                            <label for="Password"><strong>Password</strong></label>
                            <input type="text" name="password" id="password" required class = "form-control">
                            
                            <label for="Confirm Password"><strong>Confirm Password</strong></label>
                            <input type="text" name="confirm password" id="confirm password" required class = "form-control">

                            <label for="FirstName"><strong>First Name</strong></label>
                            <input type="text" name="firstname" id="firstname"class = "form-control">
                           
                            <label for="LastName"><strong>Password</strong></label>
                            <input type="text" name="lastname" id="lastname"class = "form-control">
                            <br>
                            <button id ="submitBtn" class="btn btn-primary" type ="button">Submit</button>
                        </div>
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" 
    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>


<div class="row">
            <div class="col-xs-10 col-sm-10 col-md-4 col-lg-4  col-xs-offset-1 col-sm-offset-1 col-md-offset-4 pallet">
                <form class="form-login" method="POST" id="login-form">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center" >
                        <p style="font-size: 23px;margin-bottom: 0px; padding-bottom: 0px; line-height: 25px;"><?php echo  getenv('SYS_NAME')?></p>
                        <p style="padding-top: 0px; margin-top: 0px;">Create Your <?php echo  getenv('SYS_NAME')?> Account</p>
                        <br> 
                    </div>

                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div id="error"></div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Email" name="user_email" id="user_email" />
                            <span id="check-e"></span>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="form-group">
                            <button type="submit" class="btn btn-success btn-block" name="submit_btn" id="submit_btn"> Submit</button>
                        </div>
                    </div> 
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <a href="login.php" class="forgots"><b><u>Already have an Account?Sign In</u></b></a>
                    </div> 
                </form>
        </div>
        <div class="row">
            <div class="col-xs-10 col-sm-10 col-md-4 col-lg-4  col-xs-offset-1 col-sm-offset-1 col-md-offset-4" style="margin-top: 15px;">
                <p style="font-size: 9px; color: white;">*Our website supports the latest browser versions to ensure your privacy and security. To ensure access and for best viewing experience, please upgrade to the latest versions of Mozilla Firefox, Google Chrome, Safari or Internet Explorer as soon as possible</p>
                <p style="font-size: 9px; color: white;">*Detailed instructions can be found <a href="index.php?page=instructions" class="logininfo"><b>here</b></a>.</p>
            </div>
        </div>


<script type="text/javascript">
    $('document').ready(function() { 
        /* handling form validation */
        $("#login-form").validate({
            rules: {
                user_email: {
                    required: true,
                    email: true
                },  
            },
            messages: { 
                user_employeeid: "Please enter an email",
            },
            submitHandler: loginsubmitForm   
        });    
        /* Handling login functionality */
        function loginsubmitForm() {     
            var data = $("#login-form").serialize();   
            console.log(data);             
            $.ajax({                
                type : 'POST', 
                url  : 'pages_exe/authentication/register_exe.php',
                data : data,
                success: function(data, status) {
                    console.log(data);
                    var newdata = JSON.parse(data);
                    //display passed data
                   
                    //parse data
                    /* var newdata = JSON.parse(data);

                   
                    //console log parse data message
                    console.log(newdata.json.message);
 */
console.log(newdata.code);


                    if (newdata.code == "exist") {
                        alert("Email already exist");
                    } else {
                        alert("Email available");
                    }
                }
            });
            return false;
        }   
    });
</script>
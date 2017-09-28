<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<style>
    body {
        background-image:url(/background50.jpg) ; 
        background-repeat:no-repeat;
    }
    .logo {
        font-size:24px;
        color:white;
    }
    .textWhiteLarge {
        font-size:36px;
        color:white;
    }
    .textOrangeLarge {
        font-size:36px;
        color:orange;
    }
    .textKids {
        font-size:24px;
        color:deepskyblue;
        padding-left:130px;
    }
    .userInput {
        color:white;
        width:200px;
        border:2px;
        background-color:transparent;
        border-right-style:none;
        border-left-style:none;
        border-top-style:none;
        border-bottom-color:gray;
        border-bottom-style:solid;
    }
    .errorMessage {
        color:red;
        font-size:12px;
        font-weight:bold;
    }
    .passMessage {
        color:green;
        font-size:12px;
        font-weight:bold;
    }
    .formSubmit {
        background-color:orange;
        color:white;
        width:200px;
    }
</style>
<head runat="server">
    <title></title>
</head>
<body">
    <form id="form1" runat="server">
    <div>
        <span class="logo">PNC</span> <br />
        <span class="textWhiteLarge">Virtual</span><span class="textOrangeLarge">Wallet</span> <br />
        <span class="textKids">4 Kids</span><br />
        <label id="errMsg" class="errorMessage"></label><br />
        <input id="userName" class="userInput" type="text" placeholder="User Name" /> <br />
        <input id="password" class="userInput" type="password" placeholder="Password" /> <br />
        <input name="submit" class="formSubmit" type="button" value="Login In" onclick="clickFormSubmit();" /><br />
        <label id="loggedIn" class="passMessage"></label>
    </div>
    </form>

<script src="jquery-1.11.1.min.js"></script>
<script type="text/javascript">
    function clickFormSubmit() {
        var uName = document.getElementById("userName").value;
        var psw = document.getElementById("password").value;
        console.log(uName);
        console.log(psw);
        if (uName.length < 1) { document.getElementById("errMsg").innerText = "You must enter your username!"; return; }
        if (psw.length < 1) { document.getElementById("errMsg").innerText = "You must enter your password!"; return; }
        document.getElementById("errMsg").innerText = "";
        document.getElementById("loggedIn").innerText = "";
        var settings = {
            "async": true,
            "crossDomain": true,
            "url": "https://nginx0.pncapix.com/Security/v2.0.0/login",
            "method": "POST",
            "headers": {
                "content-type": "application/json",
                "accept": "application/json",
                "authorization": "Bearer 9462b358-6f80-31fc-bbb6-63a5a97df5d6",
                "cache-control": "no-cache"
            },
            "processData": false,
            "data": "{ \n   \"password\": \"" + psw +"\", \n   \"username\": \"" + uName + "\" \n }"
        }

        $.ajax(settings).done(function (response) {
            if (response.token) {
                //success
                document.getElementById("loggedIn").innerText = "You have successfully logged in.";
            }
        })
        .fail(function () {
            document.getElementById("errMsg").innerText = "You have entered invalid username or password";
        });
    }
</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User:芮梓铭
  Date:2023/4/24
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>SSM登录</title>
    <link href="${pageContext.request.contextPath}/statics/css/start.css" rel="stylesheet" type="text/css" charset="utf-8"/>
</head>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
    function a1(){
        $.ajax({
            url:"${pageContext.request.contextPath}/a",
            data:{'username':$("#username").val()},
            // type:"post",
            // dataType:"json",
            success:function (result) {
                if (result.toString()==='OK'){
                    $("#userInfo").css("color","green");
                    result="√";
                }else if(result.toString()==='FIND_ERR'){
                    $("#userInfo").css("color","red");
                    result="找不到该用户";
                }
                $("#userInfo").html(result);
            },
            error:function (result){
                alert(result);
            }

        });
    }
    function a2(){
        $.ajax({
            url:"${pageContext.request.contextPath}/a",
            data:{'username':$("#username").val(), 'userpwd':$("#userpwd").val()},
            success:function (result) {
                if (result.toString()==='OK'){
                    $("#pwdInfo").css("color","green");
                    result="√";
                }else if(result.toString()==='PWD_ERR'){
                    $("#pwdInfo").css("color","red");
                    result="密码错误";
                }
                $("#pwdInfo").html(result);
            },
            error:function (result) {
                alert(result);
            }

        });
    }
    <%--$(document).ready(function() {--%>
    <%--});--%>
</script>
<body>
<div class="img_1">
<div class="header">
    <h2>登录</h2>
</div>
<div class="row">
    <div class="column side">
        <a href="new.jsp"><button class="button button1">QQ登录</button><br></a>
        <a href="new.jsp"><button class="button button2">微信登录</button><br></a>
        <a href="new.jsp"><button class="button button3">支付宝登录</button><br></a>
    </div>
    <div class="column middle">
        <h2>or</h2>
    </div>
    <div class="column side">
        <form action="${pageContext.request.contextPath}/logindo" id="loginForm">
            <input type="text" name="username" class="input" id="username"  placeholder="用户名"
                   size="32" onblur="a1()" required/>
            <div id="userInfodiv">
                <span id="userInfo"></span>
            </div><br/>
            <input type="password" name="userpwd" class="input" id="userpwd"  placeholder="密码"
                   size="32" onblur="a2()" required/>
            <div div="pwdInfodiv">
                <span id="pwdInfo"></span>
            </div>
            <br/>
            <input type="submit" class="button buttonup" value="登录"/>
        </form>
        <br>
    </div>
</div>

<div class="footer">
    <a href="${pageContext.request.contextPath}/sign">
        <button class="button buttonfooter" >注册</button>
    </a>
    <a href="${pageContext.request.contextPath}/changepwd">
        <button class="button buttonfooter" onclick="" >忘记密码？</button>
    </a>
</div>
</div>
</body>

</html>




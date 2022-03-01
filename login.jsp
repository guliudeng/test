<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css"/>
    <title>EasyMall欢迎您登陆</title>
</head>
<body>
<h1>欢迎登陆EasyMall</h1>
<form action="${pageContext.request.contextPath}/LoginServlet" method="POST">
    <table>
        <tr>
            <td colspan="2">
                <span>
                    <font color="red">${requestScope.msg}</font>
                </span>
            </td>
        </tr>
        <tr>
            <%
                //从Cookie中获取记住的用户名
                Cookie [] cs = request.getCookies();
                Cookie findC = null;
                if(cs!=null){
                    for(Cookie c : cs){
                        if("remnamec".equals(c.getName())){
                            findC = c;
                            break;
                        }
                    }
                }
                String uname = "";
                if(findC!=null){
                    String v = findC.getValue();
                    uname = URLDecoder.decode(v,"utf-8");
                }
                pageContext.setAttribute("uname",uname);
            %>
            <td class="tdx">用户名:</td>
            <td><input type="text" name="username" value="${uname}"/></td>
        </tr>
        <tr>
            <td class="tdx">密码:</td>
            <td><input type="password" name="password"/></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="checkbox" name="remname" value="true"
                    <%
                        if(findC!=null){
                        %>
                            checked="checked"
                        <%
                        }
                    %>
                />记住用户名
                <input type="checkbox" name="autologin" value="true"/>30天内自动登陆
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="登陆"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>

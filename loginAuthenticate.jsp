
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
 
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Authentication page</title>
  </head>
  <body>
    <c:if test="${ empty param.username or empty param.password}">
      <c:redirect url="login.jsp" >
              <c:param name="errMsg" value="Please Enter UserName and Password" />
      </c:redirect>
       
    </c:if>
     
    <c:if test="${not empty param.username and not empty param.password}">
    
      <s:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/doctorsInfo"
                       user="root" password="root"/>
 
      <s:query dataSource="${ds}" var="selectQ">
        select count(*) as kount from doctors
        where name='${param.username}'
        and pass='${param.password}'
      </s:query>  
      <c:forEach items="${selectQ.rows}" var="r">
        <c:choose>
        
          <c:when test="${r.kount gt 0}">
            <c:set scope="session"
                   var="loginUser"
                   value="${param.username}"/>
            
            <c:redirect url="your_account.jsp">
                 <c:param name="username" value="${param.username}"/>
            </c:redirect>
           
          </c:when>
          <c:otherwise>
            <c:redirect url="login.jsp" >
              <p><c:param name="errMsg" value="Username/password does not match" /></p>
            </c:redirect>
          </c:otherwise>
        </c:choose>
 
      </c:forEach>
 
    </c:if>
 
  </body>
</html>
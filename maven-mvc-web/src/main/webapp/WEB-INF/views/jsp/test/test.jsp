<%@ page language="java" contentType="text/html;charset=utf-8"%> 
<html> 
<head> 
<title>include的两种用法</title> 
<%-- <jsp:include page="date.jsp" flush="true"/>  --%>
<%@ include file="date.jsp" %>
<!-- //我们在这里用include的两种不同形式来引入date.jsp这个文件.  -->
<head> 
<body> 
<table><tr><td> 
有关jsp中include的两种用法.敬请关注。 
</td></tr></table> 
</body> 
</html> 
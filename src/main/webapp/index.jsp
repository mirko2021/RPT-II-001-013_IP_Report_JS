<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>INDEX</title>
	</head>
	<body>
		<h1>Линкови</h1>
		<%
			bean.FileListingBean bean = (bean.FileListingBean) request.getSession().getAttribute("bean"); 
			if(bean==null) bean = new bean.FileListingBean();
			request.getSession().setAttribute("bean", bean);
			if(request.getParameter("random")!=null) bean.randomFileSelect(); 
			for(java.io.File file: bean.files()){
				request.getSession().setAttribute("file", file);
				%><a href='${bean.web(pageContext.request, file)}' target='_blank'><%=bean.relative(file)%></a><br><%
			}
		%>
		<h1>Случајни линк</h1>
		<form method='POST' id='_random_index_refresh_form'><input type='submit' name='random' value='Освјежавање случајног линка'/></form><br>
		<a href='${bean.web(pageContext.request, bean.getRandomFileSelect())}' target='_blank'><%=bean.relative(bean.getRandomFileSelect())%></a><br><br>
	</body>
</html>
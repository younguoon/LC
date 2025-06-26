<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String vp = (String) request.getAttribute("viewPage");
    out.println("### viewPage: " + vp);
%>

  <jsp:include page="/WEB-INF/jsp/layout/includeFiles.jsp"/>

  <body>
    <div class="sidebar sidebar-dark sidebar-fixed" id="sidebar">
      <!-- Sidebar Menu 복붙 -->
    </div>
    <div class="wrapper d-flex flex-column min-vh-100 bg-light">
      <header class="header header-sticky mb-4">
        <!-- Header 영역 복붙 -->
      </header>

      <div class="body flex-grow-1 px-3">
        <main class="container-lg">
          <jsp:include page="${viewPage}" />
        </main>
      </div>
    </div>
  </body>

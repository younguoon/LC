<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="UTF-8">

<jsp:include page="/WEB-INF/jsp/layout/includeFiles.jsp" />

<body class="c-app">
  <!-- LNB 영역 -->
  <jsp:include page="/WEB-INF/jsp/layout/lnb.jsp" />

  <div class="wrapper d-flex flex-column min-vh-100 bg-light">
    <!-- 헤더 영역 -->
    <jsp:include page="/WEB-INF/jsp/layout/header.jsp" />

    <div class="body flex-grow-1 px-3">
      <main class="container-lg">
        <jsp:include page="${viewPage}" />
      </main>
    </div>
  </div>
</body>

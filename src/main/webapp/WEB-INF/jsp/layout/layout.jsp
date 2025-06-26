<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
  <meta charset="UTF-8">
</head>

<jsp:include page="/WEB-INF/jsp/layout/includeFiles.jsp" />


<body class="c-app">
  <jsp:include page="/WEB-INF/jsp/layout/lnb.jsp" />
  <div class="wrapper d-flex flex-column min-vh-100 bg-light">
    <header class="header header-sticky mb-4">
      <!-- Header Content -->
    </header>
    <div class="body flex-grow-1 px-3">
      <main class="container-lg">
        <jsp:include page="${viewPage}" />
      </main>
    </div>
  </div>
</body>

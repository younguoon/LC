<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<haed>
    <!-- JS-->
    <script src="/js/jquery/jquery-3.7.1.min.js"></script>
    <script src="/js/jquery/jquery-ui.min.js"></script>
    <script src="/js/jquery/jquery.validate.min.js"></script>

    <!-- Bootstrap-->
    <c:forEach var="js" items="${autoJsFiles}">
        <script src="${js}"></script>
    </c:forEach>

    <script src="/js/common/common.js"></script>


    
    <!-- CSS-->
    <!-- Bootstrap-->
    <c:forEach var="css" items="${autoCssFiles}">
        <link rel="stylesheet" href="${css}"/>
    </c:forEach>

    <link rel="stylesheet" href="/css/jquery/jquery-ui.min.css">
    <link rel="stylesheet" href="/css/jquery/jquery-ui.structure.min.css">
    <link rel="stylesheet" href="/css/jquery/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="/css/jquery/layout.css">
    <link rel="stylesheet" href="/css/jquery/style.css">
</haed>
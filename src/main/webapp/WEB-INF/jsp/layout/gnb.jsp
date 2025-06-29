<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 브레드크럼 네비게이션 -->
<nav aria-label="breadcrumb" class="mb-4">
  <ol class="breadcrumb bg-transparent p-0">
    <li class="breadcrumb-item">
      <a href="/admin/dashboard" class="text-decoration-none" style="color: #321fdb;">
        <i class="fas fa-home me-1"></i>홈
      </a>
    </li>
    
    <!-- 동적으로 현재 페이지에 따라 breadcrumb 생성 -->
    <c:choose>
      <c:when test="${pageInfo.menuDepth1 != null}">
        <li class="breadcrumb-item">
          <c:if test="${pageInfo.menuDepth1Link != null}">
            <a href="${pageInfo.menuDepth1Link}" class="text-decoration-none" style="color: #321fdb;">${pageInfo.menuDepth1}</a>
          </c:if>
          <c:if test="${pageInfo.menuDepth1Link == null}">
            <span style="color: #5a6c7d;">${pageInfo.menuDepth1}</span>
          </c:if>
        </li>
      </c:when>
    </c:choose>
    
    <c:choose>
      <c:when test="${pageInfo.menuDepth2 != null}">
        <li class="breadcrumb-item">
          <c:if test="${pageInfo.menuDepth2Link != null}">
            <a href="${pageInfo.menuDepth2Link}" class="text-decoration-none" style="color: #321fdb;">${pageInfo.menuDepth2}</a>
          </c:if>
          <c:if test="${pageInfo.menuDepth2Link == null}">
            <span style="color: #5a6c7d;">${pageInfo.menuDepth2}</span>
          </c:if>
        </li>
      </c:when>
    </c:choose>
    
    <c:choose>
      <c:when test="${pageInfo.currentPage != null}">
        <li class="breadcrumb-item active" aria-current="page" style="color: #5a6c7d;">
          ${pageInfo.currentPage}
        </li>
      </c:when>
    </c:choose>
  </ol>
</nav>

<!-- 페이지 헤더 (선택사항) -->
<c:if test="${pageInfo.pageTitle != null}">
  <div class="row mb-4">
    <div class="col-12">
      <div class="d-flex justify-content-between align-items-center">
        <div>
          <h1 class="h3 mb-1" style="color: #2d3748;">${pageInfo.pageTitle}</h1>
          <c:if test="${pageInfo.pageDescription != null}">
            <p class="text-muted mb-0" style="color: #5a6c7d;">${pageInfo.pageDescription}</p>
          </c:if>
        </div>
        <div>
          <!-- 페이지별 액션 버튼들이 들어갈 자리 -->
          <c:if test="${pageInfo.actionButtons != null}">
            ${pageInfo.actionButtons}
          </c:if>
        </div>
      </div>
    </div>
  </div>
</c:if>
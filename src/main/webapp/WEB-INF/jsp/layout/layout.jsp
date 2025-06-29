<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="/WEB-INF/jsp/layout/includeCssFiles.jsp" />
</head>

<body class="light-theme" style="background-color: #f8f9fc; color: #5a6c7d;">

  <!-- Sidebar -->
  <div class="sidebar sidebar-fixed sidebar-lg-show" id="sidebar" 
       style="background: linear-gradient(180deg, #2d3748 0%, #1a202c 100%); border-right: 1px solid #4a5568; width: 256px; position: fixed; top: 0; left: 0; bottom: 0; z-index: 1000;">
    <jsp:include page="/WEB-INF/jsp/layout/lnb.jsp" />
  </div>

  <!-- Main Wrapper (사이드바 옆으로 밀기) -->
  <div class="wrapper d-flex flex-column min-vh-100" style="margin-left: 256px; transition: margin-left 0.3s ease;">

    <!-- Header -->
    <header class="header header-sticky mb-4" 
            style="background: #ffffff; border-bottom: 1px solid #d8dbe0; position: sticky; top: 0; z-index: 999; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);">
      <jsp:include page="/WEB-INF/jsp/layout/header.jsp" />
    </header>

    <!-- Body -->
    <div class="body flex-grow-1 px-3">
      <div class="container-fluid">
        <!-- 메인 컨텐츠 -->
        <jsp:include page="${viewPage}" />
      </div>
    </div>

    <!-- Footer -->
    <footer class="footer mt-auto" style="background: #ffffff; border-top: 1px solid #d8dbe0;">
      <div class="container-fluid">
        <span class="text-muted small">© 2024 CHECK IN SEOUL. All rights reserved.</span>
      </div>
    </footer>

  </div>

  <!-- JavaScript Files -->
  <jsp:include page="/WEB-INF/jsp/layout/includeJsFiles.jsp" />
  
  <!-- 추가 토글 스크립트 -->
  <script>
  document.addEventListener('DOMContentLoaded', function() {
      console.log('라이트 테마 레이아웃 초기화');
      
      // 사이드바 최소화 상태 관리
      let sidebarMinimized = false;
      
      // 토글 버튼 클릭 이벤트 (전역으로 처리)
      document.addEventListener('click', function(e) {
          if (e.target.closest('#sidebarToggle') || e.target.closest('.header-toggler')) {
              e.preventDefault();
              console.log('토글 버튼 클릭 - 라이트 모드');
              
              const sidebar = document.getElementById('sidebar');
              const wrapper = document.querySelector('.wrapper');
              
              if (sidebar && wrapper) {
                  sidebarMinimized = !sidebarMinimized;
                  
                  if (sidebarMinimized) {
                      // 사이드바 축소
                      sidebar.style.width = '60px';
                      wrapper.style.marginLeft = '60px';
                      
                      // 텍스트 숨기기
                      hideMenuTexts();
                      
                      // 브랜드 텍스트 변경
                      const brandFull = sidebar.querySelector('.sidebar-brand-full');
                      const brandMin = sidebar.querySelector('.sidebar-brand-minimized');
                      if (brandFull) brandFull.style.display = 'none';
                      if (brandMin) {
                          brandMin.style.display = 'block';
                          brandMin.style.textAlign = 'center';
                      }
                      
                  } else {
                      // 사이드바 확장 - 페이지 새로고침으로 원래대로
                      location.reload();
                  }
                  
                  console.log('사이드바 상태:', sidebarMinimized ? '축소됨' : '확장됨');
              }
          }
      });
      
      // 메뉴 텍스트 숨기기 함수
      function hideMenuTexts() {
          const navLinks = document.querySelectorAll('#sidebar .nav-link');
          navLinks.forEach(link => {
              const icon = link.querySelector('i');
              if (icon) {
                  link.innerHTML = '';
                  link.appendChild(icon);
                  link.style.justifyContent = 'center';
                  link.style.padding = '0.75rem 0';
              }
          });
          
          // 제목들 숨기기
          const navTitles = document.querySelectorAll('#sidebar .nav-title');
          navTitles.forEach(title => {
              title.style.display = 'none';
          });
      }
  });
  </script>

</body>
</html>
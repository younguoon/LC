<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- 사이드바 브랜드 -->
<div class="sidebar-brand d-md-down-none" style="background: #2d3748; border-bottom: 1px solid #4a5568; padding: 1rem 1.5rem;">
  <div class="sidebar-brand-full">
    <strong style="color: #ffffff; font-weight: 600; font-size: 1.25rem;">CHECK IN SEOUL</strong>
  </div>
  <div class="sidebar-brand-minimized" style="display: none;">
    <strong style="color: #ffffff;">CIS</strong>
  </div>
</div>

<!-- 사이드바 메뉴 -->
<ul class="sidebar-nav" style="padding: 0;">

  <!-- 대시보드 -->
  <li class="nav-item">
    <a class="nav-link active" href="/admin/dashboard" 
       style="color: #ffffff; background: #321fdb; padding: 0.75rem 1.5rem; display: flex; align-items: center; transition: all 0.15s ease-in-out; border: none; text-decoration: none;">
      <i class="nav-icon fas fa-tachometer-alt" style="margin-right: 0.75rem; width: 1rem; text-align: center;"></i> 대시보드
    </a>
  </li>

  <!-- 구분선 -->
  <li class="nav-title" style="color: #a0aec0; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; padding: 1rem 1.5rem 0.5rem; margin: 0;">사용자 관리</li>

  <!-- 권한 그룹 관리 -->
  <li class="nav-item">
    <a class="nav-link" href="/admin/user-groups" 
       style="color: #e2e8f0; padding: 0.75rem 1.5rem; display: flex; align-items: center; transition: all 0.15s ease-in-out; border: none; text-decoration: none;">
      <i class="nav-icon fas fa-users" style="margin-right: 0.75rem; width: 1rem; text-align: center; opacity: 0.8;"></i> 권한 그룹 관리
    </a>
  </li>

  <!-- 사용자 관리 -->
  <li class="nav-item">
    <a class="nav-link" href="/admin/users" 
       style="color: #e2e8f0; padding: 0.75rem 1.5rem; display: flex; align-items: center; transition: all 0.15s ease-in-out; border: none; text-decoration: none;">
      <i class="nav-icon fas fa-user" style="margin-right: 0.75rem; width: 1rem; text-align: center; opacity: 0.8;"></i> 사용자 관리
    </a>
  </li>

  <!-- 구분선 -->
  <li class="nav-title" style="color: #a0aec0; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; padding: 1rem 1.5rem 0.5rem; margin: 0;">시스템 관리</li>

  <!-- 메뉴 관리 -->
  <li class="nav-item">
    <a class="nav-link" href="/admin/menus" 
       style="color: #e2e8f0; padding: 0.75rem 1.5rem; display: flex; align-items: center; transition: all 0.15s ease-in-out; border: none; text-decoration: none;">
      <i class="nav-icon fas fa-list" style="margin-right: 0.75rem; width: 1rem; text-align: center; opacity: 0.8;"></i> 메뉴 관리
    </a>
  </li>

  <!-- 시스템 설정 -->
  <li class="nav-item">
    <a class="nav-link" href="/admin/system-settings" 
       style="color: #e2e8f0; padding: 0.75rem 1.5rem; display: flex; align-items: center; transition: all 0.15s ease-in-out; border: none; text-decoration: none;">
      <i class="nav-icon fas fa-cog" style="margin-right: 0.75rem; width: 1rem; text-align: center; opacity: 0.8;"></i> 시스템 설정
    </a>
  </li>

  <!-- 하위 메뉴 예시 (고급 설정) -->
  <li class="nav-item">
    <a class="nav-link" href="/admin/advanced" 
       style="color: #e2e8f0; padding: 0.75rem 1.5rem; display: flex; align-items: center; transition: all 0.15s ease-in-out; border: none; text-decoration: none;">
      <i class="nav-icon fas fa-puzzle-piece" style="margin-right: 0.75rem; width: 1rem; text-align: center; opacity: 0.8;"></i> 고급 설정
    </a>
  </li>

</ul>

<style>
/* 사이드바 호버 효과 */
.nav-link:hover {
    background: rgba(255, 255, 255, 0.1) !important;
    color: #ffffff !important;
}

/* 활성 메뉴 스타일 */
.nav-link.active {
    background: #321fdb !important;
    color: #ffffff !important;
    position: relative;
}

.nav-link.active::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 3px;
    background: #ffffff;
}

/* 축소된 사이드바용 스타일 */
.sidebar-minimized .nav-link {
    justify-content: center !important;
    padding: 0.75rem 0 !important;
}

.sidebar-minimized .nav-title {
    display: none !important;
}

.sidebar-minimized .sidebar-brand-full {
    display: none !important;
}

.sidebar-minimized .sidebar-brand-minimized {
    display: block !important;
    text-align: center !important;
}
</style>
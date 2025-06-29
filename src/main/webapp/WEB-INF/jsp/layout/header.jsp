<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid">
    <!-- Sidebar Toggler - 더 명확하게 -->
    <button class="header-toggler px-md-0 me-md-3" type="button" 
            data-coreui-toggle="sidebar" data-coreui-target="#sidebar"
            style="border: none; background: transparent; font-size: 1.25rem; color: #6c757d;">
        <i class="fas fa-bars"></i>
    </button>
    
    <!-- Brand for mobile -->
    <a class="header-brand d-md-none" href="#">
        <strong>CHECK IN SEOUL</strong>
    </a>
    
    <!-- Header Nav -->
    <ul class="header-nav ms-auto">
        <!-- Notifications -->
        <li class="nav-item dropdown">
            <a class="nav-link py-0" data-coreui-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                <div class="avatar avatar-md">
                    <i class="fas fa-bell"></i>
                </div>
            </a>
            <div class="dropdown-menu dropdown-menu-end pt-0 w-auto">
                <div class="dropdown-header bg-light py-2 px-3">
                    <strong>알림 3개</strong>
                </div>
                <a class="dropdown-item" href="#">
                    <i class="fas fa-user me-2 text-success"></i>
                    새로운 회원이 가입했습니다.
                    <small class="text-muted ms-auto">방금 전</small>
                </a>
                <a class="dropdown-item" href="#">
                    <i class="fas fa-map-marker-alt me-2 text-primary"></i>
                    새로운 체크인이 있습니다.
                    <small class="text-muted ms-auto">5분 전</small>
                </a>
                <a class="dropdown-item" href="#">
                    <i class="fas fa-exclamation-triangle me-2 text-warning"></i>
                    신고가 접수되었습니다.
                    <small class="text-muted ms-auto">10분 전</small>
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item text-center" href="#">모든 알림 보기</a>
            </div>
        </li>
        
        <!-- User Menu -->
        <li class="nav-item dropdown">
            <a class="nav-link py-0" data-coreui-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                <div class="avatar avatar-md">
                    <i class="fas fa-user-circle"></i>
                </div>
            </a>
            <div class="dropdown-menu dropdown-menu-end pt-0 w-auto">
                <div class="dropdown-header bg-light py-2">
                    <div class="fw-semibold">${loginUser}</div>
                    <div class="text-muted small">관리자</div>
                </div>
                <a class="dropdown-item" href="#" onclick="submitPostForm('/admin/profile')">
                    <i class="fas fa-user me-2"></i>프로필
                </a>
                <a class="dropdown-item" href="#" onclick="submitPostForm('/admin/settings')">
                    <i class="fas fa-cogs me-2"></i>설정
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" onclick="logout()">
                    <i class="fas fa-sign-out-alt me-2"></i>로그아웃
                </a>
            </div>
        </li>
    </ul>
</div>

<!-- 로그아웃 폼 (숨김) -->
<form id="logoutForm" method="POST" action="/logout" style="display: none;">
</form>
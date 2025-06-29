<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="text-center">
    <div class="mb-4">
        <i class="fas fa-ban" style="font-size: 64px; color: #dc3545;"></i>
    </div>
    
    <h2 class="text-danger mb-3">접근 거부</h2>
    
    <div class="alert alert-danger" role="alert">
        <h5 class="alert-heading">
            <i class="fas fa-exclamation-triangle me-2"></i>
            GET 요청으로는 접근할 수 없습니다
        </h5>
        <p class="mb-0">
            보안상의 이유로 관리자 페이지는 <strong>POST 요청만</strong> 허용됩니다.<br>
            올바른 경로를 통해 접근해주세요.
        </p>
    </div>
    
    <div class="mt-4">
        <form method="POST" action="/login" style="display: inline;">
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-sign-in-alt me-2"></i>
                로그인 페이지로 이동
            </button>
        </form>
    </div>
    
    <div class="mt-3">
        <small class="text-muted">
            관리자 시스템은 POST 방식으로만 접근 가능합니다.
        </small>
    </div>
</div>

<style>
.alert {
    border-radius: 10px;
    border: none;
    box-shadow: 0 4px 6px rgba(220, 53, 69, 0.1);
}

.btn {
    border-radius: 8px;
    padding: 10px 20px;
}

.btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
</style>
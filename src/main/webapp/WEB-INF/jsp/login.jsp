<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 에러 메시지 표시 -->
<c:if test="${not empty error}">
    <div class="error-message">
        <i class="fas fa-exclamation-triangle me-2"></i>
        ${error}
    </div>
</c:if>

<!-- 로그인 폼 -->
<form method="POST" action="/login" id="loginForm">
    <!-- 사용자명 입력 -->
    <div class="form-floating">
        <input type="text" class="form-control" id="username" name="username" 
               placeholder="아이디를 입력하세요" required>
        <label for="username">
            <i class="fas fa-user me-2"></i>아이디
        </label>
    </div>
    
    <!-- 비밀번호 입력 -->
    <div class="form-floating">
        <input type="password" class="form-control" id="password" name="password" 
               placeholder="비밀번호를 입력하세요" required>
        <label for="password">
            <i class="fas fa-lock me-2"></i>비밀번호
        </label>
    </div>
    
    <!-- 로그인 유지 체크박스 -->
    <div class="remember-me">
        <div class="form-check">
            <input class="form-check-input" type="checkbox" id="remember" name="remember" value="true">
            <label class="form-check-label" for="remember">
                로그인 상태 유지
            </label>
        </div>
        <a href="#" class="text-decoration-none" style="font-size: 14px;">
            비밀번호 찾기
        </a>
    </div>
    
    <!-- 로그인 버튼 -->
    <button type="submit" class="btn btn-primary btn-login">
        <i class="fas fa-sign-in-alt me-2"></i>
        로그인
    </button>
</form>

<!-- 테스트 계정 안내 -->
<div class="mt-4 text-center">
    <small class="text-muted">
        <strong>테스트 계정:</strong><br>
        아이디: <code>admin</code><br>
        비밀번호: <code>admin123</code>
    </small>
</div>

<script>
// 로그인 폼 유효성 검사
document.getElementById('loginForm').addEventListener('submit', function(e) {
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value.trim();
    
    if (!username || !password) {
        e.preventDefault();
        alert('아이디와 비밀번호를 모두 입력해주세요.');
        return false;
    }
});

// 입력 필드 애니메이션
document.querySelectorAll('.form-control').forEach(function(input) {
    input.addEventListener('focus', function() {
        this.parentElement.classList.add('focused');
    });
    
    input.addEventListener('blur', function() {
        if (!this.value) {
            this.parentElement.classList.remove('focused');
        }
    });
});
</script>
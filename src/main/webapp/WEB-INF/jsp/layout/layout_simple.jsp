<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CHECK IN SEOUL - 관리자</title>
    
    <!-- CSS Files -->
    <%@ include file="/WEB-INF/jsp/layout/includeCssFiles.jsp" %>
    
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .login-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 100%;
            max-width: 400px;
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .login-header .logo {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }
        
        .login-header .subtitle {
            color: #666;
            font-size: 14px;
        }
        
        .form-floating {
            margin-bottom: 20px;
        }
        
        .form-control {
            border-radius: 10px;
            border: 1px solid #ddd;
            padding: 15px;
        }
        
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        
        .btn-login {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 10px;
            padding: 15px;
            font-weight: 600;
            width: 100%;
            margin-top: 10px;
        }
        
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
        }
        
        .remember-me {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin: 20px 0;
        }
        
        .error-message {
            background: #fee;
            border: 1px solid #fcc;
            color: #c33;
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
        }
        
        .footer-info {
            text-align: center;
            margin-top: 30px;
            font-size: 12px;
            color: #999;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <!-- 로그인 헤더 -->
        <div class="login-header">
            <div class="logo">
                <i class="fas fa-map-marker-alt me-2"></i>
                CHECK IN SEOUL
            </div>
            <div class="subtitle">관리자 시스템</div>
        </div>
        
        <!-- 실제 페이지 내용 (login.jsp가 여기에 들어감) -->
        <jsp:include page="${viewPage}" />
        
        <!-- 푸터 정보 -->
        <div class="footer-info">
            <div>© 2025 CHECK IN SEOUL. All rights reserved.</div>
            <div>관리자 전용 시스템</div>
        </div>
    </div>
    
    <!-- JS Files -->
    <%@ include file="/WEB-INF/jsp/layout/includeJsFiles.jsp" %>
    
    <script>
        // 로그인 페이지 전용 스크립트
        document.addEventListener('DOMContentLoaded', function() {
            // 로그인 폼에 포커스
            const firstInput = document.querySelector('input[type="text"], input[type="email"]');
            if (firstInput) {
                firstInput.focus();
            }
            
            // 엔터키로 로그인
            document.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    const loginForm = document.querySelector('form');
                    if (loginForm) {
                        loginForm.submit();
                    }
                }
            });
        });
    </script>
</body>
</html>
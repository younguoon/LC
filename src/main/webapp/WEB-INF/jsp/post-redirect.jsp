<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 중...</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .loading-container {
            text-align: center;
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
        }
        
        .spinner {
            border: 4px solid #f3f3f3;
            border-top: 4px solid #667eea;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
            margin: 0 auto 20px;
        }
        
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        .loading-text {
            color: #333;
            font-size: 18px;
            font-weight: 500;
            margin-bottom: 10px;
        }
        
        .loading-subtext {
            color: #666;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="loading-container">
        <div class="spinner"></div>
        <div class="loading-text">관리자 시스템 접속 중...</div>
        <div class="loading-subtext">잠시만 기다려주세요.</div>
    </div>

    <!-- POST 폼 자동 제출 -->
    <form id="dashboardForm" method="POST" action="/admin/dashboard" style="display: none;">
        <!-- CSRF 토큰이 있다면 여기에 추가 -->
    </form>

    <script>
        // 페이지 로드 후 1초 뒤 자동으로 POST 제출
        window.onload = function() {
            setTimeout(function() {
                document.getElementById('dashboardForm').submit();
            }, 1000);
        };
    </script>
</body>
</html>
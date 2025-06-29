<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 간단한 대시보드 테스트 페이지 -->
<div class="container-fluid px-4">
    <div class="row">
        <div class="col-12">
            <h1 class="mt-4">대시보드</h1>
            <div class="alert alert-success" role="alert">
                <h4 class="alert-heading">환영합니다!</h4>
                <p>CHECK IN SEOUL 관리자 시스템에 성공적으로 로그인하였습니다.</p>
                <hr>
                <p class="mb-0">현재 로그인 사용자: <strong>${loginUser}</strong></p>
            </div>
            
            <!-- 간단한 통계 카드 -->
            <div class="row">
                <div class="col-md-3 mb-4">
                    <div class="card bg-primary text-white">
                        <div class="card-body">
                            <h5 class="card-title">총 회원수</h5>
                            <h2>1,234</h2>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 mb-4">
                    <div class="card bg-success text-white">
                        <div class="card-body">
                            <h5 class="card-title">금일 가입</h5>
                            <h2>56</h2>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 mb-4">
                    <div class="card bg-warning text-white">
                        <div class="card-body">
                            <h5 class="card-title">체크인</h5>
                            <h2>789</h2>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 mb-4">
                    <div class="card bg-info text-white">
                        <div class="card-body">
                            <h5 class="card-title">신고</h5>
                            <h2>12</h2>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- 테스트 정보 -->
            <div class="card mt-4">
                <div class="card-header">
                    <h5 class="mb-0">시스템 정보</h5>
                </div>
                <div class="card-body">
                    <p><strong>현재 시간:</strong> <span id="currentTime"></span></p>
                    <p><strong>로그인 사용자:</strong> ${loginUser}</p>
                    <p><strong>페이지:</strong> dashboard.jsp</p>
                    <p><strong>ViewPage:</strong> ${viewPage}</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
// 현재 시간 표시
function updateTime() {
    const now = new Date();
    document.getElementById('currentTime').textContent = now.toLocaleString('ko-KR');
}

// 페이지 로드 시 시간 업데이트
updateTime();
setInterval(updateTime, 1000);

console.log('Dashboard loaded successfully!');
</script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- JavaScript Files -->
<!-- jQuery 라이브러리 -->
<script src="/js/jquery/jquery-3.7.1.min.js"></script>
<script src="/js/jquery/jquery-ui.min.js"></script>
<script src="/js/jquery/jquery.validate.min.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- CoreUI JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@5.0.0/dist/js/coreui.bundle.min.js" crossorigin="anonymous"></script>

<!-- 최소한의 커스텀 JavaScript만 -->
<script>
// CoreUI 자동 초기화
document.addEventListener('DOMContentLoaded', function () {
  console.log('CoreUI initialized');
});

/**
 * POST 방식으로 페이지 이동 (전역 함수)
 */
function submitPostForm(url) {
    const existingForm = document.getElementById('dynamicPostForm');
    if (existingForm) {
        existingForm.remove();
    }
    
    const form = document.createElement('form');
    form.id = 'dynamicPostForm';
    form.method = 'POST';
    form.action = url;
    
    document.body.appendChild(form);
    form.submit();
}

/**
 * 로그아웃 처리
 */
function logout() {
    if (confirm('로그아웃 하시겠습니까?')) {
        const form = document.getElementById('logoutForm');
        if (form) {
            form.submit();
        }
    }
}
</script>

<!-- 선택: 사용자 정의 JS -->
<script src="/js/common/common.js"></script>

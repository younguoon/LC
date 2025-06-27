<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<body class="c-app">
  <div class="c-wrapper d-flex flex-column">

    <!-- 콘텐츠 -->
    <div class="c-body">
      <main class="c-main p-4">
        <div class="container-fluid">

          <!-- 상단 제목 + 버튼 -->
          <div class="d-flex justify-content-between align-items-center mb-3">
            <h4 class="mb-0">권한 그룹 관리</h4>
            <button class="btn btn-primary">추가</button>
          </div>

          <!-- 테이블 -->
          <div class="card">
            <div class="card-body p-0">
              <table class="table table-striped table-hover mb-0">
                <thead class="table-light">
                  <tr>
                    <th scope="col" style="width: 80px;">번호</th>
                    <th scope="col">권한 그룹명</th>
                    <th scope="col">그룹 인원</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>관리자</td>
                    <td>5명</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>운영팀</td>
                    <td>12명</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td>마케팅팀</td>
                    <td>7명</td>
                  </tr>
                  <!-- 필요 시 더 추가 -->
                </tbody>
              </table>
            </div>
          </div>

        </div>
      </main>
    </div>

  </div>
</body>
</html>

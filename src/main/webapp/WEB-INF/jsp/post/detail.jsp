<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 작성</title>
    <style>
        body { font-family: Arial; margin: 30px; }
        label { display: inline-block; width: 100px; }
        input[type=text], textarea { width: 400px; padding: 5px; }
        .form-row { margin-bottom: 15px; }
        .tag-row { margin-left: 20px; margin-bottom: 10px; }
        .buttons { margin-top: 20px; }
    </style>
</head>
<body>

    <h2>게시글 작성</h2>

    <form id="postForm">
        <div class="form-row">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" value="샘플 공지사항 제목" />
        </div>

        <div class="form-row">
            <label for="author">작성자</label>
            <input type="text" id="author" name="author" value="관리자" />
        </div>

        <div class="form-row">
            <label for="content">내용</label><br/>
            <textarea id="content" name="content" rows="5">이 게시글은 샘플 데이터를 포함하고 있습니다.</textarea>
        </div>

        <hr/>
        <h3>태그 목록</h3>
        <div id="tagList">
            <div class="tag-row">
                <label>이름:</label>
                <input type="text" name="tagName" value="중요" />
                <label>색상:</label>
                <input type="text" name="tagColor" value="red" />
                <label>표시:</label>
                <input type="checkbox" name="tagVisible" checked />
                <button type="button" onclick="removeTag(this)">삭제</button>
            </div>
            <div class="tag-row">
                <label>이름:</label>
                <input type="text" name="tagName" value="공지" />
                <label>색상:</label>
                <input type="text" name="tagColor" value="blue" />
                <label>표시:</label>
                <input type="checkbox" name="tagVisible" />
                <button type="button" onclick="removeTag(this)">삭제</button>
            </div>
        </div>
        <button type="button" onclick="addTag()">+ 태그 추가</button>

        <div class="buttons">
            <button type="submit">저장</button>
        </div>
    </form>

    <script>
        function addTag() {
            const tagHtml = `
                <div class="tag-row">
                    <label>이름:</label>
                    <input type="text" name="tagName" />
                    <label>색상:</label>
                    <input type="text" name="tagColor" />
                    <label>표시:</label>
                    <input type="checkbox" name="tagVisible" />
                    <button type="button" onclick="removeTag(this)">삭제</button>
                </div>
            `;
            $('#tagList').append(tagHtml);
        }

        function removeTag(button) {
            $(button).closest('.tag-row').remove();
        }

        $('#postForm').on('submit', function (e) {
            e.preventDefault();

            const tags = [];
            $('#tagList .tag-row').each(function () {
                tags.push({
                    name: $(this).find('input[name="tagName"]').val(),
                    color: $(this).find('input[name="tagColor"]').val(),
                    visible: $(this).find('input[name="tagVisible"]').is(':checked')
                });
            });

            const data = {
                title: $('#title').val(),
                author: $('#author').val(),
                content: $('#content').val(),
                tags: tags
            };

            fetch('/api/post/save', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data)
            })
            .then(res => res.text())
            .then(msg => alert("서버 응답: " + msg))
            .catch(err => alert("오류 발생: " + err));
        });
    </script>

</body>
</html>

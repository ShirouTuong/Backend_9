<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Từ điển Anh - Việt</title>
    <style>
        :root {
            color-scheme: light;
            --ink: #172a3a;
            --muted: #586b78;
            --paper: #fffefa;
            --line: #d9e3df;
            --green: #176b55;
            --green-dark: #105340;
            --coral: #c4513b;
            --wash: #edf4ee;
        }
        * { box-sizing: border-box; }
        body {
            min-height: 100vh;
            margin: 0;
            display: grid;
            place-items: center;
            padding: 32px 18px;
            color: var(--ink);
            background-color: #e6eee8;
            background-image: radial-gradient(#b9cec1 0.8px, transparent 0.8px);
            background-size: 17px 17px;
            font-family: Georgia, "Times New Roman", serif;
        }
        main {
            width: min(100%, 560px);
            padding: clamp(26px, 6vw, 48px);
            background: var(--paper);
            border: 1px solid var(--line);
            border-top: 5px solid var(--coral);
            box-shadow: 10px 12px 0 #c8d8cd;
            animation: arrive 420ms ease-out both;
        }
        .eyebrow {
            margin: 0 0 12px;
            color: var(--green);
            font: 700 12px/1.4 Arial, sans-serif;
            letter-spacing: 1.4px;
            text-transform: uppercase;
        }
        h1 { margin: 0; font-size: clamp(30px, 7vw, 42px); line-height: 1.08; }
        .intro { margin: 14px 0 30px; color: var(--muted); font: 16px/1.6 Arial, sans-serif; }
        form { display: grid; gap: 10px; }
        label { font: 700 14px/1.4 Arial, sans-serif; }
        .search-row { display: flex; gap: 10px; }
        input {
            min-width: 0;
            flex: 1;
            padding: 13px 14px;
            border: 1px solid #a8bbb0;
            border-radius: 3px;
            color: var(--ink);
            background: #fff;
            font: 16px Arial, sans-serif;
        }
        input:focus { outline: 3px solid #b8d8c8; border-color: var(--green); }
        button {
            padding: 0 20px;
            border: 0;
            border-radius: 3px;
            color: white;
            background: var(--green);
            cursor: pointer;
            font: 700 15px Arial, sans-serif;
        }
        button:hover { background: var(--green-dark); }
        .result { margin-top: 26px; padding: 18px; border-left: 4px solid var(--green); background: var(--wash); }
        .result.not-found, .result.warning { border-left-color: var(--coral); background: #fbefeb; }
        .result-label { margin: 0 0 7px; color: var(--muted); font: 700 12px Arial, sans-serif; text-transform: uppercase; }
        .result p:last-child { margin: 0; font-size: 21px; line-height: 1.4; overflow-wrap: anywhere; }
        .words { margin: 28px 0 0; padding-top: 17px; border-top: 1px solid var(--line); color: var(--muted); font: 13px/1.8 Arial, sans-serif; }
        .words strong { color: var(--ink); }
        @keyframes arrive { from { opacity: 0; transform: translateY(8px); } to { opacity: 1; transform: translateY(0); } }
        @media (max-width: 420px) {
            .search-row { flex-direction: column; }
            button { min-height: 46px; }
        }
        @media (prefers-reduced-motion: reduce) { *, *::before, *::after { animation-duration: 0.01ms !important; } }
    </style>
</head>
<body>
<main>
    <p class="eyebrow">English / Tiếng Việt</p>
    <h1>Từ điển Anh - Việt</h1>
    <p class="intro">Tra nhanh nghĩa tiếng Việt của một từ tiếng Anh.</p>

    <form action="${pageContext.request.contextPath}/translate" method="post">
        <label for="word">Từ cần tra</label>
        <div class="search-row">
            <input id="word" name="word" type="text" placeholder="Ví dụ: hello" autocomplete="off" required>
            <button type="submit">Tìm kiếm</button>
        </div>
    </form>

    <c:if test="${not empty messageType}">
        <section class="result ${messageType}" aria-live="polite">
            <c:choose>
                <c:when test="${messageType eq 'success'}">
                    <p class="result-label">Kết quả tra cứu</p>
                    <p><strong><c:out value="${searchedWord}" /></strong> <span aria-hidden="true">→</span> <c:out value="${translation}" /></p>
                </c:when>
                <c:when test="${messageType eq 'not-found'}">
                    <p class="result-label">Không tìm thấy</p>
                    <p>Chưa có từ “<c:out value="${searchedWord}" />” trong từ điển.</p>
                </c:when>
                <c:otherwise>
                    <p><c:out value="${message}" /></p>
                </c:otherwise>
            </c:choose>
        </section>
    </c:if>

    <p class="words"><strong>Từ có sẵn:</strong> hello, how, book, computer, student</p>
</main>
</body>
</html>
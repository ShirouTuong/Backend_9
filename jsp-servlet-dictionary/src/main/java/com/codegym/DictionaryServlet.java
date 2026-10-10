package com.codegym;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Locale;
import java.util.Map;

public class DictionaryServlet extends HttpServlet {
    private static final Map<String, String> DICTIONARY = Map.of(
            "hello", "Xin chào",
            "how", "Thế nào",
            "book", "Quyển sách",
            "computer", "Máy tính",
            "student", "Sinh viên"
    );

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String word = request.getParameter("word");
        String normalizedWord = word == null ? "" : word.trim();

        if (normalizedWord.isEmpty()) {
            request.setAttribute("message", "Vui lòng nhập từ cần tra.");
            request.setAttribute("messageType", "warning");
        } else {
            String translation = DICTIONARY.get(normalizedWord.toLowerCase(Locale.ROOT));
            request.setAttribute("searchedWord", normalizedWord);
            request.setAttribute("translation", translation);
            request.setAttribute("messageType", translation == null ? "not-found" : "success");
        }

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
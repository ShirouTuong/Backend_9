package com.codegym;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ConverterServlet", urlPatterns = {"/convert"})
public class ConverterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Cấu hình mã hóa hiển thị tiếng Việt
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            try {
                // Nhận tham số từ form và chuyển sang số thực
                float rate = Float.parseFloat(request.getParameter("rate"));
                float usd = Float.parseFloat(request.getParameter("usd"));

                // Tính toán
                float vnd = rate * usd;

                // Hiển thị kết quả ra màn hình trình duyệt
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head><title>KẾT QUẢ CHUYỂN ĐỔI</title></head>");
                out.println("<body style='font-family: Arial, sans-serif; text-align: center; margin-top: 50px;'>");
                out.println("<h2 style='color: #1b2a7a;'>KẾT QUẢ CHUYỂN ĐỔI</h2>");
                out.println("<p style='font-size: 18px;'><b>Tỉ giá:</b> " + rate + " VND/USD</p>");
                out.println("<p style='font-size: 18px;'><b>Số tiền USD:</b> $" + usd + "</p>");
                out.println("<h3 style='color: #27ae60; font-size: 24px;'>Thành tiền: " + vnd + " VNĐ</h3>");
                out.println("<br><a href='index.jsp' style='text-decoration: none; color: #1b2a7a;'>← Quay lại</a>");
                out.println("</body>");
                out.println("</html>");

            } catch (NumberFormatException e) {
                out.println("<!DOCTYPE html>");
                out.println("<html><body>");
                out.println("<h2 style='color: red; text-align: center;'>Vui lòng nhập dữ liệu số hợp lệ!</h2>");
                out.println("<div style='text-align: center;'><a href='index.jsp'>Quay lại</a></div>");
                out.println("</body></html>");
            }
        }
    }
}
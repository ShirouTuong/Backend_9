# Từ điển Anh - Việt

Ứng dụng Java Servlet/JSP tra cứu từ tiếng Anh, đóng gói dạng WAR và tương thích Apache Tomcat 10.1 (Jakarta Servlet 6.0).

## Yêu cầu

- JDK 17 trở lên
- Apache Maven 3.8 trở lên
- Apache Tomcat 10.1

## Cấu trúc

```text
jsp-servlet-dictionary/
├── pom.xml
└── src/main/
    ├── java/com/codegym/DictionaryServlet.java
    └── webapp/
        ├── index.jsp
        └── WEB-INF/web.xml
```

## Biên dịch

Mở terminal tại thư mục chứa `pom.xml`, chạy:

```bash
mvn clean package
```

Khi Maven báo `BUILD SUCCESS`, file triển khai được tạo tại `target/jsp-servlet-dictionary.war`.

## Chạy trên Tomcat

1. Chép `target/jsp-servlet-dictionary.war` vào thư mục `webapps` của Tomcat 10.1.
2. Khởi động Tomcat bằng `bin\startup.bat` trên Windows hoặc `bin/startup.sh` trên macOS/Linux.
3. Mở `http://localhost:8080/jsp-servlet-dictionary/`.

Có thể dừng Tomcat bằng `bin\shutdown.bat` trên Windows hoặc `bin/shutdown.sh` trên macOS/Linux. Đảm bảo Tomcat dùng JDK 17 trở lên.

## Đẩy dự án lên GitHub

Tạo một repository trống trên GitHub, sau đó chạy tại thư mục dự án (thay URL bằng URL repository của bạn):

```bash
git add .
git commit -m "Initial dictionary app"
git remote add origin https://github.com/USERNAME/REPOSITORY.git
git push -u origin main
```

## Từ được hỗ trợ

| English | Tiếng Việt |
| --- | --- |
| hello | Xin chào |
| how | Thế nào |
| book | Quyển sách |
| computer | Máy tính |
| student | Sinh viên |

Tra cứu không phân biệt chữ hoa/chữ thường. Từ không có trong danh sách sẽ hiển thị thông báo phù hợp.
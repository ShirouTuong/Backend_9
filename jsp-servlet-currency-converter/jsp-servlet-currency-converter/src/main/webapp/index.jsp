<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Currency Converter</title>
    <style>
        body { font-family: 'Arial', sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; background-color: #f4f4f9; }
        .converter-container { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); width: 350px; text-align: center; }
        input { padding: 10px; margin: 10px 0; width: 90%; border: 1px solid #ccc; border-radius: 4px; }
        button { background-color: #1b2a7a; color: white; padding: 12px; border: none; border-radius: 4px; width: 95%; cursor: pointer; font-size: 16px; }
        button:hover { background-color: #121c54; }
    </style>
</head>
<body>
    <div class="converter-container">
        <h2 style="color: #1b2a7a;">Chuyển đổi USD sang VNĐ</h2>
        <!-- Form gửi dữ liệu bằng phương thức POST tới endpoint /convert -->
        <form action="convert" method="POST">
            <div style="text-align: left; margin-left: 5%;">
                <label style="font-weight: bold; color: #333;">Tỉ giá (VND/USD):</label>
            </div>
            <input type="number" step="any" name="rate" placeholder="Ví dụ: 25000" required>

            <div style="text-align: left; margin-left: 5%; margin-top: 10px;">
                <label style="font-weight: bold; color: #333;">Lượng USD:</label>
            </div>
            <input type="number" step="any" name="usd" placeholder="Nhập số USD" required>

            <button type="submit">Chuyển đổi</button>
        </form>
    </div>
</body>
</html>
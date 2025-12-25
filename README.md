# iStore – Ứng dụng mua sắm thiết bị Apple trên iOS

**iStore** là ứng dụng e-commerce native iOS chuyên bán các sản phẩm Apple chính hãng (iPhone, iPad, MacBook, Apple Watch, AirPods). Dự án được phát triển trong kỳ thực tập tốt nghiệp tại **Công ty Cổ phần Ecomobi Media** (khối Tech & Product) năm 2025.

Ứng dụng tích hợp mô hình affiliate tracking để hỗ trợ tính commission cho KOLs dựa trên lượt xem sản phẩm.

## Công nghệ sử dụng
- **Frontend**: SwiftUI + MVVM + SwiftData (iOS 18)
- **Backend**: Node.js + Express + MongoDB + Mongoose
- **Authentication**: JWT + bcrypt + nodemailer (email verification)
- **Payment**: Stripe (sandbox mode)
- **Image storage**: AppWrite
- **Affiliate tracking**: Increment views để tính commission

## Tính năng chính
- Đăng ký / Đăng nhập / Quên mật khẩu (gửi OTP qua email)
- Danh mục sản phẩm với pagination & trending (sắp xếp theo lượt xem)
- Chi tiết sản phẩm với zoom animation iOS 18
- Tìm kiếm & lọc nâng cao (tên, giá, danh mục)
- Giỏ hàng offline (SwiftData persistence)
- Thanh toán an toàn qua Stripe
- Admin panel: CRUD sản phẩm + upload ảnh
- Reviews & Ratings (hệ thống sao + tính điểm trung bình)
- Bảo mật: Keychain, HTTP-only cookie, role-based access

## Cấu trúc thư mục
iStore/
├── iStoreApp/                  # Frontend SwiftUI
│   ├── Views/                  # Các màn hình UI
│   ├── ViewModels/             # Logic MVVM
│   ├── Models/                 # SwiftData models
│   ├── Services/               # API calls, Keychain
│   └── Assets/                 # Hình ảnh, icon
│
├── backend/                    # Backend Node.js
│   ├── routes/                 # API endpoints
│   ├── controllers/            # Logic xử lý
│   ├── models/                 # MongoDB schemas (Mongoose)
│   ├── middleware/             # Auth middleware
│   └── config/                 # Env, database connection
│
└── README.md
text## Hướng dẫn cài đặt và chạy dự án

### Yêu cầu hệ thống
- macOS Ventura trở lên
- Xcode 16+ (iOS 18 SDK)
- Node.js v18+
- MongoDB (local hoặc MongoDB Atlas)
- Tài khoản Stripe sandbox (test card: `4242 4242 4242 4242`)
- Tài khoản AppWrite (cho upload ảnh)

### 1. Clone repository
```bash
git clone https://github.com/[username-của-bạn]/iStore-ios-app.git
cd iStore-ios-app
2. Chạy Backend
Bashcd backend
npm install
cp .env.example .env
# Chỉnh sửa .env với MONGO_URI, JWT_SECRET, GMAIL_APP_PASSWORD, STRIPE_SECRET_KEY
npm run dev
→ Backend chạy tại: http://localhost:5000
3. Chạy Frontend (iOS App)

Mở file iStoreApp.xcodeproj bằng Xcode
Chọn simulator (khuyến nghị iPhone 15/16)
Chỉnh API base URL trong Services/APIService.swift thành http://localhost:5000 (hoặc IP máy nếu chạy trên thiết bị thật)
Build & Run (Cmd + R)

4. Seed dữ liệu mẫu (tùy chọn)
Bashcd backend
node seed/products.js   # Seed 50 sản phẩm Apple
node seed/users.js      # Seed admin user
Tài khoản test

User thường: Đăng ký mới trong app
Admin:
Email: admin@istore.com
Password: 123456
→ Truy cập tab Admin để quản lý sản phẩm

Screenshots
Login Screen
Home Screen
Product Detail
Cart Screen
Admin Panel
Search & Filter
(Thêm các ảnh khác tương tự – bạn có thể chèn hết 20+ ảnh bạn gửi để README đầy đủ hơn)
Commit history
Dự án được phát triển theo mô hình Agile (sprint 2 tuần), commit theo chuẩn conventional commits.
Liên hệ
Nguyễn Phúc Toàn
Email: nguyenphuctoan25102004@gmail.com
Thực tập tại: Ecomobi Media – Khối Tech & Product (2025)

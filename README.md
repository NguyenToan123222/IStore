# IStore
App Ecommerce
iStore – Ứng dụng mua sắm thiết bị Apple trên iOS
iStore là ứng dụng e-commerce native iOS chuyên bán các sản phẩm Apple chính hãng (iPhone, iPad, MacBook, Apple Watch, AirPods). Dự án được phát triển trong kỳ thực tập tốt nghiệp tại Công ty Cổ phần Ecomobi Media (khối Tech & Product) năm 2025.
Ứng dụng sử dụng công nghệ hiện đại:

Frontend: SwiftUI + MVVM + SwiftData (iOS 18)
Backend: Node.js + Express + MongoDB + Mongoose
Authentication: JWT + bcrypt + nodemailer (email verification)
Payment: Stripe (sandbox mode)
Image storage: AppWrite
Affiliate tracking: Increment views để hỗ trợ tính commission cho KOLs

Tính năng chính

Đăng ký / Đăng nhập / Quên mật khẩu (OTP email)
Danh mục sản phẩm với pagination & trending (sắp xếp theo lượt xem)
Chi tiết sản phẩm với zoom animation iOS 18
Tìm kiếm & lọc nâng cao (tên, giá, danh mục)
Giỏ hàng offline (SwiftData persistence)
Thanh toán an toàn qua Stripe
Admin panel: CRUD sản phẩm, upload ảnh
Reviews & Ratings (hệ thống sao, tính trung bình)
Bảo mật: Keychain, HTTP-only cookie, role-based access

Cấu trúc thư mục
textiStore/
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
Hướng dẫn cài đặt và chạy dự án
Yêu cầu hệ thống

macOS Ventura trở lên
Xcode 16+ (iOS 18 SDK)
Node.js v18+
MongoDB (local hoặc MongoDB Atlas)
Tài khoản Stripe sandbox (test card: 4242 4242 4242 4242)
Tài khoản AppWrite (cho upload ảnh)

1. Clone repository
Bashgit clone https://github.com/[username-của-bạn]/iStore-ios-app.git
cd iStore-ios-app
2. Chạy Backend
Bashcd backend
npm install
cp .env.example .env
# Chỉnh sửa .env: MONGO_URI, JWT_SECRET, GMAIL_APP_PASSWORD, STRIPE_SECRET_KEY
npm run dev
Backend chạy tại: http://localhost:5000
3. Chạy Frontend (iOS App)

Mở file iStoreApp.xcodeproj bằng Xcode
Chọn simulator (iPhone 15/16 khuyến nghị)
Chỉnh API base URL trong Services/APIService.swift thành http://localhost:5000 (hoặc IP máy nếu chạy trên thiết bị thật)
Build & Run (Cmd + R)

4. Seed dữ liệu mẫu (tùy chọn)
Bashcd backend
node seed/products.js   # Seed 50 sản phẩm Apple
node seed/users.js      # Seed admin user (email: admin@istore.com, pass: 123456)
Tài khoản test

User thường: Đăng ký mới trong app
Admin:
Email: admin@istore.com
Password: 123456
→ Truy cập tab Admin để quản lý sản phẩm

Screenshots
(Bạn chèn ảnh thật từ video YouTube hoặc simulator ở đây – khuyến khích 4-6 ảnh: Login, Home, Product Detail, Cart, Admin Panel)
Commit history
Dự án được phát triển theo Agile (sprint 2 tuần), commit theo conventional commits.
Liên hệ
Nguyễn Phúc Toàn
Email: nguyenphuctoan25102004@gmail.com
Thực tập tại: Ecomobi Media – Khối Tech & Product (2025)
<img width="357" height="731" alt="Screenshot 2025-12-21 at 00 26 09" src="https://github.com/user-attachments/assets/6b06f236-c9cc-40b7-9e2a-8dba329939c4" />
<img width="376" height="746" alt="Screenshot 2025-12-21 at 00 36 04" src="https://github.com/user-attachments/assets/33d5c730-d178-4e9a-9df6-8e59431b2b91" />
<img width="375" height="742" alt="Screenshot 2025-12-21 at 00 30 13" src="https://github.com/user-attachments/assets/981ee410-0db1-4eda-bf92-fb32843ed89c" />
<img width="371" height="746" alt="Screenshot 2025-12-21 at 00 35 16" src="https://github.com/user-attachments/assets/562535e9-1711-422c-8f76-5a7edd4bee0e" />
<img width="387" height="727" alt="Screenshot 2025-12-21 at 00 26 22" src="https://github.com/user-attachments/assets/1b94715b-e188-4da6-b35e-4437d204e2f4" />
<img width="363" height="730" alt="Screenshot 2025-12-21 at 00 25 53" src="https://github.com/user-attachments/assets/779231fe-2f3b-4fea-97e0-ccb1b407259b" />
<img width="365" height="729" alt="Screenshot 2025-12-21 at 00 25 41" src="https://github.com/user-attachments/assets/a02c9452-1868-4385-bfa8-a9fa2095a6fe" />
<img width="378" height="743" alt="Screenshot 2025-12-21 at 00 34 50" src="https://github.com/user-attachments/assets/d32933e7-b8eb-41c2-9781-a571736eee64" />
<img width="367" height="732" alt="Screenshot 2025-12-21 at 00 24 09" src="https://github.com/user-attachments/assets/c539acd6-953d-4eaa-8986-f5d5080485e0" />
<img width="365" height="738" alt="Screenshot 2025-12-21 at 00 25 20" src="https://github.com/user-attachments/assets/d1048af3-1987-4b1c-8f08-97533f10d015" />
<img width="1396" height="905" alt="Screenshot 2025-12-21 at 00 40 50" src="https://github.com/user-attachments/assets/f64ffbbf-6e0c-4ce3-9f2f-72b86afd0b8b" />
<img width="355" height="741" alt="Screenshot 2025-12-21 at 00 34 26" src="https://github.com/user-attachments/assets/37a4078e-8eca-46ec-84f7-02a7a41cc83b" />
<img width="366" height="736" alt="Screenshot 2025-12-21 at 00 27 55" src="https://github.com/user-attachments/assets/602a9790-0e1b-48fb-80dc-367fc536aa18" />
<img width="365" height="750" alt="Screenshot 2025-12-21 at 00 27 48" src="https://github.com/user-attachments/assets/d2e44fe7-d9f2-4083-ba50-af4886248428" />
<img width="363" height="734" alt="Screenshot 2025-12-21 at 00 24 51" src="https://github.com/user-attachments/assets/3ec5a332-9657-466f-b81c-361dc8e9e02a" />
<img width="1386" height="910" alt="Screenshot 2025-12-21 at 00 40 28" src="https://github.com/user-attachments/assets/747bb280-03b8-4b03-a52b-8179a08877a3" />
<img width="375" height="741" alt="Screenshot 2025-12-21 at 00 34 19" src="https://github.com/user-attachments/assets/cec60e8f-b280-4ed7-9b61-a36ca4a6292b" />
<img width="373" height="741" alt="Screenshot 2025-12-21 at 00 29 47" src="https://github.com/user-attachments/assets/0f3c7bf1-c7cd-4470-9b32-a65bd6c3300a" />
<img width="1389" height="905" alt="Screenshot 2025-12-21 at 00 40 11" src="https://github.com/user-attachments/assets/39a214cc-c7e7-45c7-b1b6-02c161bcb73d" />
<img width="364" height="749" alt="Screenshot 2025-12-21 at 00 29 14" src="https://github.com/user-attachments/assets/ccb60ab3-33fd-4585-93d4-4c5ad3e15a77" />
<img width="388" height="734" alt="Screenshot 2025-12-21 at 00 33 54" src="https://github.com/user-attachments/assets/2f2eede1-d22f-40c5-be7a-100296eea07e" />
<img width="359" height="745" alt="Screenshot 2025-12-21 at 00 28 55" src="https://github.com/user-attachments/assets/3346b8da-caec-46db-bef9-60683cd37c4c" />
<img width="356" height="747" alt="Screenshot 2025-12-21 at 00 28 37" src="https://github.com/user-attachments/assets/755465bd-456a-420c-bff2-2a15f5729664" />
<img width="372" height="739" alt="Screenshot 2025-12-21 at 00 28 25" src="https://github.com/user-attachments/assets/8dee1069-4be5-4b4a-b0ab-efb6c839b52d" />
<img width="356" height="733" alt="Screenshot 2025-12-21 at 00 33 36" src="https://github.com/user-attachments/assets/28024bf3-6bd5-4043-9f0b-cb6d98a0079c" />
<img width="383" height="743" alt="Screenshot 2025-12-21 at 00 32 25" src="https://github.com/user-attachments/assets/1c076139-b3d8-40f8-9093-59d83ef0250e" />
<img width="363" height="741" alt="Screenshot 2025-12-21 at 00 30 23" src="https://github.com/user-attachments/assets/e6da3884-ed06-4cda-8b5f-7e1fa1f2c538" />
<img width="367" height="739" alt="Screenshot 2025-12-21 at 00 37 08" src="https://github.com/user-attachments/assets/704b3fad-d00d-419f-a6a5-e0892d1ca937" />
<img width="364" height="747" alt="Screenshot 2025-12-21 at 00 36 48" src="https://github.com/user-attachments/assets/407f7ff9-5972-4fc6-a6ff-97fa5b599609" />

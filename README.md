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
<img width="365" height="738" alt="pro" src="https://github.com/user-attachments/assets/fa1890a1-ca68-4e7e-8e8c-b7ab716009de" />
<img width="364" height="747" alt="addres" src="https://github.com/user-attachments/assets/66976cd3-6e4e-484a-948f-db18ccd88c89" />
<img width="363" height="741" alt="Screenshot 2025-12-21 at 00 30 23" src="https://github.com/user-attachments/assets/42760412-399c-4c0a-9fac-4d1d87bd0eb0" />
<img width="372" height="739" alt="Screenshot 2025-12-21 at 00 28 25" src="https://github.com/user-attachments/assets/5ca66734-4f48-4970-ace5-84cebe3b2551" />
<img width="356" height="747" alt="Screenshot 2025-12-21 at 00 28 37" src="https://github.com/user-attachments/assets/f1055f01-2424-4c4f-8526-89c0f930470b" />
<img width="365" height="729" alt="prod" src="https://github.com/user-attachments/assets/343f5b16-0c3d-4583-ba06-84dc5c5a62a9" />
<img width="367" height="739" alt="check out" src="https://github.com/user-attachments/assets/560abb40-7df2-41bc-a9b8-b12b08afaf6c" />
<img width="383" height="743" alt="acc" src="https://github.com/user-attachments/assets/eb67301e-c0a1-4a4d-8803-041bf4cd9793" />
<img width="1789" height="987" alt="postman" src="https://github.com/user-attachments/assets/5660ff90-b9ca-4e7a-9484-1fb95a1319db" />
<img width="359" height="745" alt="fav" src="https://github.com/user-attachments/assets/f51c6829-a5d9-4cdc-b700-1624bedc4291" />
<img width="356" height="733" alt="add pro" src="https://github.com/user-attachments/assets/c783122a-c2cf-4147-86dc-b952b3e275c5" />
<img width="1389" height="905" alt="Screenshot 2025-12-21 at 00 40 11" src="https://github.com/user-attachments/assets/c1dbce99-b7de-4427-b922-a29c63caad10" />
<img width="366" height="736" alt="search1" src="https://github.com/user-attachments/assets/f0155a2a-5d82-459a-b3b4-60c2d8643c2e" />
<img width="365" height="750" alt="search" src="https://github.com/user-attachments/assets/1eb3f0e2-555a-4814-bc08-6cfd6f633b22" />
<img width="1085" height="935" alt="vscode" src="https://github.com/user-attachments/assets/3b8d5d77-e8f4-4ac9-9f57-f18ca83b1d71" />
<img width="1386" height="910" alt="Screenshot 2025-12-21 at 00 40 28" src="https://github.com/user-attachments/assets/7e4d9cd2-ff87-4dcf-b04b-f5b5303d4093" />
<img width="388" height="734" alt="Screenshot 2025-12-21 at 00 33 54" src="https://github.com/user-attachments/assets/a9b2e3a7-6937-40d6-ad60-0ff106d37de4" />
<img width="364" height="749" alt="del fav" src="https://github.com/user-attachments/assets/e0ccdbfd-4174-4ba9-8df1-ff73e5e1a842" />
<img width="355" height="741" alt="Screenshot 2025-12-21 at 00 34 26" src="https://github.com/user-attachments/assets/ee370dd2-d057-487c-bcd7-daf7e9ee2497" />
<img width="363" height="734" alt="Screenshot 2025-12-21 at 00 24 51" src="https://github.com/user-attachments/assets/289f9ef6-fa34-4452-8504-86a0c9117990" />
<img width="375" height="741" alt="Screenshot 2025-12-21 at 00 34 19" src="https://github.com/user-attachments/assets/8edaf00f-baff-4d75-85e9-344384998426" />
<img width="373" height="741" alt="rev" src="https://github.com/user-attachments/assets/f1c200dd-d000-437e-a6f0-566924e8a432" />
<img width="363" height="730" alt="pro3" src="https://github.com/user-attachments/assets/7ed26727-d50f-4e79-b4f0-4c7c7ed5ac4e" />
<img width="367" height="732" alt="fav heart" src="https://github.com/user-attachments/assets/c32fbc8d-3658-4cee-8127-720a6bdeaeec" />
<img width="378" height="743" alt="del pro" src="https://github.com/user-attachments/assets/c7df2dae-9538-419e-8c1a-b0193e2a74db" />
<img width="376" height="746" alt="Screenshot 2025-12-21 at 00 36 04" src="https://github.com/user-attachments/assets/ee55a925-8fd7-44af-86d6-3693135d19d2" />
<img width="371" height="746" alt="Screenshot 2025-12-21 at 00 35 16" src="https://github.com/user-attachments/assets/032c0eca-2895-488b-8722-acc08a5465f8" />
<img width="357" height="731" alt="pro4" src="https://github.com/user-attachments/assets/5dfe4238-2a46-4330-a77a-b3c2fb77b332" />
<img width="387" height="727" alt="Screenshot 2025-12-21 at 00 26 22" src="https://github.com/user-attachments/assets/691fa1aa-1bdc-4704-b49b-e6d24480d493" />
<img width="375" height="742" alt="pop rev" src="https://github.com/user-attachments/assets/6f60049d-356d-4317-90f0-062adf6fcf61" />
<img width="1396" height="905" alt="Screenshot 2025-12-21 at 00 40 50" src="https://github.com/user-attachments/assets/2fb464b4-989f-4c70-a053-9dd00ba5d243" />




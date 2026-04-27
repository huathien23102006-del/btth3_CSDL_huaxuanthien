CREATE DATABASE Book_WormDB;
USE Book_WormDB;

CREATE TABLE authors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    birth_year INT,
    nationality VARCHAR(100)
);

CREATE TABLE books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    book_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    author_id INT,
    price DECIMAL(10,2) NOT NULL DEFAULT 0,
    publish_year INT,
    
    CONSTRAINT fk_books_authors
    FOREIGN KEY (author_id) REFERENCES authors(id)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    
    CONSTRAINT chk_price
    CHECK (price >= 0)
);

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO authors (full_name, birth_year, nationality) VALUES
('Nguyễn Nhật Ánh', 1955, 'Việt Nam'),
('Agatha Christie', 1890, 'Anh'),
('Dale Carnegie', 1888, 'Mỹ');

INSERT INTO books (book_name, category, author_id, price, publish_year) VALUES
('Mắt Biếc', 'Văn học', 1, 85000, 1990),
('Tôi Thấy Hoa Vàng Trên Cỏ Xanh', 'Văn học', 1, 90000, 2010),
('Kính Vạn Hoa', 'Văn học', 1, 70000, 1995),

('Án Mạng Trên Chuyến Tàu Tốc Hành Phương Đông', 'Trinh thám', 2, 120000, 1934),
('Vụ Án Bí Ẩn Ở Styles', 'Trinh thám', 2, 95000, 1920),
('Cái Chết Trên Sông Nile', 'Trinh thám', 2, 110000, 1937),

('Đắc Nhân Tâm', 'Kỹ năng', 3, 150000, 1936),
('Quẳng Gánh Lo Đi Và Vui Sống', 'Kỹ năng', 3, 130000, 1948);

INSERT INTO customers (full_name, email, phone) VALUES
('Nguyễn Văn A', 'vana@gmail.com', '0900000001'),
('Trần Thị B', 'thib@gmail.com', '0900000002'),
('Lê Văn C', 'vanc@gmail.com', '0900000003'),
('Phạm Thị D', 'thid@gmail.com', '0900000004'),
('Hoàng Văn E', 'vane@gmail.com', '0900000005');

-- Thêm khách hàng trùng mail
-- INSERT INTO customers (full_name, email, phone)
-- VALUES ('Nguyễn Văn F', 'vana@gmail.com', '0900000006');

-- Lỗi xảy ra vì cột email trong bảng customers có ràng buộc UNIQUE
-- Nghĩa là mỗi email chỉ được phép xuất hiện 1 lần duy nhất

-- Khi insert 'vana@gmail.com' (đã tồn tại ở khách hàng Nguyễn Văn A),
-- hệ quản trị CSDL (MySQL) sẽ từ chối và báo lỗi:
-- Error Code: 1062. Duplicate entry 'vana@gmail.com' for key 'customers.email'

-- Điều này giúp đảm bảo dữ liệu không bị trùng lặp, đặc biệt với các thông tin quan trọng như email

SELECT *
FROM books
WHERE category = 'Trinh thám'
  AND price < 100000;
  
  SELECT *
FROM customers
WHERE email LIKE '%@gmail.com';

SELECT *
FROM books
ORDER BY price DESC
LIMIT 3;

UPDATE books
SET price = price * 0.9
WHERE publish_year < 2020;

SELECT * 
FROM books
WHERE publish_year < 2020;




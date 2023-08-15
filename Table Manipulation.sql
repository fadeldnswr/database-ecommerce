USE ecommerce;

-- 1. Mampilkan Max Price, Min Price, dan Avg Price dari tabel item
SELECT MAX(Price), MIN(Price), AVG(Price)
FROM item;

-- 2. Menampilkan rata-rata gaji berdasarkan gender
SELECT LEFT(StaffGender, 1), AVG(StaffSalary)
FROM staff
GROUP BY StaffGender;

-- Menampilkan rata-rata gaji berdasarkan posisi
SELECT StaffPosition, AVG(StaffSalary)
FROM staff
GROUP BY StaffPosition;

-- 3. Menampilkan jumlah transaksi barang
SELECT ItemTypeName, COUNT(TransactionID)
FROM detailselltransaction dst, item it, itemtype itp
WHERE dst.ItemID = it.ItemID AND it.ItemTypeID = itp.ItemTypeID
GROUP BY ItemTypeName;

-- 4. Menampilkan TransactionID dan Quantity per transaction (didapatkan dari menjumlahkan quantity yang terjadi pada setiap
-- transaksi
SELECT TransactionID, SUM(SellQuantity)
FROM detailselltransaction
GROUP BY TransactionID;

-- 5. Order by
-- Mengurutkan dari gaji staff terkecil ke besar
SELECT * FROM staff
ORDER BY StaffSalary ASC;
-- Mengurutkan dari gaji staff terbesar ke kecil
SELECT * FROM staff
ORDER BY StaffSalary DESC;

-- 6. Menampilkan jumlah masing-masing barang berdasarkan tipe barang
SELECT * FROM item;
SELECT ItemTypeID, SUM(Quantity)
FROM item
GROUP BY ItemTypeID;

-- Menampilkan Jumlah transaksi diatas 100
SELECT ItemTypeID
FROM item
GROUP BY ItemTypeID
HAVING SUM(Quantity) > 100;

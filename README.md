# HSCS
High speed compression system.

You can see the principle of this system is similar to some compression systems that already exist today, but in fact I came up with it myself, then realized that someone else had thought of it before me, but I still released the source code that runs it at very high speed!

# Principle of operation

Giả sử ta có 1 đống input cần nén :

Input 1 : 1000

Input 2 : 1500

Input 3 : 1200

Input 4 : 1100

Input 5 : 1000

Input 6 : 1000

Input 7 : 1900

Input 8 : 1200

Input 9 : 1700

Input 10 : 1100

Input 11 : 1000

Input 12 : 1000


Thì chúng ta đặt base là 1000, rồi lấy "input-1" - "base" = "output-1", lặp đi lặp lại với các input kia.

Như vậy thì chúng ta không cần phải lưu "1000;1500;1200;1100;1000;1900;1200;1700;1100;1000;1000", mà chúng ta chỉ cần lưu "1000;;500;200;100;;;900;200;700;100;;;".

Và dĩ nhiên bạn có thể chuyển chữ cái,.v..v sang số để nén, cũng như mở rộng Input để tăng ĐÁNG KỂ mức độ hiệu quả nén!

# What's noteworthy?

a

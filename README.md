# HSCS
High speed compression system.

You can see the principle of this system is similar (not exactly the same, just familiar) to some compression systems that already exist today, but in fact I came up with it myself, then realized that someone else had thought of it before me, but I still released the source code (never been seen before) and that runs it at very high speed!

# Principle of operation
1.Explanation in English Language (Translated by Google Translate) :

Suppose we have a bunch of input that needs to be compressed:

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

Then we set QWA to 1000, then take "Input 1" - "QWA"; repeat with the other inputs.

So we don't need to save "1000;1500;1200;1100;1000;1900;1200;1700;1100;1000;1000", we just need to save "1000;;500;200;100;;;900;200;700;100;;;".

And of course you can convert letters, etc. to numbers for compression, as well as expand the Input to SIGNIFICANTLY increase the compression efficiency!


2.Explanation in Vietnamese Language (Original) :

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


Thì chúng ta đặt QWA là 1000, rồi lấy "Input 1" - "QWA"; lặp đi lặp lại với các input kia.

Như vậy thì chúng ta không cần phải lưu "1000;1500;1200;1100;1000;1900;1200;1700;1100;1000;1000", mà chúng ta chỉ cần lưu "1000;;500;200;100;;;900;200;700;100;;;".

Và bạn có thể thêm chữ cái,vân vân,.v.v. thành số để nén, và cũng như bạn có thể mở rộng Input để tăng ĐÁNG KỂ (nhiều khi là RẤT RẤT ĐÁNG KỂ) hiệu quả nén!


# What's noteworthy?

The source code of "HSCS" uses CUDA/ASM to greatly increase the speed compared to normal!

files/a1.asm for CPU Intel on Windows (MASM / NASM)

files/a2.cu for CUDA NVIDIA GPU (Windows)


# Notification :

We are currently working on a significant upgrade for it, when it's done I'll announce it here!


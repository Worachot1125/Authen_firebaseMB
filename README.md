# flutter_firebase_authen

หน้า main.dart
มีแค่แสดงข้อความ Flutter Firebase Auth

login_screen.dart
สร้างตัวแปร eamil กับ password เพื่อรับค่า
ถ้า email กับ password ไม่ตรงกัน ให้ showDialog Login failed
และด้านล่างมีปุ่ม Forgot password และ Create account เพื่อไปยังฟังก์ชันที่ต้องการ
ถ้า login สำเร็จ ให้แสดง dialog แล้ว ไปยังหน้า home screen

create_account_screen.dart
มีให้ใส่ email, password และ comfirm password
มีเช็ค Password ถ้าใส่ไม่ถึง 6 ตัวอักษร หรือ รหัสผ่านไม่ตรง ให้แสดง dialog แจ้งเตือนผิดพลาด
ถ้ากด create สำเร็จ ให้แสดง dialog แล้วกลับมายังหน้า login

forgot_password_screen.dart
มีช่องให้กรอก email เพื่อจะส่ง link reset password ไปยังกล่องจดหมาย

home_screen.dart
แสดง email ที่ login เข้าไป
มีปุ่ม logout เวลากด แล้ว กลับมายังหน้า login

from django.db import models
# Create your models here.
class login(models.Model):
    username=models.CharField(max_length=50)
    password=models.CharField(max_length=50)
    type=models.CharField(max_length=15)
class course_tb(models.Model):
    description = models.CharField(max_length=60)
    course = models.CharField(max_length=40)
class staff(models.Model):
    lid=models.ForeignKey(login,on_delete=models.CASCADE)
    course_id = models.ForeignKey(course_tb,on_delete=models.CASCADE)
    fname = models.CharField(max_length=20)
    mname = models.CharField(max_length=20)
    lname = models.CharField(max_length=20)
    name = models.CharField(max_length=70)
    dob = models.CharField(max_length=20)
    gender = models.CharField(max_length=20)
    place = models.CharField(max_length=60)
    post = models.CharField(max_length=60)
    pin = models.BigIntegerField()
    phone = models.BigIntegerField()
    email = models.CharField(max_length=60)
class subject_tb(models.Model):
    cid  = models.ForeignKey(course_tb,on_delete=models.CASCADE)
    subjects = models.CharField(max_length=60)
    semester = models.CharField(max_length = 20)
    description = models.CharField(max_length=60)
class allotsub_tb(models.Model):
    sub_id = models.ForeignKey(subject_tb,on_delete=models.CASCADE)
    tea_tb = models.ForeignKey(staff,on_delete=models.CASCADE)
    date = models.CharField(max_length=20)
    class Meta:
        unique_together = ["sub_id","tea_tb"]
class student_tb(models.Model):
    st_id = models.ForeignKey(login,on_delete=models.CASCADE)
    fname = models.CharField(max_length=20)
    mname = models.CharField(max_length= 20)
    lname = models.CharField(max_length=20)
    dob = models.CharField(max_length=20)
    gender = models.CharField(max_length=20)
    course = models.ForeignKey(course_tb,on_delete=models.CASCADE)
    place = models.CharField(max_length=60)
    post = models.CharField(max_length=60)
    pin = models.BigIntegerField()
    phone = models.BigIntegerField()
    email = models.CharField(max_length=60)
class parent_tb(models.Model):
    stud_id = models.ForeignKey(student_tb,on_delete=models.CASCADE)
    fname = models.CharField(max_length=20)
    mname = models.CharField(max_length= 20)
    lname = models.CharField(max_length=20)
    address = models.CharField(max_length=20)
    phone = models.BigIntegerField()
    log_id=models.ForeignKey(login,on_delete=models.CASCADE)
class attendance_tb(models.Model):
    subject_id = models.ForeignKey(subject_tb,on_delete=models.CASCADE)
    student_id = models.ForeignKey(student_tb,on_delete=models.CASCADE)
    attendance = models.CharField(max_length=10,default="present")
    date = models.CharField(max_length=40)

class marks_tb(models.Model):
    sub_id = models.ForeignKey(subject_tb, on_delete=models.CASCADE)
    stud_id = models.ForeignKey(student_tb, on_delete=models.CASCADE)
    mark = models.CharField(max_length=90)
    date = models.CharField(max_length=40)
class student_chat_tb(models.Model):
    from_id = models.ForeignKey(student_tb,on_delete=models.CASCADE,null=True,related_name="studfid")
    to_id = models.ForeignKey(student_tb,on_delete=models.CASCADE,null=True,related_name="studtoid")
    message = models.CharField(max_length=1000)
    date = models.CharField(max_length=20)
class staff_chat_tb(models.Model):
    from_id = models.ForeignKey(staff,on_delete=models.CASCADE,null=True,related_name="stafffid")
    to_id = models.ForeignKey(staff,on_delete=models.CASCADE,null=True,related_name="stafftoid")
    message = models.CharField(max_length=1000)
    date = models.CharField(max_length=20)
class student_staff_chat_tb(models.Model):
    id_1 = models.ForeignKey(student_tb,on_delete=models.CASCADE)
    id_2 = models.ForeignKey(staff,on_delete=models.CASCADE)
    message = models.CharField(max_length=1000)
    message_type = models.CharField(max_length=10)
    date = models.CharField(max_length=20)

class student_staff_chat_tb(models.Model):
    from_id = models.ForeignKey(staff,on_delete=models.CASCADE,null=True,related_name="staff_id")
    to_id = models.ForeignKey(student_tb,on_delete=models.CASCADE,null=True,related_name='stud_toid')
    message = models.CharField(max_length=1000)
    date = models.CharField(max_length=20)

class studymatirial_tb(models.Model):
    sub_id = models.ForeignKey(subject_tb,on_delete=models.CASCADE)
    material = models.CharField(max_length=1000)

class time_tb(models.Model):
    sid = models.ForeignKey(subject_tb,on_delete=models.CASCADE)
    staff = models.ForeignKey(staff,on_delete=models.CASCADE)
    name = models.CharField(max_length=40)
    day = models.CharField(max_length=20)
    time = models.CharField(max_length=20)
class video_tb(models.Model) :
    sub_id = models.ForeignKey(subject_tb,on_delete=models.CASCADE)
    topic = models.CharField(max_length=40)
    video = models.FileField(upload_to = "videos")
class library_tb(models.Model) :
    student_id = models.ForeignKey(student_tb,on_delete=models.CASCADE)
    book_name = models.CharField(max_length=100)
    book_number = models.BigIntegerField()
    author = models.CharField(max_length=60)
    borrowed_date = models.CharField(max_length=20)
    due_date = models.CharField(max_length=20)
    availability = models.BooleanField()
class books_tb(models.Model):
    name = models.CharField(max_length=100)
    author = models.CharField(max_length=60)
    book = models.FileField(upload_to="books")
class chat(models.Model):
    fid=models.ForeignKey(login,related_name='login1',on_delete=models.CASCADE)
    tid=models.ForeignKey(login,related_name='login2',on_delete=models.CASCADE)
    msg=models.TextField()
    date=models.DateField()
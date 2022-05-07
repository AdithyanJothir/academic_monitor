import json
import datetime
from django.contrib import auth
from django.core.files.storage import FileSystemStorage
from django.db.models import Q, Avg, ExpressionWrapper, Sum,Count
from django.http import HttpResponse,JsonResponse
from django.shortcuts import render, redirect
from monitor.models import *
from django.contrib.auth.decorators import login_required
def index(request):
    return render(request,'index.html')
def login_page(request):
    return render(request,'login.html')
def logout(request):
    auth.logout(request)
    return redirect('/')
def login_alert(request):
    return HttpResponse('''<script>alert("Please Login!");window.location="/"</script>''')
def login_1(request):
    print(request.POST)
    uname = request.POST['username']
    pswd = request.POST['password']
    try:
        result = login.objects.get(username=uname, password=pswd)
        if result.type == "ADMIN":
            ob=auth.authenticate(request,username='admin',password='admin')
            if ob is not None:
                auth.login(request,ob)
            return redirect('/admin_home')
        else:
            return HttpResponse('''<script>alert("User not found!");window.location="/"</script>''')
    except Exception as e:
        return HttpResponse('''<script>alert("User not found!");window.location="/"</script>''')

@login_required(login_url='/login_alert')
def admin_home(request):
    return render(request,'admin_home.html')

@login_required(login_url='/login_alert')
def add_course(request):
    return render(request,'add_course.html')

@login_required(login_url='/login_alert')
def add_staff(request):
    ob = course_tb.objects.all()
    return render(request,'add_staff.html',{"data":ob})

@login_required(login_url='/login_alert')
def add_student(request):
    ob = course_tb.objects.all()
    return render(request,'add_student.html',{"courses":ob})

@login_required(login_url='/login_alert')
def add_subject(request):
    ob=course_tb.objects.all()
    return render(request,'add_subject.html',{"data":ob})

@login_required(login_url='/login_alert')
def allocate_subject(request):
    ob_1 = subject_tb.objects.all()
    ob_2 = staff.objects.all()
    return render(request,'allocate_subject.html',{"subject":ob_1,"staff":ob_2})

@login_required(login_url='/login_alert')
def edit_student(request,id):
    ob_1= student_tb.objects.get(id = id)
    ob_2 = course_tb.objects.all()
    request.session['sid'] = ob_1.id
    return render(request,'edit_student.html',{"id":ob_1,"courses":ob_2})

@login_required(login_url='/login_alert')
def edit_student1(request):
    fname=request.POST['textfield']
    mname=request.POST['textfield2']
    lname=request.POST['textfield3']
    dob=request.POST['textfield4']
    gender=request.POST['radiobutton']
    course=request.POST['select']
    place=request.POST['textfield6']
    post=request.POST['textfield7']
    pin=request.POST['textfield8']
    phone=request.POST['textfield9']
    email=request.POST['textfield10']
    ob = student_tb.objects.get(id = request.session['sid'])
    ob.fname  = fname
    ob.mname = mname
    ob.lname = lname
    ob.dob = dob
    ob.gender = gender
    ob.course = course_tb.objects.get(id = course)
    ob.place = place
    ob.post = post
    ob.pin = pin
    ob.phone = phone
    ob.email = email
    ob.save()
    return HttpResponse('''<script>alert("updated!");window.location="/admin_home"</script>''')
@login_required(login_url='/login_alert')
def delete_student(request,id):
    ob = student_tb.objects.get(st_id = id)
    ob.delete()
    obb = login.objects.get(id = id)
    obb.delete()
    return HttpResponse('''<script>alert("updated!");window.location="/admin_home"</script>''')
@login_required(login_url='/login_alert')
def edit_staff(request,id):
    ob_1 = staff.objects.get(id = id)
    ob_2 = course_tb.objects.all()
    request.session['eid']=ob_1.id
    return render(request,'edit_staff.html',{"id":ob_1,"courses":ob_2})
@login_required(login_url='/login_alert')
def edit_staff1(request):
    fname=request.POST['textfield']
    mname=request.POST['textfield2']
    lname=request.POST['textfield3']
    dob=request.POST['textfield4']
    gender=request.POST['radiobutton']
    course=request.POST['select']
    place=request.POST['textfield6']
    post=request.POST['textfield7']
    pin=request.POST['textfield8']
    phone=request.POST['textfield9']
    email=request.POST['textfield10']
    ob = staff.objects.get(id = request.session['eid'])
    ob.fname  = fname
    ob.mname = mname
    ob.lname = lname
    ob.dob = dob
    ob.gender = gender
    ob.course_id = course_tb.objects.get(id = course)
    ob.place = place
    ob.post = post
    ob.pin = pin
    ob.phone = phone
    ob.email = email
    ob.save()
    return HttpResponse('''<script>alert("updated!");window.location="/admin_home"</script>''')
@login_required(login_url='/login_alert')
def delete_staff(request,id):
    ob = staff.objects.get(lid = id)
    ob.delete()
    obb = login.objects.get(id = id)
    obb.delete()
    return HttpResponse('''<script>alert("updated!");window.location="/admin_home"</script>''')
@login_required(login_url='/login_alert')
def manage_staff(request):
    ob = staff.objects.all()
    return render(request,'manage_staff.html',{"data":ob})
@login_required(login_url='/login_alert')
def manage_student(request):
    ob = student_tb.objects.all()
    return render(request,'manage_student.html',{"data":ob})
@login_required(login_url='/login_alert')
def view_staff(request):
    ob = staff.objects.all()
    return render(request,'view_staff.html',{"data":ob})
@login_required(login_url='/login_alert')
def view_subject(request):
    ob = subject_tb.objects.all()
    return render(request,'view_subject.html',{"data":ob})
@login_required(login_url='/login_alert')
def view_course(request):
    ob = course_tb.objects.all()
    return render(request,'view_course.html',{"data":ob})
@login_required(login_url='/login_alert')
def view_student(request):
    ob = student_tb.objects.all()
    return render(request,'view_student.html',{"data":ob})
@login_required(login_url='/login_alert')
def manage_timetable(request):
    ob_1 = time_tb.objects.all()
    ob_2 = staff.objects.all()
    return render(request,'manage_timetable.html',{"data":ob_1,"staff":ob_2})
@login_required(login_url='/login_alert')
def manage_timetable1(request):
    names= request.POST['filter']
    ob_1 = time_tb.objects.filter(name = names)
    ob_2 = staff.objects.all()
    return render(request,'manage_timetable.html',{"data":ob_1,"staff":ob_2})
@login_required(login_url='/login_alert')
def delete_timetable(request,id):
    ob = time_tb.objects.get(id = id)
    ob.delete()
    return HttpResponse('''<script>alert("deleted!");window.location="/manage_timetable"</script>''')

@login_required(login_url='/login_alert')
def delete_bk(request,id):
    ob = books_tb.objects.get(id = id)
    ob.delete()
    return HttpResponse('''<script>alert("deleted!");window.location="/manage_bk"</script>''')
@login_required(login_url='/login_alert')
def schedule(request):
    ob_1 = subject_tb.objects.all()
    ob_2 = staff.objects.all()
    return render(request,'schedule.html',{"subject":ob_1,"staff":ob_2})
@login_required(login_url='/login_alert')
def manage_bk(request):
    ob = books_tb.objects.all()
    return render(request,'mng_bk.html',{"val":ob})
@login_required(login_url='/login_alert')
def add_bk(request):
    return render(request,'add_bk.html')
@login_required(login_url='/login_alert')
def add_bk1(request):
    bname=request.POST['textfield']
    authr=request.POST['textfield2']
    bk = request.FILES['file']
    fn = FileSystemStorage()
    fs = fn.save(bk.name, bk)
    ob=books_tb()
    ob.name=bname
    ob.author=authr
    ob.book=fs
    ob.save()
    return HttpResponse('''<script>alert("success!");window.location="/manage_bk"</script>''')


@login_required(login_url='/login_alert')
def add_staff_new(request):
    fname=request.POST['textfield']
    mname=request.POST['textfield2']
    lname=request.POST['textfield3']
    dob=request.POST['textfield4']
    gender=request.POST['radiobutton']
    course=request.POST['select_course']
    place=request.POST['textfield6']
    post=request.POST['textfield7']
    pin=request.POST['textfield8']
    phone=request.POST['textfield9']
    email=request.POST['textfield10']
    username=request.POST['textfield11']
    password=request.POST['textfield12']
    lob=login()
    lob.username=username
    lob.password=password
    lob.type='staff'
    lob.save()
    los=staff()
    los.fname=fname
    los.mname=mname
    los.lname=lname
    los.dob=dob
    los.gender=gender
    los.course_id=course_tb.objects.get(id=course)
    los.place=place
    los.post=post
    los.pin=pin
    los.phone=phone
    los.email=email
    los.name = fname+mname+lname
    los.lid=lob
    los.save()
    return HttpResponse('''<script>alert("registration success");window.location="/admin_home"</script>''')
@login_required(login_url='/login_alert')
def add_student_new(request):
    fname=request.POST['textfield']
    mname=request.POST['textfield2']
    lname=request.POST['textfield3']
    dob=request.POST['textfield4']
    gender=request.POST['radiobutton']
    course=request.POST['select']
    place=request.POST['textfield6']
    post=request.POST['textfield7']
    pin=request.POST['textfield8']
    phone=request.POST['textfield9']
    email=request.POST['textfield10']
    username=request.POST['textfield11']
    password=request.POST['textfield12']
    lob = login()
    lob.username = username
    lob.password = password
    lob.type = 'student'
    lob.save()
    los = student_tb()
    los.fname = fname
    los.mname = mname
    los.lname = lname
    los.dob = dob
    los.gender = gender
    los.course = course_tb.objects.get(id = course)
    los.place = place
    los.post = post
    los.pin = pin
    los.phone = phone
    los.email = email
    los.st_id = lob
    los.save()
    return HttpResponse('''<script>alert("registration success");window.location="/admin_home"</script>''')
@login_required(login_url='/login_alert')
def add_course_new(request):
    course=request.POST['textfield']
    description=request.POST['textfield2']
    lob = course_tb()
    lob.course=course
    lob.description=description
    lob.save()
    return HttpResponse('''<script>alert("success");window.location="/admin_home"</script>''')
@login_required(login_url='/login_alert')
def add_subject1(request):
    subject = request.POST['textfield']
    description =  request.POST['textarea']
    course = request.POST['select']
    semester = request.POST['textfield1']
    cid=course_tb.objects.get(id=course)
    lob = subject_tb()
    lob.subjects = subject
    lob.description = description
    lob.semester = semester
    lob.cid=cid
    lob.save()
    return HttpResponse('''<script>alert("sucess");window.location="/admin_home"</script>''')

@login_required(login_url='/login_alert')
def schedule1(request):
    date = request.POST['textfield']
    time = request.POST['textfield2']
    subject = request.POST['select']
    staffs = request.POST['select1']
    sid_id = subject_tb.objects.get(id=subject)
    print(staffs)
    staff_id = staff.objects.get(lid = staffs)
    lob = time_tb()
    lob.day = date
    lob.time = time
    lob.sid = sid_id
    name_id = staff.objects.get(lid = staffs)
    lob.name = name_id.name
    lob.staff = staff_id
    lob.save()
    return HttpResponse('''<script>alert("sucess");window.location="/admin_home"</script>''')

@login_required(login_url='/login_alert')
def allocate1(request):
    teacher = request.POST['select2']
    subject = request.POST['select']
    sub_id  = subject_tb.objects.get(id = subject)
    tea_id = staff.objects.get(id = teacher)
    try:
        lob = allotsub_tb()
        lob.sub_id = sub_id
        lob.tea_tb = tea_id
        lob.date = datetime.datetime.now().date()
        lob.save()
        return HttpResponse('''<script>alert("Success");window.location="/allocate_subject"</script>''')
    except:
        return HttpResponse('''<script>alert("Failed Duplicate Data");window.location="/allocate_subject"</script>''')

@login_required(login_url='/login_alert')
def searchstaff(request):
    sub = request.GET['sub']
    sob = allotsub_tb.objects.filter(sub_id=sub)
    data = []
    for r in sob:
        row = {"id": r.tea_tb.lid.id, "name": r.tea_tb.name}
        data.append(row)
    res = {"res": data}
    return JsonResponse(res)
###################################################################################webservice
def vstaff(request):
    sid=request.POST['sid']
    ob=student_tb.objects.get(st_id=sid)
    sob = staff.objects.filter(course_id=ob.course)
    data = []
    for r in sob:
        row = {"lid": r.lid.id, "fname": r.fname,"mname":r.mname,"lname":r.lname}
        data.append(row)
    r1 = json.dumps(data)
    print(r1)
    return HttpResponse(r1)
def upldvideo(request):
    subject  = request.POST['sid']
    topics = request.POST['topic']
    vdo=request.FILES['file']
    fn=FileSystemStorage()
    fs=fn.save(vdo.name,vdo)
    sob=subject_tb.objects.get(id=subject)
    ob=video_tb()
    ob.sub_id=sob
    ob.topic=topics
    ob.video=fs
    ob.save()
    data = {"task":"success"}
    r = json.dumps(data)
    return HttpResponse(r)
def upmatrl(request):
    subject  = request.POST['sid']
    vdo=request.FILES['file']
    fn=FileSystemStorage()
    fs=fn.save(vdo.name,vdo)
    sob=subject_tb.objects.get(id=subject)
    ob=studymatirial_tb()
    ob.sub_id=sob
    ob.material=fs
    ob.save()
    data = {"task":"success"}
    r = json.dumps(data)
    return HttpResponse(r)
def log(request):
    username  = request.POST['uname']
    password = request.POST['pass']
    try:
        result = login.objects.get(username = username, password = password)
        id = result.id
        type=result.type
        if type=="parent":
            ob=parent_tb.objects.get(log_id=id)
            data = {"task":"valid",
            "id":id,"type":type,"sid":ob.stud_id.st_id.id
            }
            r = json.dumps(data)
            print(r,"==================")
            return HttpResponse(r)
        else:
            data = {"task": "valid",
                    "id": id, "type": type
                    }
            r = json.dumps(data)
            print(r, "==================")
            return HttpResponse(r)
    except:
        data = {"task":"invalid"}
        r = json.dumps(data)
        print(r,"==================")
        return HttpResponse(r)
def allocated_sub(request):
    lid=request.POST['lid']
    sob = allotsub_tb.objects.filter(tea_tb__lid__id=lid)
    print(sob,"====================================================================")
    data = []
    for r in sob:
        row = {"subjects":r.sub_id.subjects,"semester":r.sub_id.semester,"sid":r.sub_id.id}
        data.append(row)
    r1 = json.dumps(data)
    print(r1)
    return HttpResponse(r1)
def viewts(request):
    lid=request.POST['lid']
    date=request.POST['date']
    sob = time_tb.objects.filter(staff__lid__id=lid,day=date)
    print(sob,"====================================================================")
    data = []
    for r in sob:
        row = {"subjects": r.sid.subjects, "semester": r.sid.semester,"time":r.time}
        data.append(row)
    r1 = json.dumps(data)
    print(r1)
    return HttpResponse(r1)
def select_type(request):
    type=request.POST['type']
    if type == "student":
        sob = student_tb.objects.all()
        print(sob,"====================================================================")
        data = []
        for r in sob:
            row = {"lid": r.st_id.id, "fname": r.fname,"mname":r.mname,"lname":r.lname}
            data.append(row)
        r1 = json.dumps(data)
        print(r1)
        return HttpResponse(r1)
    else:
        sob = parent_tb.objects.all()
        print(sob, "====================================================================")
        data = []
        for r in sob:
            row = {"lid": r.log_id.id, "fname": r.fname,"mname":r.mname,"lname":r.lname}
            data.append(row)
        r1 = json.dumps(data)
        print(r1)
        return HttpResponse(r1)
def view_message2(request):
    fromid=request.POST['fid']
    print(fromid)
    toid=request.POST['toid']
    print(toid)
    lmid = request.POST['lastmsgid']
    # ob1 = login.objects.get(id=fromid)
    # ob = Doctor.objects.get(log_id__id=toid)
    print("===========================================================================================================")
    from django.db.models import Q
    obb = chat.objects.filter(
        Q(tid=toid,fid=fromid,id__gt=lmid) | Q( fid=toid,tid=fromid,id__gt=lmid))
    res1 = []
    if obb is not None:
        for r in obb:
            row1 = {"fromid": r.fid.id, "msgid":r.id, "message": r.msg,"date":str(r.date)}
            res1.append(row1)
        print(res1)
        data = {'res1':res1,'status':'ok'}
        r = json.dumps(data)
        return HttpResponse(r)
    else:
        r = json.dumps(status='not found')
        return HttpResponse(r)
def in_message2(request):
    fromid = request.POST['fid']
    print("fromid",fromid)
    toid = request.POST['toid']
    print("toid",toid)
    message=request.POST['msg']
    print("msg",message)
    ob1 = login.objects.get(id=fromid)
    ob2=login.objects.get(id=toid)
    ob=chat()
    ob.msg=message
    ob.fid=ob1
    ob.tid=ob2
    ob.date=datetime.datetime.now().date()
    ob.save()
    data = {"status": "send"}
    r = json.dumps(data)
    print(r)
    return HttpResponse(r)
def vw_stud(request):
    sid=request.POST['sid']
    print(sid,"=====================")
    ob=subject_tb.objects.get(id=sid)
    sob = student_tb.objects.filter(course=ob.cid.id)
    print(sob, "====================================================================")
    data = []
    for r in sob:
        row = {"lid": r.st_id.id, "fname": r.fname, "mname": r.mname, "lname": r.lname}
        data.append(row)
    r1 = json.dumps(data)
    print(r1)
    return HttpResponse(r1)
def upld_mrk(request):
    sid = request.POST['subid']
    stid = request.POST['stdid']
    mrk = request.POST['mrk']
    ob1 = subject_tb.objects.get(id=sid)
    sob = student_tb.objects.get(st_id=stid)
    ob=marks_tb()
    ob.sub_id=ob1
    ob.stud_id=sob
    ob.mark=mrk
    ob.date=datetime.datetime.now().date()
    ob.save()
    data = {"task":"success"}
    r = json.dumps(data)
    return HttpResponse(r)
def parentreg(request):
    fnm=request.POST['fname']
    mnm=request.POST['mname']
    lnm=request.POST['lname']
    phn=request.POST['phno']
    addr=request.POST['addr']
    sno=request.POST['sno']
    un=request.POST['un']
    pwd=request.POST['pwd']
    sob=student_tb.objects.get(st_id=sno)
    lob=login()
    lob.username=un
    lob.password=pwd
    lob.type='parent'
    lob.save()
    ob=parent_tb()
    ob.stud_id=sob
    ob.fname=fnm
    ob.mname=mnm
    ob.lname=lnm
    ob.phone=phn
    ob.address=addr
    ob.log_id=lob
    ob.save()
    data = {"task":"success"}
    r = json.dumps(data)
    return HttpResponse(r)
def vw_sub(request):
    lid=request.POST['lid']
    sob = allotsub_tb.objects.filter(tea_tb__lid__id=lid)
    print(sob,"====================================================================")
    data = []
    for r in sob:
        row = {"subjects":r.sub_id.subjects,"semester":r.sub_id.semester,"sid":r.sub_id.id}
        data.append(row)
    r1 = json.dumps(data)
    print(r1)
    return HttpResponse(r1)
def view_stud_sub(request):
    lid = request.POST['lid']
    sob = student_tb.objects.get(st_id__id=lid)
    print(sob, "====================================================================")
    ob=subject_tb.objects.filter(cid=sob.course)
    data = []
    for r in ob:
        row = {"subjects": r.subjects, "id": r.id}
        data.append(row)
    r1 = json.dumps(data)
    print(r1,"r11111")
    return HttpResponse(r1)
def view_mat(request):
    sid = request.POST['sid']
    sob = studymatirial_tb.objects.filter(sub_id__id=sid)
    data = []
    for r in sob:
        row = {"material": r.material,"mid": r.id}
        data.append(row)
    r1 = json.dumps(data)
    print(r1)
    return HttpResponse(r1)
def view_videos(request):
    sid = request.POST['sid']
    sob = video_tb.objects.filter(sub_id__id=sid)
    print(sob, "====================================================================")
    data = []
    for r in sob:
        row = {"video": str(r.video),"vid": r.id,"topic":r.topic}
        data.append(row)
    r1 = json.dumps(data)
    print(r1)
    return HttpResponse(r1)
def viewts1(request):
    lid=request.POST['lid']
    date=request.POST['date']
    # ob=student_tb.objects.get(st_id__id=lid)
    # ob1=subject_tb.objects.get(cid=ob.course)
    sob = time_tb.objects.filter(day=date)
    print(sob,"====================================================================")
    data = []
    for r in sob:
        row = {"subjects": r.sid.subjects, "semester": r.sid.semester,"time":r.time}
        data.append(row)
    r1 = json.dumps(data)
    print(r1)
    return HttpResponse(r1)
def select_type1(request):
    type=request.POST['type']
    lid=request.POST['lid']
    if type == "staff":
        sob = staff.objects.all()
        print(sob,"====================================================================")
        data = []
        for r in sob:
            row = {"lid": r.lid.id, "fname": r.fname,"mname":r.mname,"lname":r.lname}
            data.append(row)
        r1 = json.dumps(data)
        print(r1)
        return HttpResponse(r1)
    else:

        sob = student_tb.objects.filter(~Q(st_id=lid))
        print(sob, "====================================================================")
        data = []
        for r in sob:
            row = {"lid": r.st_id.id, "fname": r.fname,"mname":r.mname,"lname":r.lname}
            data.append(row)
        r1 = json.dumps(data)
        print(r1)
        return HttpResponse(r1)
def attend(request):
    sid = request.POST['sid']
    attd = request.POST['attd']
    s=attd.split(',')
    print(s,"***********************************************************************")
    for w in s:
        try:
            ob1 = subject_tb.objects.get(id=sid)
            sob = student_tb.objects.get(st_id=w)
            ob=attendance_tb()
            ob.subject_id=ob1
            ob.student_id=sob
            ob.attendance='1'
            ob.date=datetime.datetime.now().date()
            ob.save()
            data = {"result":"success"}
            r = json.dumps(data)
        except:
            print("data error")
    data = {"result": "success"}
    r = json.dumps(data)
    return HttpResponse(r)
def aresult(request):
    sid = request.POST['lid']
    print(sid,"==================================")
    sob = marks_tb.objects.filter(stud_id__st_id__id=sid).aggregate(Avg('mark'))
    print(sob, "====================================================================")
    data = []
    # for r in sob:
    row = {"vid":sob['mark__avg']}
    data.append(row)
    r1 = json.dumps(data)
    print(r1)
    return HttpResponse(r1)
def ac_score(request):
    sid = request.POST['lid']
    ob=staff.objects.get(lid=sid)
    # sob = marks_tb.objects.filter(sub_id__cid=ob.course_id).aggregate(Avg('mark'))
        # .aggregate(Avg('mark'))
    ss=marks_tb.objects.values('stud_id__fname','stud_id__mname','stud_id__lname').annotate(result=ExpressionWrapper(Avg('mark'),output_field=models.FloatField()))
    print(ss,"=============ssssssssssssssssssssssssssssssss")
    # print(sob, "pppppppppppppppppppppppppppppppppppppppp")
    data = []
    for r in ss:
        row = {"fname":r['stud_id__fname'],"mname":r['stud_id__mname'],"lname":r['stud_id__lname'],"score":r['result']}
        data.append(row)
    r1 = json.dumps(data)
    print(r1,"==============================")
    return HttpResponse(r1)
def vw_attendance(request):
    try:
        sid = request.POST['lid']
        print(sid,"==================================")
        sob = attendance_tb.objects.filter(student_id__st_id__id=sid).aggregate(Sum('attendance'),Count('attendance'))
        print(sob, "====================================================================")
        res=(sob['attendance__sum']/sob['attendance__count'])*100
        print(res,"ressssssssssssssssssssssssssssssss")
        data = []
        # for r in sob:
        row = {"vid":res}
        data.append(row)
        r1 = json.dumps(data)
        print(r1)
        return HttpResponse(r1)
    except:
        sid = request.POST['lid']
        print(sid, "==================================")
        sob = attendance_tb.objects.filter(student_id__st_id__id=sid).aggregate(Sum('attendance'), Count('attendance'))
        print(sob, "====================================================================")
        res = 0.0
        print(res, "ressssssssssssssssssssssssssssssss")
        data = []
        # for r in sob:
        row = {"vid": res}
        data.append(row)
        r1 = json.dumps(data)
        print(r1)
        return HttpResponse(r1)
def vw_mrks(request):
    sid = request.POST['lid']
    print(sid,"==================================")
    sob = marks_tb.objects.filter(stud_id__st_id__id=sid)
    print(sob, "====================================================================")
    data = []
    for r in sob:
        row = {"sub":r.sub_id.subjects,"score":r.mark}
        data.append(row)
    r1 = json.dumps(data)
    print(r1)
    return HttpResponse(r1)
def vw_books(request):
    sob =books_tb.objects.all()
    data = []
    for r in sob:
        row = {"author":r.author,"book":str(r.book),"name":r.name}
        data.append(row)
    r1 = json.dumps(data)
    print(r1)
    return HttpResponse(r1)
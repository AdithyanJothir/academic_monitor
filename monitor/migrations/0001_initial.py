# Generated by Django 3.2.12 on 2022-04-08 07:10

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='course_tb',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.CharField(max_length=60)),
                ('course', models.CharField(max_length=40)),
            ],
        ),
        migrations.CreateModel(
            name='login',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=50)),
                ('password', models.CharField(max_length=50)),
                ('type', models.CharField(max_length=15)),
            ],
        ),
        migrations.CreateModel(
            name='staff',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fname', models.CharField(max_length=20)),
                ('mname', models.CharField(max_length=20)),
                ('lname', models.CharField(max_length=20)),
                ('name', models.CharField(max_length=70)),
                ('dob', models.CharField(max_length=20)),
                ('gender', models.CharField(max_length=20)),
                ('place', models.CharField(max_length=60)),
                ('post', models.CharField(max_length=60)),
                ('pin', models.BigIntegerField()),
                ('phone', models.BigIntegerField()),
                ('email', models.CharField(max_length=60)),
                ('course_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='monitor.course_tb')),
                ('lid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='monitor.login')),
            ],
        ),
        migrations.CreateModel(
            name='subject_tb',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('subjects', models.CharField(max_length=60)),
                ('semester', models.CharField(max_length=20)),
                ('description', models.CharField(max_length=60)),
                ('cid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='monitor.course_tb')),
            ],
        ),
        migrations.CreateModel(
            name='video_tb',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('topic', models.CharField(max_length=40)),
                ('video', models.FileField(upload_to='videos')),
                ('sub_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='monitor.subject_tb')),
            ],
        ),
        migrations.CreateModel(
            name='time_tb',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=40)),
                ('day', models.CharField(max_length=20)),
                ('time', models.CharField(max_length=20)),
                ('sid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='monitor.subject_tb')),
                ('staff', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='monitor.staff')),
            ],
        ),
        migrations.CreateModel(
            name='studymatirial_tb',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('material', models.CharField(max_length=1000)),
                ('sub_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='monitor.subject_tb')),
            ],
        ),
        migrations.CreateModel(
            name='student_tb',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fname', models.CharField(max_length=20)),
                ('mname', models.CharField(max_length=20)),
                ('lname', models.CharField(max_length=20)),
                ('dob', models.CharField(max_length=20)),
                ('gender', models.CharField(max_length=20)),
                ('place', models.CharField(max_length=60)),
                ('post', models.CharField(max_length=60)),
                ('pin', models.BigIntegerField()),
                ('phone', models.BigIntegerField()),
                ('email', models.CharField(max_length=60)),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='monitor.course_tb')),
                ('st_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='monitor.login')),
            ],
        ),
        migrations.CreateModel(
            name='student_staff_chat_tb',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('message', models.CharField(max_length=1000)),
                ('date', models.CharField(max_length=20)),
                ('from_id', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='staff_id', to='monitor.staff')),
                ('to_id', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='stud_toid', to='monitor.student_tb')),
            ],
        ),
        migrations.CreateModel(
            name='student_chat_tb',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('message', models.CharField(max_length=1000)),
                ('date', models.CharField(max_length=20)),
                ('from_id', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='studfid', to='monitor.student_tb')),
                ('to_id', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='studtoid', to='monitor.student_tb')),
            ],
        ),
        migrations.CreateModel(
            name='staff_chat_tb',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('message', models.CharField(max_length=1000)),
                ('date', models.CharField(max_length=20)),
                ('from_id', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='stafffid', to='monitor.staff')),
                ('to_id', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='stafftoid', to='monitor.staff')),
            ],
        ),
        migrations.CreateModel(
            name='library_tb',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('book_name', models.CharField(max_length=100)),
                ('book_number', models.BigIntegerField()),
                ('author', models.CharField(max_length=60)),
                ('borrowed_date', models.CharField(max_length=20)),
                ('due_date', models.CharField(max_length=20)),
                ('availability', models.BooleanField()),
                ('student_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='monitor.student_tb')),
            ],
        ),
        migrations.CreateModel(
            name='attendance_tb',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('attendance', models.CharField(default='present', max_length=10)),
                ('date', models.CharField(max_length=40)),
                ('student_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='monitor.student_tb')),
                ('subject_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='monitor.subject_tb')),
            ],
        ),
        migrations.CreateModel(
            name='allotsub_tb',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.CharField(max_length=20)),
                ('sub_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='monitor.subject_tb')),
                ('tea_tb', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='monitor.staff')),
            ],
            options={
                'unique_together': {('sub_id', 'tea_tb')},
            },
        ),
    ]

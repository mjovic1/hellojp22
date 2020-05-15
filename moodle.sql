# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\jp22\hello\moolde.sql
drop database if exists moodle;
create database moodle;
use moodle;


create table assignsubmission_file(
    id bigint(10) not null primary key auto_increment,
    assignment bigint(10),
    submission bigint(10),
    num_files bigint(10)
);

create table assign_plugin_config(
    id bigint(10) not null primary key auto_increment,
    assignment bigint(10),
    plugin varchar(28),
    subtype varchar(28),
    name varchar(28),
    value text
);

create table assign_submission(
    id bigint(10) not null primary key auto_increment,
    assignment bigint(10),
    userid bigint(10),
    timecreated bigint(10),
    timemodified bigint(10),
    status varchar(10),
    groupid bigint(10),
    attemptnumber bigint(10)
);

create table assignsubmission_onlinetext(
    id bigint(10) not null primary key auto_increment,
    assignment bigint(10),
    submission bigint(10),
    onlinetext text,
    onlineform_at smallint(4)
    
);

create table assign_user_flags(
    id bigint(10) not null primary key auto_increment,
    userid bigint(10),
    assignment bigint(10),
    locked bigint(10),
    mailed smallint(4),
    extensionduedate bigint(10),
    workflowstate varchar(20),
    allocatedmarker bigint(10)
);

create table assignfeedback_file(
    id bigint(10) not null primary key auto_increment,
    assignment bigint(10),
    grade bigint(10),
    num_files bigint(10)
);


create table assignfeedback_editpdf_quick(
    id bigint(10) not null primary key auto_increment,
    userid bigint(10),
    rawtext text,
    width bigint(10),
    colour varchar(10)
);

create table assign(
    id bigint(10) not null primary key auto_increment,
    course bigint(10),
    name varchar(255),
    intro text,
    introformat smallint(4),
    alwaysshowdescription tinyint(2),
    nosubmissions tinyint(2),
    submissiondrafts tinyint(2),
    sendnotifications tinyint(2),
    sendlatenotifications tinyint(2),
    duedate bigint(10),
    allowsubmissionfromdate bigint(10),
    grade bigint(10),
    timemodified bigint(10),
    requiresubmissionstatement tinyint(2),
    completionsubmit tinyint(2),
    cutoffdate bigint(10),
    teamsubmission tinyint(2),
    requireallteammembersubmit tinyint(2),
    teamsubmissiongroupingid bigint(10),
    blindmarking tinyint(2),
    revealidentities tinyint(2),
    attmeptreopenmethod varchar(10),
    maxattempts int(6),
    markingworkflow tinyint(2),
    markingallocation tinyint(2),
    sendstudentnotifications tinyint(2)
);

create table assignfeedback_comments(
    id bigint(10) not null primary key auto_increment,
    assignment bigint(10),
    grade bigint(10),
    commenttext text,
    commentformat smallint(4)
);

create table assignfeedback_editpdf_annot(
    id bigint(10) not null primary key auto_increment,
    gradeid bigint(10),
    pageno bigint(10),
    x bigint(10),
    y bigint(10),
    endx bigint(10),
    endy bigint(10),
    path longtext,
    type varchar(10),
    colour varchar(10),
    dragt tinyint(2)
);

create table assign_user_mapping(
    id bigint(10) not null primary key auto_increment,
    assignment bigint(10),
    userid bigint(10)
);


create table assign_grades(
    id bigint(10) not null primary key auto_increment,
    assignment bigint(10),
    userid bigint(10),
    timecreated bigint(10),
    timemodified bigint(10),
    grader bigint(10),
    grade decimal(10,5),
    attemptnumber bigint(10)
);

create table assignfeedback_editpdf_cmnt(
    id bigint(10) not null primary key auto_increment,
    gradeid bigint(10),
    x bigint(10),
    y bigint(10),
    width bigint(10),
    rawtext text,
    pageno bigint(10),
    colour varchar(10),
    dragt tinyint(2)
);


alter table assignsubmission_file add foreign key (submission) references assign_submission(id);
alter table assignsubmission_file add foreign key (assignment) references assign(id);
alter table assign_plugin_config add foreign key (assignment) references assign(id);
alter table assign_submission add foreign key (assignment) references assign(id);
alter table assignsubmission_onlinetext add foreign key (submission) references assign_submission(id);
alter table assignsubmission_onlinetext add foreign key (assignment) references assign(id);
alter table assign_user_flags add foreign key (assignment) references assign(id);
alter table assignfeedback_file add foreign key (assignment) references assign(id);
alter table assignfeedback_file add foreign key (grade)  references assign_grades(id);
alter table assignfeedback_comments add foreign key (assignment) references assign(id);
alter table assignfeedback_comments add foreign key (grade) references assign_grades(id);
alter table assignfeedback_editpdf_annot add foreign key (gradeid) references assign_grades(id);
alter table assign_user_mapping add foreign key (assignment) references assign(id);
alter table assign_grades add foreign key (assignment) references assign(id);
alter table assignfeedback_editpdf_cmnt add foreign key (gradeid) references assign_grades(id);
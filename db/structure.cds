namespace my.student;

entity Content {
    key ID: Integer;
    url: String(2048);
    date_published: Date;
    content_type: String(20);
    course: Association to Course; // N part  of a relationship of 1 to N
}

entity Course {
    key ID: Integer;
    course_name: String(100);
    course_duration: DecimalFloat;
    course_price: Decimal(5, 2);
    published_status: Boolean;
    content: Association to many Content on content.course = $self; // 1 part of a relationship of 1 to N
    enrollment: Association to many Enrollment on enrollment.course = $self; 
}

entity Enrollment {
    key ID: Integer;
    course: Association to Course;
    student: Association to Student;
}

entity Student {
    key email  : String(65) @(title: 'Email'); 
    first_name : String(20) @(title: 'First Name');
    last_name  : String(20);
    date_sign_up : Date;
    enrollment: Association to many Enrollment on enrollment.student = $self; 
}
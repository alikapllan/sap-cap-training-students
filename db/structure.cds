namespace my.LMS;
entity Content {
    key ID: Integer;
    content_url: String(1024);
    date_published: Date;
    content_type: String(20);
    course: Association to Course; // N part  of a relationship of 1 to N
}

entity Course {
    key ID: Integer;
    course_name: String(100);
    course_url: String(1024);
    course_duration: Integer;
    course_price: Decimal(5, 2);
    published_status: Boolean;
    content: Association to many Content on content.course = $self; // 1 part of a relationship of 1 to N
    enrollment: Association to many Enrollment on enrollment.course = $self; 
}

entity Enrollment {
    key ID: UUID; // due to COMPOSITION below enrollment has now full dependency to student in creating and for fully auto generation -> UUID
    course: Association to Course;
    student: Association to Student;
}

entity Student {
    // odata draft enable create - mechanism -> make key auto generatebe -> UUID
    key ID : UUID; 
    email  : String(65) @(title: 'Email'); 
    first_name : String(20) @(title: 'First Name');
    last_name  : String(20);
    date_sign_up : Date;
    // a complete depedency of the enrollment to the student -> as we want to also enroll a student to a couse in student object page
    enrollment: Composition of many Enrollment on enrollment.student = $self; 
}
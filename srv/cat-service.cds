using my.student as schema from '../db/schema';
using my.LMS as LMS from '../db/structure';

service CatalogService @(impl: './mysimplesrv') {
    @readonly entity Student as projection on schema.Student; // referring to the entity in schema.cds
    @updateonly entity UpdateStudent as projection on schema.Student;
    @insertonly entity InsertStudent as projection on schema.Student;
    @deleteonly entity DeleteStudent as projection on schema.Student;
    // multiple students insertion
    action insertManyStudents (students : array of Student) returns array of Student;
}

service CatalogServiceLMS {
    @readonly entity GetContent    as projection on LMS.Content;
    @readonly entity GetCourse     as projection on LMS.Course;
    @readonly entity GetEnrollment as projection on LMS.Enrollment;
    @readonly entity GetStudent    as projection on LMS.Student;
}
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

service CatalogServiceLMS @(impl: './mysimplesrv') {
    @readonly entity GetContent    as projection on LMS.Content;
    @readonly entity GetCourse     as projection on LMS.Course;
    // using select from lets you get more feature out of the lib. CAPM
    // in case of projection you have capability to override/customize the parser logic in service implementation
    entity GetEnrollment as select from LMS.Enrollment;
    entity GetStudent    as select from LMS.Student;
}

// When we allow draft-enablement all things are taken care by framework. CRUD Op. on Student entity
// The intermediate storage is gonna save for us temporarily and we commit via save button these changes are written permanently into DB.
// While editing you can check the Draft table. There is gonna be a draft entry temporarily
annotate CatalogServiceLMS.GetStudent with @odata.draft.enabled;

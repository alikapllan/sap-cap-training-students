using my.student as schema from '../db/schema';

service CatalogService @(impl: './mysimplesrv') {
    @readonly entity Student as projection on schema.Student; // referring to the entity in schema.cds
    @updateonly entity UpdateStudent as projection on schema.Student;
    @insertonly entity InsertStudent as projection on schema.Student;
    @deleteonly entity DeleteStudent as projection on schema.Student;
    // multion students insertion
    action insertManyStudents (students : array of Student) returns array of Student;
}

extend service CatalogService with {
    @readonly entity CustomGetStudent as select from schema.Student{
        *, // all data
        first_name ||' '|| last_name as full_name: String
    }excluding {
        date_sign_up
    };
}

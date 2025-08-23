using my.student as schema from '../db/schema';

service CatalogService {
    @readonly entity Student as projection on schema.Student; // referring to the entity in schema.cds

    function myFunctionName(msg:String) returns String;
}
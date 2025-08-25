using my.student as schema from '../db/schema';

service CatalogService @(impl: './mysimplesrv') {
    @readonly entity Student as projection on schema.Student; // referring to the entity in schema.cds
}
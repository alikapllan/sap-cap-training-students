using my.student as schema from '../db/schema';

extend CatalogService with definitions {
    @readonly entity CustomGetStudent as select from schema.Student {
        *, 
        first_name || ' ' || last_name as full_name : String
    } excluding {
        date_sign_up
    };
}


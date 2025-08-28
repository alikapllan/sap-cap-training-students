using CatalogServiceLMS as service from '../../srv/cat-service';

annotate service.GetStudent with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : email,
                Label : 'Email'
            },
            {
                $Type : 'UI.DataField',
                Value : first_name,
                Label : 'First Name'
            },
            {
                $Type : 'UI.DataField',
                Value : last_name,
                Label : 'Last Name'
            },
            {
                $Type : 'UI.DataField',
                Value : date_sign_up,
                Label : 'Date Sign Up'
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Personal Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'EnrollmentFacet',
            Label : 'Enrollment Information',
            Target : 'enrollment/@UI.LineItem', // enrollment will be created in route inside manifest.json
                                                // why lowercase -> because this field is written as lowercase in structure.cds in Entity Student
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : email,
            Label : 'Email' 
        },
        {
            $Type : 'UI.DataField',
            Value : first_name,
            Label : 'First Name'
        },
        {
            $Type : 'UI.DataField',
            Value : last_name,
            Label : 'Last Name'
        },
        {
            $Type : 'UI.DataField',
            Value : date_sign_up,
            Label : 'Date Sign Up'
        },
    ],
);

annotate service.GetEnrollment with @(
   
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'Enrollment Id' 
        },
        {
            $Type : 'UI.DataField',
            Value : course_ID,
            Label : 'Course ID'
        }
    ],
);
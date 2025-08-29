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

    // for course details we need to add facet here as what we see is first in Enrollment Page
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'EnrollmentFacet',
            Label : 'Course Information',
            // as course field is defined as lower case in Enrollment entity of structure.cds
            Target : 'course/@UI.FieldGroup#CourseDetails', // also need navigation for it in manifest.json
        },
    ],
   
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

// third level navigation
annotate service.GetCourse with @(
   
    UI: {
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Course',
            TypeNamePlural : 'Courses',
            Title: { Value : ID },
            Description : { 
                Label : 'Course Name',
                Value : course_name
            }
        },

        FieldGroup #CourseDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : course_name,
                Label : 'Course Name'
            },
            {
                $Type : 'UI.DataField',
                Value : course_duration,
                Label : 'Course Duration'
            },
            {
                $Type : 'UI.DataField',
                Value : course_price,
                Label : 'Course Price'
            },
            {
                $Type : 'UI.DataField',
                Value : course_url,
                Label : 'Course Url'
            },
        ],
    },
    },
);
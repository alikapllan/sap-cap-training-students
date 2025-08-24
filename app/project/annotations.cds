using CatalogService as service from '../../srv/cat-service';
annotate service.Student with @(
    UI : { 
    SelectionFields: [email, first_name],

    LineItem : [
      { Label:'Email', Value: email},
      { Label:'First Name', Value: first_name},
      { Label:'Last Name', Value: last_name},
      { Label:'Date of Sign Up', Value: date_sign_up} 
    ],

    // for object page
    HeaderInfo  : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Student',
        TypeNamePlural : 'Students',
        Title: { Value : first_name },
        Description: { Label : 'Email', Value: email },
    },

    FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'email',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'first_name',
                Value : first_name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'last_name',
                Value : last_name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'date_sign_up',
                Value : date_sign_up,
            },
        ],
    },
    
    Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
   }

    
);


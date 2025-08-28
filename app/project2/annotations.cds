using CatalogServiceLMS as service from '../../srv/cat-service';
annotate service.GetStudent with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
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
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
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
);


using { CatalogService } from './cat-service';

annotate CatalogService.Student with @(
  UI : { 
    SelectionFields: [email],

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
    }
   }
);

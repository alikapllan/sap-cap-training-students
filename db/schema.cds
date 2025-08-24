namespace my.student;

entity Student {
  key email  : String(65) @(title: 'Email'); // for naming on search field
  first_name : String(20) @(title: 'First Name'); // for naming on search field
  last_name  : String(20);
  date_sign_up : Date;
}

namespace my.student;

entity Student {
  key email  : String(65);
  first_name : String(20);
  last_name  : String(20);
  date_sign_up : Date;
}

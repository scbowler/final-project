insert into "users"
  ("firstName", "lastName", "password", "email")
  values
    ('Jim', 'Smith', 'notapassword', 'jim@example.com'),
    ('Jane', 'Doe', 'notapassword', 'jane@example.com');

insert into "todos"
  ("name", "details", "userId")
  values
    ('Wash Car', 'Wash the green car inside and out', 2),
    ('Mop Floors', 'The whole house!', 1);

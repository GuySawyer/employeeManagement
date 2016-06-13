# employeeManagement
Assessment

An employee management web service allowing a User to upload employee data via CSV file upload, or JSON API call.

## Getting Started

To run the web service locally, clone the repo and then:

```
rake db:create
rake db:migrate
rails server -p 3000
```

## Uploading employee data

Via file upload:

1. Navigate to localhost:3000
2. Choose a file
3. Click upload
4. login with User: "admin" Pass: "secret"

The file must be of the format CSV, Without Headers, data structured as follows:
```
Name1,Surname1,email1@domain,m,department1,contact_name1,contact_email1@domain
Name2,Surname2,email2@domain,m,department2,contact_name2,contact_email2@domain
etc...
```

Via API (HTTP) using "Basic Auth" with credentials
User: admin
Pass: secret

POST request to:
```
localhost:3000/employees
```
JSON body structure. Ensure that your JSON data is structured as shown:
```
{
	"employees" :[{
	        "first_name": "Name1",
	        "last_name": "Surname1",
	        "email": "email1",
	        "gender": "m",
	        "department": "deptartment1",
	        "department_contact": "contact_name1",
	        "contact_email": "contact_email1"
	        },{
	        "first_name": "Name2",
	        "last_name": "Surname2",
	        "email": "email2",
	        "gender": "f",
	        "department": "deptartment2",
	        "department_contact": "contact_name2",
	        "contact_email": "contact_email2"
	        }]
}
```

Additional Assessment Requirements:

SQL Commands

CREATE TABLES:

Employee Table
- CREATE TABLE "employees" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar, "last_name" varchar, "email" varchar, "gender" varchar, "department_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL)
- CREATE  INDEX "index_employees_on_department_id" ON "employees" ("department_id")

Department Table
- CREATE TABLE "departments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "contact" varchar, "contact_email" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL)

DELETE COMMANDS:

Departments
- SELECT "departments".* FROM "departments"
- DELETE FROM "departments" WHERE "departments"."id" = ?  [["id", 1]] (Repeats for all departments in database)

Employees
- SELECT "employees".* FROM "employees"
- DELETE FROM "employees" WHERE "employees"."id" = ?  [["id", 1]] (Repeats for all departments in database)

INSERT COMMANDS:

Departments
- INSERT INTO "departments" ("name", "contact", "contact_email", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["name", "deptartment1"], ["contact", "contact_name1"], ["contact_email", "contact_email1"], ["created_at", "2016-06-13 20:49:18.288720"], ["updated_at", "2016-06-13 20:49:18.288720"]]

Employees
- INSERT INTO "employees" ("first_name", "last_name", "email", "gender", "department_id", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?, ?, ?)  [["first_name", "Name1"], ["last_name", "Surname1"], ["email", "email1"], ["gender", "m"], ["department_id", 3], ["created_at", "2016-06-13 20:49:18.296538"], ["updated_at", "2016-06-13 20:49:18.296538"]]
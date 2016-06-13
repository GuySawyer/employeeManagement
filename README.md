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

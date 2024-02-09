# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
ruby 2.5.1p57

* Rails version
Rails 5.1.7

Output

Request --> Get :- localhost:3000/courses
Response :- 200 OK

Request --> Post :- localhost:3000/courses
JSON Payload:
{
  "course": {
    "name": "Math", "description": "course description",
    "tutors_attributes": [
      { "name": "John Doe", "email": "john@example.com", "experience": 2},
      { "name": "Jane Doe", "email": "jane@example.com", "experience": 2}
    ]
  }
}

Response :- 200 OK
require 'rails_helper'

describe CoursesController do
  it "create the course" do
      post :create, params: {course: {name: "Ror course",description: "Rails 3 hour course.", cost: 20.0, tutors_attributes: [name: "John Doe", age: 21, experience: 4]}}
      json_response = response
      parsed_body = JSON.parse(json_response.body).with_indifferent_access
      expect(json_response.status).to equal(200)
      expect(parsed_body[:id]).to_not eql nil
      expect(parsed_body[:name]).to eql("Ror course")
  end
  it "should not create the course if name is not present" do
    post :create, params: {course: {description: "Rails 3 hour course.", cost: 20.0, tutors_attributes: [name: "John Doe", age: 21, experience: 4]}}
    json_response = response
    parsed_body = JSON.parse(json_response.body)
    if parsed_body.is_a?(Array)
      error_message = parsed_body.first
      expect(json_response.status).to equal(422)
      expect(error_message).to eql("Name can't be blank")
    else
      parsed_body = parsed_body.with_indifferent_access
      expect(json_response.status).to equal(422)
      expect(parsed_body[:errors]).to eql(["Name can't be blank"])
    end
  end
  it "should list all the courses" do
  get :index
  json_response = response
  parsed_body = JSON.parse(json_response.body)
  parsed_body = parsed_body.with_indifferent_access if parsed_body.is_a?(Hash)

  expect(json_response.status).to equal(200)
end

end
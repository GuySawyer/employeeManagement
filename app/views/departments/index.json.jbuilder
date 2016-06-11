json.array!(@departments) do |department|
  json.extract! department, :id, :name, :contact, :contact_email
  json.url department_url(department, format: :json)
end

json.extract! person, :id, :person_type, :name, :document_number, :verifying_digit, :document_type, :created_at, :updated_at
json.url person_url(person, format: :json)

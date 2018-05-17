json.extract! source_file_info, :id, :source_code_info_id, :code, :relativePath, :created_at, :updated_at
json.url source_file_info_url(source_file_info, format: :json)

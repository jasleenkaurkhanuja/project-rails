class AttachmentSerializer < ActiveModel::Serializer
include Rails.application.routes.url_helpers 
def file_url 
  return rails_blob_path(object.file, only_path: true)
end
  attributes :id, :title, :body, :file_url
end

class Document
  include Mongoid::Document
  include Mongoid::Timestamps

  field :url, type: String
  field :user_email, type: String
  mount_uploader :url, UrlUploader

end

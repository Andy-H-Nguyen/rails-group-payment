class Artifact < ActiveRecord::Base
  attr_accessor :upload
  belongs_to :project
  
  MAX_FILESIZE = 10.megabytes
  validates_presence_of :name, :upload
  validates_uniqueness_of :name
  
  validate :uploaded_file_size
  
  private
  if upload
   errors.add(:upload, "File size must be less than #{self.class::MAX_FILESIZE}") unless upload.size <= self.class::MAX_FILESIZE
  end
end

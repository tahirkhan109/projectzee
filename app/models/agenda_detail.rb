class AgendaDetail < ActiveRecord::Base
  belongs_to :conference

  has_attached_file :attach,
                    #:styles => lambda { |a| a.instance.images_styles? ? {:medium => "250x250>", :thumb => "100x100>"} : {} },
                    #  :content_type => {:content_type => ["image/jpeg", "image/gif", "image/png", "image/jpg"]},
                      :path => ":attachment/:id/:style/:basename.:extension",
                      :storage => :s3,
                      :s3_credentials => {
                          :bucket => "dlpheroku-prod",
                          :access_key_id => "AKIAJKPJFFZSLMY5QZAA",
                          :secret_access_key => "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"
                      }


  #has_attached_file :attach,
  ##:styles => { :medium => "x300", :thumb => "x100" },
  #                :default_url => "dlprails.s3-website-us-east-1.amazonaws.com",
  #                :storage => :s3,
  #                :bucket => 'dlprails',
  #                :s3_credentials => S3_CREDENTIALS
#has_attached_file :pic, :url => '/system/:attachment/:id/:style/:basename.:extension',
#                  :path => ':rails_root/public/system/:attachment/:id/:style/:basename.:extension'
#                  :styles => lambda { |a| a.instance.images_styles? ? {:medium => '500x500>', :other => '640x530', :thumb => '500x500>'} : {} },
#                   presence: true
#
#validates_attachment :pic, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
#has_attached_file :attach

#def images_styles?
#  if pic_content_type == 'image/jpeg' || pic_content_type == 'image/jpg' || pic_content_type == 'image/png' || pic_content_type == 'image/gif'
#    true
#  else
#    false
#  end
#end
  do_not_validate_attachment_file_type :attach

end



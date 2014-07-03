class AgendaDetail < ActiveRecord::Base
  belongs_to :attendee_detail
  has_attached_file :attach
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

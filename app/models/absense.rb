require 'open-uri'

class Absense < ActiveRecord::Base
  belongs_to :employee
  has_many :absence_blasters, dependent: :destroy
  after_create :send_blasters

  def send_blasters
    access_code = rand(9999999).to_s.center(4, rand(9).to_s)
    @blaster = AbsenceBlaster.create(recipient_number: self.phone_number, shift: self.shift, access_code: access_code, absense_id: self.id)
    url = "https://api.tropo.com/1.0/sessions?action=create&token=76487a4c514c666d4b4c7864576a6277445a485a5a764671496261455043517849444e57517a564764707752&recipient=#{self.phone_number}&shift=#{self.shift}&access_code=#{access_code}"
    puts 'Hello ' + url
    response = open(url).read
  end

end

class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

     #attr_accessible :email, :password, :password_confirmation, :remember_me, :username
has_one :contact

  validates_uniqueness_of :username
  validates_presence_of :username
  validates :username, length: { in: 4..20 }

 has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100>"}, :default_url => "/images/:style/default_image.png"

validates_attachment_content_type :avatar, :content_type => /\Aimage\/*\Z/


end

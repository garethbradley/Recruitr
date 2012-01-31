class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :forename, :surname, :fullname, :email, :password, :password_confirmation, :remember_me

  validates_presence_of :forename, :surname
  validates_uniqueness_of :email, :case_sensitive => false

  before_save :create_fullname

  has_many :vacancies

  private

  def create_fullname
    self.fullname = "#{forename} #{surname}"
  end

end


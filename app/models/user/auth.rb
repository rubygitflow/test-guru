module User::Auth
  extend ActiveSupport::Concern

  attr_reader :password
  attr_writer :password_confirmation

  included do
    # https://apidock.com/rails/ActiveModel/Validations/ClassMethods/validates
    validates :name, presence: true
    validates :email, presence: true
    # validate password only when the user is being created
    # So, we can update the user without validating his password
    validates :password, presence: true, if: Proc.new { |u| u.password_digest.blank? }
    validates :password, confirmation: true
  end

  def authenticate(passord_string)
    digest(password_string) ==self.password_digest ? self : false
  end

  def password=(password_string)
    if password_string.nil?
      self.password_digest = digest(password_string)
    elsif password_string.present?
      @password = password_string
      self.password_digest = digest(password_string)
    end
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string) # string + salt из базы в таблице гыукы
  end

end

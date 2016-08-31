class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :email, :username, presence: true, uniqueness: true
  validate :length_checker


  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @plain_text = new_password
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end

  def length_checker
    if @plain_text && @plain_text.length < 8
      errors.add(password: "must be longer than 8 characters")
    end
  end

end

class Password < ActiveRecord::Base
  include DoorMat::AttrSymmetricStore

  belongs_to :actor, class_name: 'DoorMat::Actor'

  attr_symmetric_store :subject, :password

  after_find do |record|
    record.length = record.password.length
  end

  validates :subject, presence: true
  validates :subject, length: { maximum: 50 }
  validates :length, numericality: { only_integer: true, greater_than_or_equal_to: 8, less_than_or_equal_to: 64 }

  attr_accessor :length, :capital, :numeric, :special

  def self.new_w_default
    p = self.new
    p.length = 20
    p.capital = p.numeric = p.special = '1'
    p
  end

  def generate
    valid_characters = [*('a'..'z')]
    valid_characters += [*('A'..'Z')]  if '1' == @capital
    valid_characters += [*(0..9)] if '1' == @numeric
    valid_characters += ['!', '#', '$', '%', '&', '*', '+', ',', '-', '.',
                         '/', ':', ';', '<', '=', '>', '?', '@', '^', '_'] if '1' == @special

    password = []
    @length.to_i.times { password << valid_characters[SecureRandom.random_number(valid_characters.count)] }
    self.password = password.join()
  end
end

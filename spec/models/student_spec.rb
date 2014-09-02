require 'rails_helper'

RSpec.describe Student, :type => :model do
  before do
    Fabricate(:student, name: "Adam")
  end
  it { should validate_presence_of :name }
end

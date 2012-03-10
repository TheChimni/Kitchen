require 'spec_helper'

describe Ingredient do
  it { should validate_presence_of :title }
  it { should respond_to :description }
  it { should have_and_belong_to_many :recipes }
end 
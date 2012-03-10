require 'spec_helper'

describe Ingredient do
  it { should validate_presence_of :title }
  it { should respond_to :description }
end 
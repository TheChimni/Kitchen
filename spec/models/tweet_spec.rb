require 'spec_helper'

describe Tweet do
  it { should respond_to :text }

  # above is a shorthand version of...
  # it 'should respone to :text' do
  #   Tweet.new.should respond_to :text
  # end
end
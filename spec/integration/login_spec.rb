require 'spec_helper'

describe 'Login' do
  before do
  end

  it 'should show a login link' do
    pending
    visit '/'
    page.should have_link "Login"
  end

end


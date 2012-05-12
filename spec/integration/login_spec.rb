require 'spec_helper'

describe 'Login' do
  before do
    @user = User.create :email => 'bob@example.com', :password => 'secret', :password_confirmation => 'secret'
  end

  it 'the home page should have a login link if we are not logged in' do
    visit root_path
    page.should have_link "Login"
  end

  it 'login link should take us to the login form' do
    visit root_path
    click_link "Login"
    current_path.should == new_user_session_path
  end

  it 'should be able to login with valid credentials' do
    visit new_user_session_path
    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => 'secret'
    click_button "Sign in"
    current_path.should == root_path
  end

  it 'should not be able to login with invalid credentials' do
    visit new_user_session_path
    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => 'sausages'
    click_button "Sign in"
    current_path.should == new_user_session_path
  end

end


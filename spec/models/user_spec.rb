# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  manager_id             :integer
#  band_id                :integer
#  bank_id                :integer
#  designation_id         :integer
#  emp_type_id            :integer
#  preference_id          :integer
#  ecode                  :string(255)
#  name                   :string(255)
#  email                  :string(255)      not null
#  mobile                 :string(255)
#  gender                 :string(255)
#  father_name            :string(255)
#  spouse_name            :string(255)
#  date_of_birth          :date
#  marital_status         :string(255)
#  date_of_anniversary    :date
#  address                :text
#  date_of_joining        :date
#  blood_group            :string(255)
#  pan_no                 :string(255)
#  pf_no                  :string(255)
#  esi_no                 :string(255)
#  role                   :string(255)
#  salary                 :integer
#  creator                :integer
#  updator                :integer
#  soft_delete            :boolean          default(FALSE)
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  acc_number             :string(255)
#

require 'spec_helper'

describe User do
  
  before(:each) do
    @user = create(:user)
  end
  
  it "should require an user email address" do
    no_email_user = build(:user, :email => "")
    no_email_user.should_not be_valid
  end
  
  it "should require an admin email address" do
    no_email_admin = build(:user, :email => "", :admin => true)
    no_email_admin.should_not be_valid
  end
  
  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = build(:user, :email => address)
      valid_email_user.should be_valid
    end
  end
  
  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = build(:user, :email => address)
      invalid_email_user.should_not be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    user_with_duplicate_email = build(:user)
    user_with_duplicate_email.should_not be_valid
  end
  
  it "should reject email addresses identical up to case" do
    upcased_email = @user[:email].upcase
    FactoryGirl.build(:user, :email => upcased_email)
    user_with_duplicate_email = build(:user)
    user_with_duplicate_email.should_not be_valid
  end
  
  describe "passwords" do

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end
  
  describe "password validations" do

    it "should require a password" do
      FactoryGirl.build(:user ,:password => "", :password_confirmation => "")
      should_not be_valid
    end

    it "should require a matching password confirmation" do
      FactoryGirl.build(:user , :password_confirmation => "invalid")
      should_not be_valid
    end
    
    it "should reject short passwords" do
      short = "a" * 5
      FactoryGirl.build(:user , :password => short, :password_confirmation => short)
      should_not be_valid
    end 
  end
  
  describe "password encryption" do
    
    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end
  end

end

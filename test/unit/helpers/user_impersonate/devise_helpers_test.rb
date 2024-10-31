require 'test_helper'

class UserImpersonate::DeviseHelpersTest < ActionController::TestCase
  class TestClass
    attr_reader :session

    def initialize(session)
      @session = session
    end

    include UserImpersonate::DeviseHelpers::UrlHelpers
  end

  # https://github.com/modulotech/user_impersonate3/issues/3
  # If config.user_finder is not specified, default of "find" should be used.
  # Similarly, config.user_class should default to "User".
  test 'user_finder not specified' do
    options = UserImpersonate::Engine.config.class.class_variable_get('@@options')
    options.delete(:user_class)
    options.delete(:user_finder)
    user = User.create!(:email => 'test@example.com', :password => 'password')
    staff_user = TestClass.new(:staff_user_id => user.id).current_staff_user
    assert_equal user, staff_user
  end

  # https://github.com/modulotech/user_impersonate3/issues/3
  # If config.user_finder is nil, default of "find" should be used.
  # Similarly, config.user_class should default to "User".
  test 'user_finder nil' do
    options = UserImpersonate::Engine.config.class.class_variable_get('@@options')
    options[:user_class] = nil
    options[:user_finder] = nil
    user = User.create!(:email => 'test@example.com', :password => 'password')
    staff_user = TestClass.new(:staff_user_id => user.id).current_staff_user
    assert_equal user, staff_user
  end

  # Issue #23: Broken test: uninitialized constant SomeUser
=begin
  # https://github.com/modulotech/user_impersonate3/issues/3
  # If config.user_finder is specified, the given method should be called.
  test 'user_finder other' do
    options = UserImpersonate::Engine.config.class.class_variable_get('@@options')
    options[:user_finder] = :other
    user = User.create!(:email => 'test@example.com', :password => 'password')
    assert_raises NoMethodError do
      TestClass.new(:staff_user_id => user.id).current_staff_user
    end
  end
=end

  # https://github.com/modulotech/user_impersonate3/issues/3
  # If config.user_class is specified, the given model should be used.
  test 'user_class other' do
    options = UserImpersonate::Engine.config.class.class_variable_get('@@options')
    options[:user_class] = 'SomeUser'
    user = User.create!(:email => 'test@example.com', :password => 'password')
    assert_raises NameError do
      TestClass.new(:staff_user_id => user.id).current_staff_user
    end
  end
end


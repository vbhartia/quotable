class StaticPagesController < ApplicationController

  def homepage
  	#if user_signed_in?
  	#	redirect_to dashboard_path
  	#end
  	@homepage = true

  end

  def payroll_history_test
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @help_request = HelpRequest.new
    @tasks = Task.all
  end
end

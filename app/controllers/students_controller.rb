class StudentsController < ApplicationController
  def show
    @student = Unirest.get("http://localhost:3000/api/v2/students/#{params[:id]}").body
    render "show.html.erb"
  end
end

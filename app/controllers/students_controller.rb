class StudentsController < ApplicationController

  HEADER = {"Accept" => "application/json", 
            "X-User-Email"=>"Mike@Yatco.com", 
            "Authorization"=>"Token token=password"}
  
  def index
    @students = Unirest.get("#{ENV['API_URL']}students/", headers: HEADER,).body
    render "index.html.erb"
  end

  def show
    @student = Student.find_by(id: params[:id])
    # @student = Unirest.get("#{ENV['API_URL']}students/#{params[:id]}", headers: HEADER,).body
    render "show.html.erb"
  end

  def new
    render "new.html.erb" 
  end

  def create
    @student = Unirest.post("#{ENV['API_URL']}students/", 
      headers:{ "Accept" => "application/json"},
      parameters:{ first_name: params[:first_name], last_name: params[:last_name], birthdate: params[:birthdate], university: params[:university], pokemon: params[:pokemon], email: params[:email]}).body
    redirect_to "/students/#{@student['id']}"
  end

  def edit
    @student = Unirest.get("#{ENV['API_URL']}students/#{params[:id]}").body
    render "edit.html.erb"
  end

  def update
    @student = Unirest.patch("#{ENV['API_URL']}students/#{params[:id]}", 
      headers:{ "Accept" => "application/json"},
      parameters:{ first_name: params[:first_name], last_name: params[:last_name], birthdate: params[:birthdate], university: params[:university], pokemon: params[:pokemon], email: params[:email]}).body
    redirect_to "/students/#{@student['id']}"
  end

  def destroy
    @student = Unirest.delete("#{ENV['API_URL']}students/#{params[:id]}",
      headers:{ "Accept" => "application/json"}).body
    redirect_to "/students"
  end

end

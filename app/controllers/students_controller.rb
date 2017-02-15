class StudentsController < ApplicationController
  
  def index
    @students = Student.all
    render :index
  end

  def show
    @student = Student.find_by(id: params[:id])
    # @student = Unirest.get("#{ENV['API_URL']}students/#{params[:id]}", headers: HEADER,).body
    render :show
  end

  def new
    render :new
  end

  def create
    @student = Student.create(first_name: params[:first_name], last_name: params[:last_name], birthdate: params[:birthdate], university: params[:university], pokemon: params[:pokemon], email: params[:email])
    redirect_to "/students/#{@student.id}"
  end

  def edit
    @student = Student.find_by(id: params[:id])
    render :edit
  end

  def update
    @student = Student.find_by(id: params[:id])
    @student.update(first_name: params[:first_name], last_name: params[:last_name], birthdate: params[:birthdate], university: params[:university], pokemon: params[:pokemon], email: params[:email])
    redirect_to "/students/#{@student.id}"
  end

  def destroy
    @student = Student.find_by(id: params[:id])
    @student.destroy
    redirect_to "/students"
  end

end

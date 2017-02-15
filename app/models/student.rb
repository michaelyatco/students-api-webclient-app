class Student
  attr_accessor :id, :first_name, :last_name, :birthdate, :university, :pokemon, :email
  HEADER = {"Accept" => "application/json", 
            "X-User-Email" => ENV["API_EMAIL"], 
            "Authorization" => "Token token=#{ENV['API_KEY']}"}
  def initialize(hash)
    @id = hash["id"]
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @birthdate = hash["birthdate"]
    @university = hash["university"]
    @pokemon = hash["pokemon"]
    @email = hash["email"]
  end

  def self.find_by(input_options)
    id = input_options[:id]
    # student_hash = Unirest.get("#{ENV['API_URL']}students/#{id}", headers: HEADER).body
    student_hash = Unirest.get("http://localhost:3000/api/v2/students/#{id}", headers: HEADER).body
    Student.new(student_hash)
  end

  def self.all
    student_hashes = Unirest.get("#{ENV['API_URL']}students/", headers: HEADER).body
    students = []
    student_hashes.each do |student_hash|
      students << Student.new(student_hash)
    end
    return students
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.create(input_options)
    Unirest.post("#{ENV['API_URL']}students/", 
      headers: HEADER, parameters: input_options).body
  end

  def update(input_options)
    Unirest.patch("#{ENV['API_URL']}students/#{id}", headers: HEADER, parameters: input_options).body
  end

  def destroy
    Unirest.delete("#{ENV['API_URL']}students/#{id}", headers: HEADER).body
  end
end
require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
also_reload('lib/**.*.rb')
require("./lib/employee")
require("./lib/division")
require('pry')
require('pg')

get('/') do
  @employees = Employee.all
  @divisions = Division.all
  erb(:home)
end

post('/divisions/add') do
  division_name = params.fetch("division")
  @division = Division.create({:name => division_name})
  @employees = Employee.all
  @divisions = Division.all
  erb(:home)
end

post('/employees/add') do
  employee_name = params.fetch("employee")
  @employee = Employee.create({:name => employee_name})
  @employees = Employee.all
  @divisions = Division.all
  erb(:home)
end

get('/employees/:id') do
  @divisions = Division.all
  id = params.fetch(:id)
  @employee = Employee.find(id)
  erb(:employee)
end

post('/employees/:id') do
  @divisions = Division.all
  id = params.fetch(:id)
  @employee = Employee.find(id)
  erb(:employee)
end

get('/divisions/:id') do
  id = params.fetch(:id)
  @division = Division.find(id)
  erb(:division)
end

patch("/employees/:id/edit") do
  name = params.fetch("name")
  division_id = params[:division_id]
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.update({:name => name, :division_id => division_id})
  @divisions = Division.all
  erb(:employee)
end

delete("/employees/:id/delete") do
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.delete()
  @employees = Employee.all
  @divisions = Division.all
  erb(:home)
end

patch("/divisions/:id/edit") do
  division = params.fetch("division")
  @division = Division.find(params.fetch("id").to_i())
  @division.update({:name => division})
  @divisions = Division.all
  erb(:division)
end

delete("/divisions/:id/delete") do
  @division = Division.find(params.fetch("id").to_i())
  assigned_employees = Employee.where(division_id: @division.id)
  assigned_employees.each do |e|
    e.update({:division_id => nil})
  end
  @division.delete()
  @employees = Employee.all
  @divisions = Division.all
  erb(:home)
end

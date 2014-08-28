enable :sessions

get '/' do
  erb :index
end

get '/employees' do
  erb :'employees/index'
end

get '/employee/:id' do
  @employees = Employee.find params[:id]
  erb :'employee/show'
end

post '/login' do
  @employee = Employee.find_by(employee_id: params[:employee_id], password: params[:password])
  employee_sessions
end

post '/logout' do
  session.clear
  redirect '/'
end

post '/shifts/new' do
  #create shifts (mgmt only)
end

post '/shifts/view' do
  #view schedule
end

post '/shifts/append' do
  #update schedule
end

post '/employees/' do
end
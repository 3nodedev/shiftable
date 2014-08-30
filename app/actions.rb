helpers do
  def logged_in?
    session[:employee_number].present?
  end
  @login_error = false
end
enable :sessions

get '/' do
  erb :index
end

get '/employees' do
  @shift_data = Shift.all
  @shift_cal = @shift_data.to_json
  binding.pry
  erb :'employees/index'
end

get '/employee/:id' do
  @employees = Employee.find params[:id]
  erb :'employee/show'
end

get '/login' do
  @employee = Employee.new
  erb :'login/index'
end

post '/login' do
  if Employee.where(:employee_number => params['employee_number']).pluck(:password)[0] == params['password']
    id = Employee.where(:employee_number => params['employee_number']).pluck(:id)[0]
    session[:employee_number] = params[:employee_number]
    @login_error = false
    redirect '/employees'
  else
    @login_error = true
    erb :'/login/index'
  end
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

get '/management' do
  erb :'management/index'
end

get '/management/scheduling' do
  erb :'management/scheduling'
end

get '/video' do
  erb :'video/index'
end

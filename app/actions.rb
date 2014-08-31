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
  @shift_data_json = @shift_data.to_json
  @shift_cal = @shift_data_json.gsub(/\"/, '\'')
  # binding.pry
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
    session[:employee_id] = id
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

get '/employees/shiftable' do
  @my_shifts = Shift.where(employee_id: session[:employee_id])
  @shifts_avail = Shift.where(employee_id: nil)
  erb :'/shiftable/index'
end

post '/dropshift' do
  dropshift = Shift.find params[:shift_id]
  dropshift.employee_id = nil
  dropshift.save
  redirect '/employees/shiftable'
end

post '/grabshift' do
  grabshift = Shift.find params[:shift_id]
  grabshift.employee_id = session[:employee_id]
  grabshift.save
  redirect '/employees/shiftable'
end

post '/employees/' do
end

get '/management' do
  @shift_data = Shift.where(employee_id: session[:employee_id])
  @shift_data_json = @shift_data.to_json
  @shift_cal = @shift_data_json.gsub(/\"/, '\'')
  # binding.pry
  erb :'management/index'
end

get '/management/scheduling' do
  erb :'management/scheduling'
end

get '/video' do
  erb :'video/index'
end

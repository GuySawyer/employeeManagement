class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  
  USER, PASSWORD = 'admin', 'secret'
  before_filter :authentication_check, :except => :index

  # GET /employees
  # GET /employees.json
  def index
  end

  def listall
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  def import
    respond_to do |format|
      if params[:file].present?
        Department.import(params[:file])
        Employee.import(params[:file])

        format.html { redirect_to root_path, notice: 'File successfuly uploaded and records created.' }
      else
        format.html { redirect_to root_path, notice: 'Please add a file to be uploaded.' }
      end
    end
  end

  # POST /employees
  # POST /employees.json
  def create
    respond_to do |format|
      if params.present?
        Department.api_import(JSON.parse(request.raw_post))
        Employee.api_import(JSON.parse(request.raw_post))
        msg = { :status => "ok", :message => "Data successfully uploaded", :html => "<b>...</b>" }
        format.json  { render :json => msg } # don't do msg.to_json
      else
        msg = { :status => "fail", :message => "No data received", :html => "View README at https://github.com/GuySawyer/employeeManagement/blob/master/README.md" }
        format.json  { render :json => msg } # don't do msg.to_json
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email, :gender, :department, :department_contact, :contact_email)
    end

    private
 
    private
    def authentication_check
     authenticate_or_request_with_http_basic do |user, password|
      user == USER && password == PASSWORD
     end
    end
end

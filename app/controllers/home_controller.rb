class HomeController < ApplicationController
  skip_before_action :authenticate_tenant!, :only => [ :index ]

  def index
  	if current_user
  		if session[:tenant_id]
  			Tenant.set_current_tenant session[:tenant_id]
  		else
  			Tenant.set_current_tenant current_user.tenants.first
  		end
  		@tenant = Tenant.current_tenant
      @projects =  Project.by_plan_and_tenant(@tenant.id)  #To display all the projects of the current tent if current_user is present
  		params[:tenant_id] = @tenant.id
  	end	
  end

end

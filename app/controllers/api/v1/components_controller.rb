class Api::V1::ComponentsController < ApplicationController
  def index
    pg = ActiveRecord::Base.connection.instance_variable_get :@connection
    
    postgres_status = ""
    if pg.status == PG::Connection::CONNECTION_OK
      postgres_status = "CONNECTION OK"
    else
      postgres_status = "CONNECTION BAD"
    end
    
    render json: {
      PostgreSQL: postgres_status
    }
  end
end
class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :update]

  # GET /schools
  # GET /schools.json
  def index
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
  end

  # POST /schools
  # POST /schools.json
  def result
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end
    
    def find_points_on_radius
    end
end

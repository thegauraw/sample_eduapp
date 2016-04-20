class ProgressesController < ApplicationController
  def index
    @student = Student.find(params[:student_id])
    @progresses = @student.progresses.order("created_at desc")
  end

  def create
  end
end

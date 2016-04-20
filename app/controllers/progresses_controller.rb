class ProgressesController < ApplicationController
  def index
    @student = Student.find(params[:student_id])
    @progresses = @student.progresses.order("created_at desc")
  end

  def create
    @student = Student.find(params[:student_id])
    @progress = @student.progresses.new(params[:progress])
    if @student.save
      redirect_to student_progresses_path
    else
      redirect_to :back
    end
  end
end

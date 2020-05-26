class InterviewsController < ApplicationController
  before_action :set_interview, only: [:show, :edit, :update, :destroy]

  # GET /interviews
  # GET /interviews.json
  def index
    @interviews = Interview.all.order(:start_time)
  end

  # GET /interviews/1
  # GET /interviews/1.json
  def show
  end

  # GET /interviews/new
  def new
    @interview = Interview.new
  end

  # GET /interviews/1/edit
  def edit
  end

  # POST /interviews
  # POST /interviews.json
  def create
    interviewer_id = params[:interview][:interviewer_id]
    interviewee_id = params[:interview][:interviewee_id]
    start_time, end_time = time_conversion(params)
    result, reason = Interview.participants_available(start_time, end_time, interviewer_id, interviewee_id)
    @interview = Interview.new(interview_params)
    if(result == true)
      respond_to do |format|
        if @interview.save
          format.html { redirect_to @interview, notice: 'Interview was successfully created.' }
          format.json { render :show, status: :created, location: @interview }
        else
          format.html { render :new }
          format.json { render json: @interview.errors, status: :unprocessable_entity }
        end
      end
    elsif result==false
      respond_to do |format|
        if(reason=="Interviewer")
          @interview.errors.add(:participant, message: "Interviewer is Unavailable")
        else   
            @interview.errors.add(:participant, message: "Interviewee is Unavailable")  
        end
        format.html {  render :new }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interviews/1
  # PATCH/PUT /interviews/1.json
  def update
    logger.info("update")
    logger.info(params)
    logger.info("update")
    interviewer_id = params[:interview][:interviewer_id]
    interviewee_id = params[:interview][:interviewee_id]
    start_time, end_time = time_conversion(params)
    result, reason = Interview.participants_available(start_time, end_time, interviewer_id, interviewee_id)
    logger.info(result)
    logger.info( reason)
    if(result == true)
      respond_to do |format|
        if @interview.update(interview_params)
          format.html { redirect_to @interview, notice: 'Interview was successfully updated.' }
          format.json { render :show, status: :ok, location: @interview }
        else
          format.html { render :edit }
          format.json { render json: @interview.errors, status: :unprocessable_entity }
        end
      end
    elsif result==false
      logger.info reason
      respond_to do |format|
        if(reason=="Interviewer")
          @interview.errors.add(:participant, message: "Interviewer is Unavailable")
        else   
            @interview.errors.add(:participant, message: "Interviewee is Unavailable")  
        end
        format.html { render :edit }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interviews/1
  # DELETE /interviews/1.json
  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy
    respond_to do |format|
      format.html { redirect_to interviews_url, notice: 'Interview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview
      @interview = Interview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def interview_params
      params.require(:interview).permit(:title, :start_time, :end_time, :interviewer_id, :interviewee_id) 
    end

    def time_conversion(params)
      start = 0
      close = 0
      if(params[:interview]["start_time(1i)"])
          start = DateTime.new(params[:interview]["start_time(1i)"].to_i, 
          params[:interview]["start_time(2i)"].to_i,
          params[:interview]["start_time(3i)"].to_i,
          params[:interview]["start_time(4i)"].to_i,
          params[:interview]["start_time(5i)"].to_i)
          close = DateTime.new(params[:interview]["end_time(1i)"].to_i, 
          params[:interview]["end_time(2i)"].to_i,
          params[:interview]["end_time(3i)"].to_i,
          params[:interview]["end_time(4i)"].to_i,
          params[:interview]["end_time(5i)"].to_i)
          logger.info("date time")
      logger.info(start)
      logger.info(close)
      return start, close
      else
        logger.info("date")
        start = params[:interview][:start_time].to_datetime
        close = params[:interview][:end_time].to_datetime
        logger.info("date time")
      logger.info(start)
      logger.info(close)
      return start, close
      end
    end
end

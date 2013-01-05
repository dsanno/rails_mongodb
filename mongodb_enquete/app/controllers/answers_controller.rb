class AnswersController < ApplicationController
  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @answers }
    end
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    @answer = Answer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/list
  # GET /answers/list.json
  def list
    @answers = Answer.all
  end

  # GET /answers/new
  # GET /answers/new.json
  def new
    @enquete = Enquete.find(params[:enquete_id])
    @answer = Answer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @answer }
    end
  end

  # GET /answers/1/edit
  def edit
    @answer = Answer.find(params[:id])
  end

  # POST /answers
  # POST /answers.json
  def create
    if params[:commit]
      questions = Enquete.find(params[:answer][:enquete_id]).questions
      @err_msg = {}

      questions.each do |q|
        if q.required_column && params[:answer][q.question_number].blank?
          @err_msg[q.question_number] = "入力されていません"
        end
      end

      if @err_msg.blank?
        answer = Answer.new(params[:answer])
        answer.save!
        flash[:msg] = "回答を受け付けました"
        redirect_to action: 'show', controller: 'enquetes', id: params[:answer][:enquete_id]
      else
        @enquete = Enquete.find(params[:answer][:enquete_id])
        render action: 'show'
      end
    end
  end

  # POST /answers
  # POST /answers.json
  def create_test
    2.times do
      condition = {}
      (1..12).each do |n|
        type = rand(100) % 4
        if type == 1
          condition["q_#{n}"] = "a_#{n}"
        elsif type == 2
          condition["q_#{n}"] = "a\nb_#{n}"
        elsif type == 3
          condition["q_#{n}"] = 1 + rand(5)
        else
          list = [1, 2, 3, 4, 5]
          condition["q_#{n}"] = list.sort_by{rand}[0..rand(5)]
        end
      end

      answer = Answer.new(
          condition.merge(
            user_id: 1,
            enquete_id: 1
          )
      )
      answer[:q_13] = 11
      answer[:q_14] = "test"
      answer.save!
    end

    render test: "completed"
  end

  # PUT /answers/1
  # PUT /answers/1.json
  def update
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :no_content }
    end
  end
end

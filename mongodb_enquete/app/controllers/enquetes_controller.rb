class EnquetesController < ApplicationController
  # GET /enquetes
  # GET /enquetes.json
  def index
    @enquetes = Enquete.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @enquetes }
    end
  end

  # GET /enquetes/1
  # GET /enquetes/1.json
  def show
    @enquete = Enquete.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @enquete }
    end
  end

  # GET /enquetes/new
  # GET /enquetes/new.json
  def new
    @enquete = Enquete.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @enquete }
    end
  end

  # GET /enquetes/1/edit
  def edit
    @enquete = Enquete.find(params[:id])
  end

  # POST /enquetes
  # POST /enquetes.json
  def create
    @enquete = Enquete.new(params[:enquete])

    respond_to do |format|
      if @enquete.save
        format.html { redirect_to @enquete, notice: 'Enquete was successfully created.' }
        format.json { render json: @enquete, status: :created, location: @enquete }
      else
        format.html { render action: "new" }
        format.json { render json: @enquete.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /enquetes
  # POST /enquetes.json
  def create_default
    enquete = Enquete.new(
        name: "アンケート"
    )

    question_list = []
    type_h = {
      q_1: 'text',
      q_2: 'checkbox',
      q_3: 'radio',
      q_4: 'pulldown',
      q_5: 'textarea'
    }
    body_h = {
      q_1: '好きなスポーツを記入してください',
      q_2: 'よく飲むお酒を選択してください（複数回答可）',
      q_3: 'あなたの性別を選択してください',
      q_4: 'あなたの年齢を選択してください',
      q_5: 'このアンケートはどこでお知りになりましたか'
    }
    choice_h = {
      q_1: nil,
      q_2: %w(
        お酒は飲まない
        ビール
        日本酒
        焼酎
        赤ワイン
        白ワイン
        カクテル
        ウイスキー
      ),
      q_3: %w(男性 女性),
      q_4: %w(20～29歳 30～39歳 40～49歳 50～59歳 60歳以上),
      q_5: nil
    }
    require_h = {
      q_1: true,
      q_2: true,
      q_3: true,
      q_4: true,
      q_5: false
    }
    (1..5).each do |n|
      question_list << Question.new(
        question_number: "q_#{n}",
        body: body_h["q_#{n}".to_sym],
        type: type_h["q_#{n}".to_sym],
        choices: choice_h["q_#{n}".to_sym],
        required_column: require_h["q_#{n}".to_sym]
      )
    end

    enquete.questions = question_list
    enquete.save!

    render text: "completed"
  end

  # PUT /enquetes/1
  # PUT /enquetes/1.json
  def update
    @enquete = Enquete.find(params[:id])

    respond_to do |format|
      if @enquete.update_attributes(params[:enquete])
        format.html { redirect_to @enquete, notice: 'Enquete was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @enquete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enquetes/1
  # DELETE /enquetes/1.json
  def destroy
    @enquete = Enquete.find(params[:id])
    @enquete.destroy

    respond_to do |format|
      format.html { redirect_to enquetes_url }
      format.json { head :no_content }
    end
  end
end

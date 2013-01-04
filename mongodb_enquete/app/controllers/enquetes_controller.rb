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

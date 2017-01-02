class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  #before_filter :authenticate_user!

  #before_action :authenticate_user! , only: [:show, :edit]
  load_and_authorize_resource except: [:store_index, :index]
  # GET /stores
  # GET /stores.json
  def index
    if params[:search]
      @stores = Store.search_result(params[:search])
    else    
      @stores = Store.all.order(:region_id)
    end  

    if (params[:search].present? && @stores.empty? )
      flash[:notice] = "Sorry! There are no stores in this region"
    elsif (params[:search].present? && !@stores.empty?)
      flash[:notice] = "Search results"       
    end  
  end

  def store_index 
    if params[:search]
      @stores = Store.search_result(params[:search]) 
    else
      @stores = Store.all.order(:region_id)
    end 

    if (params[:search].present? && @stores.empty? )
      flash[:notice] = "Sorry! There are no stores in this region"
    elsif (params[:search].present? && !@stores.empty?)
      flash[:notice] = "Search results"  
    end 

    # respond_to do |format|
    #   if !@stores.empty?
    #     format.html
    #   else
    #     format.html { redirect_to root_path }  
    #   end
    # end   
  end  

  # GET /stores/1
  # GET /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    @store = Store.new
    1.times { @store.addresses.build}
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)
    respond_to do |format|
     # binding.pry
      if @store.save
        format.html { redirect_to stores_path, notice: 'Store was successfully created.' }
        format.json { render :show, status: :created, location: @store }
        format.js{}
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
        format.js{}
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to stores_path, notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name, :ph_num, :website, :tags ,:region_id, :zipcode_id, :address_id, addresses_attributes: [:id, :street1, :street2, :region_id, :zipcode_id,:_destroy])
    end
end

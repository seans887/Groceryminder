class GroceriesController < ApplicationController
  
  respond_to :html, :js
  
  before_filter :require_login
  # before_filter :get_list_id, :only => [:create, :update]
  
  # GET /groceries
  # GET /groceries.json
  def index
    @groceries = Grocery.all
        
    respond_with(@groceries)
  end
  
  # GET /groceries/1
  # GET /groceries/1.json
  def show
    @grocery = Grocery.find(params[:id])
    
    respond_with(@grocery)
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render :json => @grocery }
    # end
  end

  # POST /groceries
  # POST /groceries.json
  def create
    @list = List.find(params[:grocery][:list_id])
    @grocery = Grocery.new(params[:grocery].slice(:grocery_name, :unit_increment, :unit, :current_amount, :unit_of_time_estimated))
    @grocery.list_id = @list.id
    # @grocery.use_per_day_estimate = calc_use_per_day(params[:grocery][:unit_increment], params[:grocery][:number_of_days], params[:grocery][:unit_of_time_estimated])
    
    # if @grocery.save
    #       flash[:notice] = 'Grocery was successfully created.'
    #     else
    #       flash[:notice] = 'Error creating grocery.'
    #     end
    @grocery.save
    respond_with(@grocery)
  end

  # PUT /groceries/1
  # PUT /groceries/1.json
  def update
    @grocery = Grocery.find(params[:id])

    # respond_to do |format|
      if @grocery.update_attributes(params[:grocery])
        flash[:notice] = 'Grocery was successfully updated.'
        # format.html { redirect_to @grocery, :notice => 'Grocery was successfully updated.' }
        # format.json { head :no_content }
      else
        flash[:notice] = 'Error updating grocery.'
        # format.html { render :action => "edit" }
        # format.json { render :json => @grocery.errors, :status => :unprocessable_entity }
      end
      respond_with(@grocery)
    # end
  end

  # DELETE /groceries/1
  # DELETE /groceries/1.json
  def destroy
    @grocery = Grocery.find(params[:id])
    @grocery.destroy
    
    redirect_to groceries_url
    # respond_to do |format|
    #   format.html { redirect_to groceries_url }
    #   format.json { head :no_content }
    # end
  end
  
  protected    
    def get_list_id
      @list = current_user.lists.find(params[:id])
    end
    
  protected    
    def calc_use_per_day(total_amount, num_days, unit_of_time)
      total_amount.to_i
      num_days.to_i
      unit_of_time.to_i
      logger.debug(total_amount)
      logger.debug(num_days)
      logger.debug(unit_of_time)
      total_time = num_days * unit_of_time
      use_per_day = total_amount / total_time
      use_per_day
    end
end
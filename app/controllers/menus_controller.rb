class MenusController < ApplicationController

  before_action :set_menu, only: %i[ show edit update destroy ]
  #http_basic_authenticate_with name: "menu", password: "secret", except: [:index, :show]
   before_action :authenticate_user!,  except: [:index, :show]


  # GET /menus or /menus.json
  def index
    @menus = Menu.all
  end

  # GET /menus/1 or /menus/1.json
  def show
    @menu = Menu.find(params[:id])
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
    @menu = Menu.find(params[:id])
  end

  # POST /menus or /menus.json
  def create
    @menu = Menu.new(menu_params)

    # if @menu.save
    #   redirect_to @menu
    # else
    #   render :new, status: :unprocessable_entity
    # end

    respond_to do |format|
      if @menu.save
        format.html { redirect_to menu_url(@menu), notice: "Menu was successfully created." }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1 or /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to menu_url(@menu), notice: "Menu was successfully updated." }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
    #====================================================================
    # @menu = Menu.find(params[:id])

    # if @menu.update(menu_params)
    #   redirect_to @menu
    # else
    #   render :edit, status: :unprocessable_entity
    # end
    #====================================================================
  end

  # DELETE /menus/1 or /menus/1.json
  def destroy
    @menu.destroy

    #===================================================
    # @menu = Menu.find(params[:id])
    # @menu.destroy

    # redirect_to root_path, status: :see_other
    #===================================================
    
      respond_to do |format|
      format.html { redirect_to menus_url, notice: "Menu was successfully destroyed." }
      format.json { head :no_content }
      #===================================================
      
      #===================================================
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_params
      params.require(:menu).permit(:title, :body, :price, :user_id, :status)
    end
end

class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /addresses
  # GET /addresses.json
  def index
    @user = User.find(current_user.id.to_s)
    @addresses = @user.addresses
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
    @state_id = @address.state_id
    @state = State.find(@state_id)
    @country_id = @state.country_id
    @country = Country.find(@country_id)
  end

  # GET /addresses/new
  def new
    @address = Address.new
    @country = Country.where(is_Active: true)
  end

  # GET /addresses/1/edit
  def edit
    @country = Country.where(is_Active: true)
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @user = User.find(current_user.id)
    @state = State.find(params[:name])
    @address = @state.addresses.create(address_params)
    @user.addresses << @address
    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def get_states
    @country = Country.find(params[:id])
    @state = @country.states.where(is_Active: true)
  render json: @state
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:firstName,:lastName,:email,:phoneNo,:address1, :address2,:street,:city,:zipCode)
    end
end

class ExhibitsController < ApplicationController
  before_filter :user_in_wedding_party, only: [:new, :edit, :create, :update]

  def index
    @exhibit = Exhibit.first_visible_exhibit
    render "show"
  end

  def show
    begin
      @exhibit = Exhibit.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @exhibit = Missing::Exhibit.new
    end

    respond_to do |wants|
      wants.html # show.html.slim
      wants.xml  { render :xml => @exhibit }
    end
  end

  def new
    @exhibit = Exhibit.new
    render "edit"
  end

  def create
    @exhibit = Exhibit.new(exhibit_params)

    respond_to do |wants|
      if @exhibit.save
        flash[:notice] = 'Exhibit was successfully created.'
        wants.html { redirect_to(@exhibit) }
        wants.xml  { render :xml => @exhibit, :status => :created, :location => @exhibit }
      else
        flash.now[:errors] = @exhibit.errors.full_messages
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @exhibit.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @exhibit = Exhibit.friendly.find(params[:id])
  end

  def update
    @exhibit = Exhibit.friendly.find(params[:id])

    respond_to do |type|
      if @exhibit.update_attributes(exhibit_params)
        flash[:notice] = 'Exhibit was successfully updated.'
        type.html { redirect_to(@exhibit) }
        type.xml  { head :ok }
      else
        flash.now[:errors] = @exhibit.errors.full_messages
        type.html { render :action => "edit" }
        type.xml  { render :xml => @exhibit.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

  def exhibit_params
    params.require(:exhibit).permit(:title, :body, :picture_url, :order, :enable)
  end

  def user_in_wedding_party
    redirect_to new_user_session_path unless current_user.present?
    redirect_to exhibits_path if current_user.present? && !current_user.in_wedding_party?
  end
end

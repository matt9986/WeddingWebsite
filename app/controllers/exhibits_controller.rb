class ExhibitsController < ApplicationController
  def index
    render "index"
  end

  def show
    @exhibit = Exhibit.find(params[:id])

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
    @exhibit = Exhibit.find(params[:id])
  end

  def update
    @exhibit = Exhibit.find(params[:id])

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
end

class WidgetsController < ApplicationController
  # GET /widgets
  # GET /widgets.json

  def index

  if params[:tag]
    @widgets = Widget.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 22)
  else

    @widgets = Widget.order(order).paginate(:page => params[:page], :per_page => 22)
  end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @widgets }
    end
  end

  # GET /widgets/1
  # GET /widgets/1.json
  def show
    @widget = Widget.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @widget }
    end
  end

  # GET /widgets/new
  # GET /widgets/new.json
  def new
    @widget = Widget.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @widget }
    end
  end

  # GET /widgets/1/edit
  def edit
    @widget = Widget.find(params[:id])
    authorize! :edit, @widget
  end

  # POST /widgets
  # POST /widgets.json
  def create
    @widget = Widget.new(params[:widget])

    @widget.user = current_user
    @widget.username = current_user.username


    @widget.populate!

    respond_to do |format|
      if @widget.save
        format.html { redirect_to @widget, notice: 'Widget was successfully created.' }
        format.json { render json: @widget, status: :created, location: @widget }
      else
        format.html { render action: "new" }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /widgets/1
  # PUT /widgets/1.json
  def update
    authorize! :update, @widget
    @widget = Widget.find(params[:id])

    respond_to do |format|
      if @widget.update_attributes(params[:widget])
        format.html { redirect_to @widget, notice: 'Widget was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /widgets/1
  # DELETE /widgets/1.json
  def destroy
    @widget = Widget.find(params[:id])
    authorize! :destroy, @widget
    @widget.destroy

    respond_to do |format|
      format.html { redirect_to widgets_url }
      format.json { head :no_content }
    end
  end

  def like
    @widget = Widget.find(params[:id])
    @widget.liked_by current_user
    redirect_to @widget
  end


  def unlike
    @widget = Widget.find(params[:id])
    @widget.unliked_by current_user
    redirect_to @widget
  end

  

  def order

    ordering = case params[:order]
    when 'newest'
      'created_at'
    else
      'created_at'
    end

    ordering = case params[:order_by]
    when 'desc'
      ordering + ' DESC'
    when 'asc'
      ordering + ' ASC'
    else
      ordering + ' DESC'
    end

    ordering
  end

  

end

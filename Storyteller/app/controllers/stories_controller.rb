class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy, :like]
  before_action :load_activities, only: [:index, :show, :new, :edit]

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.order('created_at DESC')
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to root_path, flash: {success: 'Your story was added!'} }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to root_path, flash: {success: 'The Story was edited'} }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    if @story.destroy
      flash[:success] = 'The story was deleted!'
    else
      flash[:error] = 'Cannot delete this story...'
    end
    redirect_to root_path
  end

  def like
    without_tracking { @story.increment!(:likes) }
    @story.create_activity :like
    flash[:success] = 'Thanks for sharing your opinion!'
    redirect_to story_path(@story)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def without_tracking
    Story.public_activity_off
    yield if block_given?
    Story.public_activity_on
  end

  def set_story
    @story = Story.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def story_params
    params.require(:story).permit(:title, :body, :user_id)
  end

  def load_activities
    @activities = PublicActivity::Activity.order('created_at DESC').limit(20)
  end
end

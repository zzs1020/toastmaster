class TempagendasController < ApplicationController
  before_action :logged_in_user

  def index
    @tempagendas = Tempagenda.paginate(page: params[:page])
  end

  def show
    @tempagenda = Tempagenda.find(params[:id])
  end

  def new
    @tempagenda = Tempagenda.new
  end

  def create
    @tempagenda = Tempagenda.new(tempagenda_params)
    if @tempagenda.save
      flash[:success] = 'agenda saved!'
      redirect_to edit_tempagenda_path(@tempagenda)
    else
      render 'new'
    end
  end

  def edit
    @tempagenda = Tempagenda.find(params[:id])
  end

  def update
    @tempagenda = Tempagenda.find(params[:id])
    if @tempagenda.update_attributes(tempagenda_params)
      flash[:success] = 'Agenda updated'
      render 'edit'
    else
      render 'edit'
    end
  end

  private
    def tempagenda_params
      params.require(:tempagenda).permit(:welcomer, :toastmaster, :wordmaster, :timer_m, :humorist, :speaker1, :speaker2,
                                         :speaker3, :speaker4, :topicmaster, :generaleva, :evaluator1, :evaluator2,
                                         :evaluator3, :evaluator4, :notes, :for_date)
    end
end

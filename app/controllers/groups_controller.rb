class GroupsController < ApplicationController
  before_action :set_group, only: [:show]
  before_action :group_params, only: [:create, :update]


  def index
    @groups = Group.all
    @groups = Group.page(params[:page]).per(9)
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    # binding.pry
    @group = Group.new(group_params)
    if @group.save
      redirect_to "/groups/#{@group}"
    else
      render :new
    end
  end

  def show
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_path, notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  def join
    @group = Group.find(params[:id])
    @group.users << current_user
    if @group.save
      redirect_to group_path
    else
      render :show, notice: 'すでに参加してます'
    end
  end

  def mygroup
    @mygroups = current_user.groups
    @mygroups = current_user.groups.page(params[:page]).per(9)
  end

  def search
    @group = Group.search(params[:keyword])
    @groups = @group.page(params[:page]).per(9)
  end


  private
  def group_params
    params.require(:group).permit(:name, :info, :image, users_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end

end
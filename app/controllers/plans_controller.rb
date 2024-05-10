class PlansController < ApplicationController
  def index
    if params[:date].present?
      @start_date = Date.parse(params[:date])
    else
      @start_date = Date.today.beginning_of_week
    end
    @end_date = @start_date.end_of_week
    @plans = Plan.where("start_time >= ?-'9:00:00' or plan_date >= ?", @start_date, @start_date)
                 .where("finish_time <= ?'23:59:59' or plan_date <= ?", @end_date, @end_date)
                 .order(fulltime_flag: :desc, start_time: :asc)
  end

  def new
    @transition_path = root_path
    if params[:back_path]
      @transition_path = params[:back_path]
    end
    @plan = Plan.new
    if params[:new_date].present?
      d = Time.parse(params[:new_date])
      @plan.start_time = d.strftime("%Y-%m-%dT09:00")
      @plan.finish_time = d.strftime("%Y-%m-%dT10:00")
      @plan.plan_date = d.strftime("%Y-%m-%d")
    else
      @plan.start_time = Date.today.strftime("%Y-%m-%dT09:00")
      @plan.finish_time = Date.today.strftime("%Y-%m-%dT10:00")
      @plan.plan_date = Date.today.strftime("%Y-%m-%d")
    end
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to session[:previous_url]
    else
      render :new
    end
  end

  def edit
    @transition_path = root_path
    if params[:back_path]
      @transition_path = params[:back_path]
    end
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to session[:previous_url]
    else
      render :edit
    end
  end

  def show
    @transition_path = root_path
    if params[:back_path]
      @transition_path = params[:back_path]
    end
    @plan = Plan.find(params[:id])
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to plans_path
  end

  # 重要予定一覧画面
  def important
    if params[:date].present?
      @date = Date.parse(params[:date])
    else
      @date = Date.today
    end
    @plans = Plan.where("start_time >= ? or plan_date >= ?", @date.beginning_of_month, @date.beginning_of_month)
                 .where("finish_time <= ? or plan_date <= ?", @date.end_of_month, @date.end_of_month)
                 .where(must_flag: true)
                 .order(start_time: :asc)
                 .order(plan_date: :asc)
    @current_ym = @date.strftime("%Y/%m")
  end

  def report
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @orders = Order.where(updated_at: @month.all_week)
  end
  private
  def plan_params
    params.require(:plan).permit(:title, :fulltime_flag, :start_time, :finish_time, :plan_date, :must_flag, :content)
  end
end

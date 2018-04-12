class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:dashboard, :calendar]
  protect_from_forgery with: :exception

  # GET /
  def home
  end

  # GET /dashboard
  def dashboard
    @week = Date.today.strftime('%V').to_i
    @week = params[:week].to_i if params[:week]

    @year = Date.today.year
    @year = params[:year].to_i if params[:year]

    # Generate link to previous week
    if @week == 1
      previous_year = @year - 1
      prev_year_last_week = weeks_count(previous_year)
      @prev_path = (previous_year == Date.today.year && prev_year_last_week == Date.today.strftime('%V').to_i) ? dashboard_path : dashboard_path(year: previous_year, week: prev_year_last_week)
    else
      previous_week = @week - 1
      @prev_path = (Date.today.year && previous_week == Date.today.strftime('%V').to_i) ? dashboard_path : dashboard_path(year: @year, week: previous_week)
    end

    # Generate link to next week
    curr_year_last_week = weeks_count(@year)
    if @week == curr_year_last_week
      next_year = @year + 1
      @next_path = (next_year == Date.today.year && Date.today.strftime('%V').to_i == 1) ? dashboard_path : dashboard_path(year: next_year, week: 1)
    else
      next_week = @week + 1
      @next_path = (@year == Date.today.year && next_week == Date.today.strftime('%V').to_i) ? dashboard_path : dashboard_path(year: @year, week: next_week)
    end

    begin
      @start_week = Date.commercial(@year, @week, 1).strftime("%d/%m/%Y").to_s
      @end_week = Date.commercial(@year, @week, 7).strftime("%d/%m/%Y").to_s
    rescue
      # Invalid Date
      redirect_to dashboard_path
    end

    @my_planifications = current_user.planifications

    @seed_planifications = @my_planifications.where(seed_week: @week, year: @year)

    @harvest_planifications = @my_planifications.select { |p|
      p.harvest_week == @week && p.harvest_year == @year
    }

    @growing_planifications = @my_planifications.select { |p|
      if p.year == p.harvest_year
        p.seed_week < @week && p.harvest_week > @week
      else
        (p.year == @year && p.seed_week < @week) || (p.harvest_year == @year && p.harvest_week > @week)
      end
    }
  end

  # GET /calendar
  def calendar
  end

  def weeks_count(year)
    last_day = Date.new(year).end_of_year
    if last_day.cweek == 1
      last_day.prev_week.cweek
    else
      last_day.cweek
    end
  end

end

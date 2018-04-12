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
    @prev_path = get_previous_week_path(@week, @year)
    # Generate link to next week
    @next_path = get_next_week_path(@week, @year)

    begin
      @start_week = Date.commercial(@year, @week, 1).strftime("%d/%m/%Y").to_s
      @end_week = Date.commercial(@year, @week, 7).strftime("%d/%m/%Y").to_s
    rescue
      # Invalid Date
      redirect_to dashboard_path
    end

    @my_planifications = current_user.planifications
    @current_grouped_planifications = group_planifications(@my_planifications, @week, @year)

    first_month = Date.commercial(@year, @week, 1).month
    month_counter = first_month
    week_of_first_day_of_month = Date.new(@year, first_month, 1).strftime("%V").to_i

    if Date.commercial(@year, week_of_first_day_of_month, 4).month == @month
      first_week = week_of_first_day_of_month
    else
      first_week = week_of_first_day_of_month + 1
      first_week = 1 if first_week > 51
    end

    cal_week = first_week
    cal_month = first_month
    cal_year = @year
    @trim_calendar = {}

    for i in 1..3 do
      while Date.commercial(cal_year, cal_week, 4).month == cal_month do
        @trim_calendar[cal_year] ||= {}
        @trim_calendar[cal_year][cal_month] ||= {}
        @trim_calendar[cal_year][cal_month][cal_week] ||= {}

        grouped_plans = group_planifications(@my_planifications, cal_week, cal_year)
        @trim_calendar[cal_year][cal_month][cal_week][:seed] = grouped_plans[:seed]
        @trim_calendar[cal_year][cal_month][cal_week][:harvest] = grouped_plans[:harvest]

        cal_week = Date.commercial(cal_year, cal_week, 1).next_week.cweek
      end
      cal_month = Date.new(cal_year, cal_month, 1).next_month.month
      cal_year += 1 if cal_month == 1
    end

  end

  # GET /calendar
  def calendar
  end

  private

  def weeks_count(year)
    last_day = Date.new(year).end_of_year
    if last_day.cweek == 1
      last_day.prev_week.cweek
    else
      last_day.cweek
    end
  end

  def get_previous_week_path(week, year)
    if week == 1
      previous_year = year - 1
      prev_year_last_week = weeks_count(previous_year)

      prev_path = (previous_year == Date.today.year && prev_year_last_week == Date.today.strftime('%V').to_i) ? dashboard_path : dashboard_path(year: previous_year, week: prev_year_last_week)
    else
      previous_week = week - 1

      prev_path = (Date.today.year && previous_week == Date.today.strftime('%V').to_i) ? dashboard_path : dashboard_path(year: year, week: previous_week)
    end

    return prev_path
  end

  def get_next_week_path(week, year)
    curr_year_last_week = weeks_count(year)
    if week == curr_year_last_week
      next_year = year + 1

      next_path = (next_year == Date.today.year && Date.today.strftime('%V').to_i == 1) ? dashboard_path : dashboard_path(year: next_year, week: 1)
    else
      next_week = week + 1

      next_path = (year == Date.today.year && next_week == Date.today.strftime('%V').to_i) ? dashboard_path : dashboard_path(year: year, week: next_week)
    end

    return next_path
  end

  def group_planifications(planifications, week, year)
    grouped_plans = {}

    grouped_plans[:seed] = planifications.where(seed_week: week, year: year)

    grouped_plans[:harvest] = planifications.select { |p|
      p.harvest_week == week && p.harvest_year == year
    }

    grouped_plans[:growing] = planifications.select { |p|
      if p.year == p.harvest_year
        p.seed_week < week && p.harvest_week > week
      else
        (p.year == year && p.seed_week < week) || (p.harvest_year == year && p.harvest_week > week)
      end
    }

    return grouped_plans
  end

end

class Planification < ApplicationRecord
  belongs_to :user
  belongs_to :plant

  def harvest_week
    week = self.seed_week + self.plant.growth_time
    year_weeks = weeks_count(self.year)
    if week / year_weeks > 1
      return week % year_weeks + 1
    else
      return week
    end
  end

  def harvest_year
    if seed_week > harvest_week
      return self.year + 1
    else
      return self.year
    end
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

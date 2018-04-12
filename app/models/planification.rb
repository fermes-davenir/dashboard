class Planification < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  include PlantsHelper

  def harvest_week
    week = self.seed_week + self.plant.growth_time
    year_weeks = weeks_count(self.year)
    if week.to_f / year_weeks.to_f > 1
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
end

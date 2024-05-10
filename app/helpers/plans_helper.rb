module PlansHelper
  def change_class(one_day_plans)
    if one_day_plans.any? { |plan| plan.must_flag }
      return "mustplan"
    else
      return "mb-0"
    end
  end

  def make_one_day_plans(plans, day)
    return plans.select do |plan|
      if plan.fulltime_flag
        plan.plan_date.to_date == day
      else
        plan.start_time.to_date == day
      end
    end
  end

  def change_time(plan)
    if plan.fulltime_flag
      return "終日"
    else
      return plan.start_time.strftime('%H:%M')
    end
  end
end

module Admin::BadgesHelper

  def rule_type
    Badge::RULE.map{ |rule| [t(".#{rule}"), rule] }
  end

end

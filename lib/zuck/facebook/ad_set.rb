require 'zuck/facebook/ad_creative'

module Zuck
  class AdSet < RawFbObject

    # Known keys as per
    # [fb docs](https://developers.facebook.com/docs/reference/ads-api/adset/v2.4)
    ## Note: Ad Set vs. Ad Campaign
    ## Prior to July 2014 ad sets were referred to as 'campaigns'. When using ad
    ## sets in API calls the parameter may be referred to as 'adcampaign'. A
    ## campaign contains one or more ad sets.
    known_keys :id,
               :name,
               :account_id,
               :bid_amount,
               :bid_info,
               :buying_type,
               :campaign_group_id, #DEPRECATED
               :created_time,
               :end_time,
               :frequency_cap,
               :frequency_cap_reset_period,
               :is_autobid,
               :lifetime_fequency_cap,
               :lifetime_imps,
               :optimization_goal,
               :product_ad_behavior,
               :promoted_object,
               :rf_prediction_id,
               :rtb_flag,
               :start_time,
               :targeting,
               :updated_time,
               :pacing_type,
               :budget_remaining,
               :daily_budget,
               :lifetime_budget

    parent_object :ad_account, as: :account_id
    list_path     :adcampaigns # Yes, this is correct, "for legacy reasons"
    connections   :ad_groups, :ad_creatives, :insights

  end
end

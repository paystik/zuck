require 'zuck/facebook/ad_creative'

module Zuck
  class AdSet < RawFbObject
    # 3rd level container object
    # An ad set is a group of ads.
    # Known keys as per
    # [fb docs](https://developers.facebook.com/docs/marketing-api/reference/ad-campaign/)
    known_keys :adlables,
               :adset_schedule,
               :id,
               :account_id,
               :bid_amount,
               :bid_info,
               :billing_event,     #Possible values are APP_INSTALLS, CLICKS, IMPRESSIONS, LINK_CLICKS, OFFER_CLAIMS, PAGE_LIKES, POST_ENGAGEMENT, VIDEO_VIEWS.
               :campaign,          #The campaign that contains this ad set
               :campaign_id,
               :configured_status, #Possible values are ACTIVE, PAUSED, ARCHIVED, DELETED.
               :created_time,
               :creative_sequence, #Order of the adgroup sequence to be shown to users
               :effective_status,  #Possible values are ACTIVE, PAUSED, ARCHIVED, DELETED, CAMPAIGN_PAUSED.
               :end_time,
               :frequency_cap,
               :frequency_cap_reset_period,
               :is_autobid,        #Did the advertiser express the intent to bid automatically. This field is not available if bid_info or bid_amount is returned.
               :lifetime_fequency_cap,
               :lifetime_imps,
               :name,
               :optimization_goal, #NONE, APP_INSTALLS, BRAND_AWARENESS, CLICKS, ENGAGED_USERS, EXTERNAL, EVENT_RESPONSES, IMPRESSIONS, LINK_CLICKS, OFFER_CLAIMS, OFFSITE_CONVERSIONS, PAGE_ENGAGEMENT, PAGE_LIKES, POST_ENGAGEMENT, REACH, SOCIAL_IMPRESSIONS, VIDEO_VIEWS
               :product_ad_behavior,
               :promoted_object,
               :rf_prediction_id,
               :rtb_flag,
               :start_time,
               :targeting,
               :updated_time,
               :use_new_app_click, #If set, allows Mobile App Engagement ads to optimize for LINK_CLICKS
               :pacing_type,
               :budget_remaining,
               :daily_budget,
               :lifetime_budget

    parent_object :ad_account, as: :account_id
    list_path     :adsets
    connections   :ad_groups, :ad_creatives, :insights
    #TODO: add connections where appropriate for
    # activitities,    NEEDS research
    # adcreatives,     EXISTS as :ad_creatives
    # ads,             EXISTS as :ad_groups
    # asyncadrequests, NEEDS research
    # reachestimate,   NEEDS research
    # targeting_sentencelines, NEEDS research
    # insights,        EXISTS
    # conversions,     NEEDS research
    # stats            NEEDS research

  end
end

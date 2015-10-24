require 'zuck/facebook/ad_creative'

module Zuck
  class AdSet < RawFbObject
    # 3rd level container object
    # An ad set is a group of ads.
    # Known keys as per
    # [fb docs](https://developers.facebook.com/docs/marketing-api/reference/ad-campaign/)
    known_keys :adlabels,
               :adset_schedule,    #Ad set schedule, representing a delivery schedule for a single day
               :id,
               :account_id,        #Ad Account ID
               :bid_amount,        #Bid amount for this ad set, defined as your true value bid based on optimization_goal. This field is not available if is_autobid is true or when bid_info is returned.
               :bid_info,          #Map of bid objective to bid value. This field is not available if is_autobid is true.
               :billing_event,     #Possible values are APP_INSTALLS, CLICKS, IMPRESSIONS, LINK_CLICKS, OFFER_CLAIMS, PAGE_LIKES, POST_ENGAGEMENT, VIDEO_VIEWS.
               :campaign_id,       #parent campaign that contains this ad set
               :configured_status, #Possible values are ACTIVE, PAUSED, ARCHIVED, DELETED.
               :created_time,
               :creative_sequence, #Order of the adgroup sequence to be shown to users
               :effective_status,  #Possible values are ACTIVE, PAUSED, ARCHIVED, DELETED, CAMPAIGN_PAUSED.
               :end_time,          #End time, in UTC UNIX timestamp
               :frequency_cap,
               :frequency_cap_reset_period,
               :is_autobid,        #Did the advertiser express the intent to bid automatically. This field is not available if bid_info or bid_amount is returned.
               :lifetime_fequency_cap,
               :lifetime_imps,     #Lifetime impressions. Available only for campaigns with buying_type=FIXED_CPM
               :name,
               :optimization_goal, #NONE, APP_INSTALLS, BRAND_AWARENESS, CLICKS, ENGAGED_USERS, EXTERNAL, EVENT_RESPONSES, IMPRESSIONS, LINK_CLICKS, OFFER_CLAIMS, OFFSITE_CONVERSIONS, PAGE_ENGAGEMENT, PAGE_LIKES, POST_ENGAGEMENT, REACH, SOCIAL_IMPRESSIONS, VIDEO_VIEWS
               :product_ad_behavior, #Option to choose between prospecting and retargeting
               :promoted_object,   #The object this ad set is promoting across all its ads.
               :rf_prediction_id,  #Reach and frequency prediction ID
               :rtb_flag,          #Whether this adset is using RTB or not
               :start_time,
               :targeting,
               :updated_time,
               :use_new_app_click, #If set, allows Mobile App Engagement ads to optimize for LINK_CLICKS
               :pacing_type,       #Defines the pacing type, standard or using ad scheduling
               :budget_remaining,  #Remaining budget
               :daily_budget,      #The daily budget of the set defined in your account currency.
               :lifetime_budget    #The lifetime budget of the set defined in your account currency.

    parent_object :campaign, as: :campaign_id
    list_path     :adsets
    connections   :ad_groups,     #The ads under this ad set
                  :ad_creatives,  #Reference document for using Facebook Marketing APIs to manage your ad creative
                  :insights       #Ad Insights API  feat. eduping across child objects, sorting, async reports.
    #TODO: add connections where appropriate for
    # activitities,            #Facebook Ads Activity Log API
    # asyncadrequests,         #Async ad requests for this ad set
    # reachestimate,           #Query for the reach estimate for a specific targeting or ad
    # targeting_sentencelines, #Object representing the human-readable description of a targeting spec
    # conversions,             #Reference document for using Facebook Marketing APIs to get conversion stats on your Facebook ads, ad sets, and accounts.
    # stats                    #Reference document for using Facebook Marketing APIs to get ad statistics on impressions, clicks, performance, and more

    #look what I learned over in ad_group
    def self.create(graph, data, campaign)
      path = campaign.ad_account.path
      data['account_id'] = campaign.account_id
      data['campaign_id'] = campaign.id
      super(graph, data, campaign, path)
    end

    def ad_account
      if campaign
        campaign.ad_account
      elsif account_id
        AdAccount.find( account_id )
      end
    end

  end
end

module Zuck
  class Campaign < RawFbObject
    # 2nd level container object
    # A campaign is a grouping of ad sets which are organized by the same business objective. Each campaign has an objective that must be valid across the ad sets within that campaign.
    # https://developers.facebook.com/docs/marketing-api/reference/ad-campaign-group
    known_keys :id,                #graph id
               :adlabels,          #Ad Labels associated with this campaign
               :account_id,        #ID of the ad account that owns this campaign
               :buying_type,       #AUCTION(default) or RESERVED
               :can_use_spend_cap, #Whether the campaign can set the spend cap
               :configured_status, #ACTIVE, PAUSED, ARCHIVED, DELETED
               :created_time,      #duh
               :effective_status,  #ACTIVE, PAUSED, ARCHIVED, DELETED
               :name,              #guess
               :objective,         #WEBSITE_CLICKS
               :start_time,        #start ads
               :stop_time,         #stop ads
               :updated_time,      #last change
               :spend_cap          #A spend cap for the campaign, such that it will not spend more than this cap. (in cents)

    parent_object :ad_account, as: :account_id
    list_path :campaigns
    connections  :ad_sets, :insights, :ad_groups #, :stats

    # allowed update params:
    #   name
    #   objective
    #   status
    #   spend_cap
    #   execution_options
    #   adlabels
  end
end

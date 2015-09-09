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
               :campaign_group_id,
               :start_time,
               :updated_time,
               :created_time,
               :promoted_object

    parent_object :ad_account, as: :account_id
    list_path     :adcampaigns # Yes, this is correct, "for legacy reasons"
    connections   :ad_groups, :ad_creatives

  end
end

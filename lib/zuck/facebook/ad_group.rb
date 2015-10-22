require 'zuck/facebook/ad_creative'

module Zuck
  class AdGroup < RawFbObject

    # Known keys as per
    # [fb docs](https://developers.facebook.com/docs/marketing-api/reference/adgroup)
    known_keys :id,
               :account_id,
               :adset,
               :campaign,
               :adset_id,
               :campaign_group_id,
               :adlabels,
               :adset_id,
               :bid_amount,
               :bid_info,
               :bid_type,
               :configured_status, #Possible values are ACTIVE, PAUSED, ARCHIVED, DELETED.
               :conversion_specs,
               :created_time,
               :creative,
               :effective_status, #Possible values are ACTIVE, PAUSED, ARCHIVED, DELETED, CAMPAIGN_PAUSED, ADSET_PAUSED, PENDING_REVIEW, DISAPPROVED, PREAPPROVED, PENDING_BILLING_INFO
               :last_updated_by_app_id,
               :name,
               :tracking_specs,
               :updated_time

    parent_object :ad_set, as: :adset_id
    list_path     :ads
    connections   :ad_creatives, :insights
    #TODO: All edges from https://developers.facebook.com/docs/marketing-api/reference/adgroup
    # :leads,                  NEEDS research
    # :adcreatives,            EXISTS as :ad_creatives
    # :keywordstats,           NEEDS research
    # :previews,               NEEDS research
    # :reachestimate,          NEEDS research
    # :targetingsentencelines, NEEDS research
    # :insights                EXISTS


    # Allowed Ad create params
    # :adset_id
    # :campaign_group_id
    # :date_format
    # :creative
    # :name
    # :status
    # :tracking_specs
    # :display_sequence
    # :execution_options
    # :adlabels
    # :bid_amount
    # :redownload
    def self.create(graph, data, ad_set)
      path = ad_set.ad_account.path
      data['adset_id'] = ad_set.id
      data['campaign_group_id'] = ad_set.campaign_id
      super(graph, data, ad_set, path)
    end

  end
end

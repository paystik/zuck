require 'zuck/facebook/ad_creative'

module Zuck
  class AdGroup < RawFbObject
    # 4th level container
    # Known keys as per
    # [fb docs](https://developers.facebook.com/docs/marketing-api/reference/adgroup)
    known_keys :id,
               :account_id,        #Ad Account ID
               :adset_id,          #Ad Set ID
               # :campaign_group_id, #deprecated on read Campaign ID
               :campaign_id,      #Campaign ID
               :adlabels,
               :bid_amount,        #Bid amount for this ad set, defined as your true value bid based on optimization_goal. This field is not available if is_autobid is true or when bid_info is returned.
               :bid_info,          #Map of bid objective to bid value. This field is not available if is_autobid is true.
               :bid_type,          #Possible values are CPC, CPM, MULTI_PREMIUM, ABSOLUTE_OCPM, CPA
               :configured_status, #Possible values are ACTIVE, PAUSED, ARCHIVED, DELETED.
               :conversion_specs,
               :created_time,
               :effective_status, #Possible values are ACTIVE, PAUSED, ARCHIVED, DELETED, CAMPAIGN_PAUSED, ADSET_PAUSED, PENDING_REVIEW, DISAPPROVED, PREAPPROVED, PENDING_BILLING_INFO
               :last_updated_by_app_id,
               :name,
               :tracking_specs,
               :updated_time

    parent_object :ad_set, as: :adset_id
    list_path     :ads
    connections   :ad_creatives, #Creative associated with this ad
                  :insights,     #A Statistics result for an Ad object
                  :previews      #Preview of the ad
    #TODO: Remaining edges from https://developers.facebook.com/docs/marketing-api/reference/adgroup
    # :leads,                  #Leads submitted for this ad
    # :keywordstats,           #Stats of keywords of this ad
    # :reachestimate,          #Reach Estimation
    # :targetingsentencelines, #The targeting description sentence for this ad


    # Allowed Ad create params
    # :adset_id            #extract from parent
    # :campaign_group_id   #extract from parent
    # :date_format         #optional
    # :creative            #required, new as JSON or Existing as {"creative_id": <CREATIVE_ID>}
    # :name                #required
    # :status              #ACTIVE(def) or PAUSED, upon create gets set to PENDING_REVIEW before reverting to selection
    # :tracking_specs      #optional
    # :display_sequence    #The sequence of the ad within the same campaign
    # :execution_options   #optional, Possible values are VALIDATE_ONLY, INCLUDE_WARNINGS
    # :adlabels            #optional
    # :bid_amount          #optional
    def self.create(graph, data, ad_set)
      path = ad_set.ad_account.path
      data[:adset_id] = ad_set.id
      # only valid on create
      data[:campaign_group_id] = ad_set.campaign_id
      # ensure ads don't start by accident
      data[:status] = 'PAUSED'
      super(graph, data, ad_set, path)
    end

    def campaign
      if ad_set
        ad_set.campaign
      elsif campaign_group_id
        AdSet.find( campaign_group_id )
      end
    end

  end
end

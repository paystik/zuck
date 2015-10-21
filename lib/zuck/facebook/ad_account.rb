module Zuck
  # Marketing API v2.5
  # https://developers.facebook.com/docs/marketing-api/reference/ad-account
  # An ad account is an account used for managing ads of Facebook. Each ad account can be managed by multiple users...
  class AdAccount < RawFbObject
    include Zuck::Helpers

    # Known keys as per reference docs Fields list
    known_keys :id,
               :account_groups,
               :account_id,
               # Status of the account 
               # 1 = ACTIVE
               # 2 = DISABLED
               # 3 = UNSETTLED
               # 7 = PENDING_RISK_REVIEW
               # 9 = IN_GRACE_PERIOD
               # 100 = PENDING_CLOSURE
               # 101 = CLOSED
               # 102 = PENDING_SETTLEMENT
               # 201 = ANY_ACTIVE
               # 202 = ANY_CLOSED
               :account_status,
               :age,
               :agency_client_declaration,
               :business_city,
               :business_country_code,
               :business_name,
               :business_state,
               :business_street,
               :business_street2,
               :business_zip,
               :capabilities,
               :created_time,
               :currency,
               # The reason why the account was disabled. Possible reasons are:
               # 0 = NONE
               # 1 = ADS_INTEGRITY_POLICY
               # 2 = ADS_IP_REVIEW
               # 3 = RISK_PAYMENT
               # 4 = GRAY_ACCOUNT_SHUT_DOWN
               :disable_reason,
               :end_advertiser,
               :end_advertiser_name,
               :failed_delivery_checks,
               :funding_source,
               :funding_source_details,
               :has_migrated_permissions,
               :io_number,
               :is_notifications_enabled,
               :is_personal,
               :is_prepay_account,
               :is_tax_id_required,
               :line_numbers,
               :media_agency,
               :min_campaign_group_spend_cap,
               :min_daily_budget,
               :name,
               :owner,
               :offsite_pixels_tos_accepted,
               :partner,
               :tax_id,
               :tax_id_status,
               :tax_id_type,
               :timezone_id,
               :timezone_name,
               :timezone_offset_hours_utc,
               :rf_spec,
               :tos_accepted,
               :user_role,
               :vertical_name,
               :amount_spent,
               # The maximum that can be spent by this account after which campaigns
               # will be paused. A value of 0 signifies no spending-cap and setting
               # a new spend cap only applies to spend AFTER the time at which you
               # set it. Value specified in basic unit of the currency, e.g. cents for USD.
               :spend_cap,
               :balance,
               :business,
               :owner_business,
               :last_used_time,
               :asset_score


    list_path   'me/adaccounts'
    connections :ad_campaigns, :ad_sets, :ad_groups, :custom_audiences, :ad_images,
      :ad_creatives
    # TODO: All edges from https://developers.facebook.com/docs/marketing-api/reference/ad-account/adcreatives/
    # :activities,              # AdActivity log for the ad account
    # :adlabels,                # labels associated with ad account
    # :adcreatives,             # all the ad creatives for this account (across campaigns)
    # :adcreativesbylabels,     # Don't Care For Now
    # :ads,               # >= v2.5, all ads for the account
    # :adimages,                # all images used in ad creatives
    # :adreportruns,            # all bookmarked async runs of the account
    # :adreportschedules,       # all scheduled reports of the account
    # :adsets,            #DCNF >= v2.5 
    # :adsbylabels,       #DCNF >= v2.5 - DCFN
    # :adsetsbylabels,    #DCNF >= v2.5 - DCFN
    # :campaigns,         #DCNF >= v2.5
    # :campaignsbylabels, #DCNF >= v2.5 - DCFN
    # :minimum_budgets,         # /minimum_budgets/ - minimum daily budget values by currency
    # targetingbrowse,          #DCFN
    # targetingsearch,          #DCFN
    # targetingsuggestions,     #DCFN
    # targetingvalidation,      #DCFN
    # transactions,             #DCFN
    # peoplesets,               # A list of AdsPeopleSet nodes
    # adspixels,                # the associated tracking pixels for the account
    # partners,                 #DCFN
    # partnercategories,        #DCFN
    # generatepreviews,         # generate previews for creative specification
    # ratecard,                 # used to create premium ads
    # advideos,                 # the videos for the account
    # asyncadrequestsets, #DCFN >= v2.5 DCFN
    # connectionobjects,        # Facebook objects with the ad account user administrates
    # broadtargetingcategories, #DCFN
    # customaudiences,          # the custom audiences owned/shared by this account
    # customaudiencestos,       # custom audiences terms of service signed by the ad account
    # reachesitmate,            #DCFN
    # reachfrequencypredictions, #DCFN
    # targetingsentencelines,   #DCFN
    # users,                    # container for User Id, permissions and role
    # offsitepixels,            #DCFN
    # applications,             # applications connected to the ad account
    # advertisable_applications, # >= v2.4
    # instagram_accounts,       #DCFN
    # roas,                     #DCFN
    # roas_cohorts,             #DCFN
    # insights                  # consolidates functionality from deprecated /stats, /conversions, and /reportstats edges

    def self.all(graph = Zuck.graph)
      super(graph)
    end

    def path
      normalize_account_id(id)
    end

    def set_data(data)
      super
      self.id = normalize_account_id(id)
    end

  end
end

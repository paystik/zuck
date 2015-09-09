module Zuck
  class Insight < RawFbObject
    # https://developers.facebook.com/docs/marketing-api/insights/v2.4#parameters
    known_keys :reach,
               :impressions,
               :clicks
    parent_object :ad_campaign
    list_path :insights
  end
end

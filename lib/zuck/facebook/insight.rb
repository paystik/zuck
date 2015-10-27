module Zuck
  class Insight < RawFbObject
    # 3rd level edge
    read_only
    # This insights edge consolidates functionality from /stats, /conversions, and /reportstats edges. It provides a single, consistent interface for insights.
    # [fb docs](https://developers.facebook.com/docs/marketing-api/insights/v2.4#fields)
    known_keys :account_id,            #ID number that is unique to your ad account.
               # :ad_id,                 #ID number that is unique to each ad.
               # :adset_id,              #ID number that is unique to each ad set.
               :campaign_id,           #ID number that is unique to each campaign.
               # name fields
               :account_name,          
               # :ad_name,
               # :adset_name,
               :campaign_name,         
               # date fields
               :date_start,            #The start date for your data.
               :date_stop,             #The end date for your data.
               # general fields
               :call_to_action_clicks, #Total number of clicks on the call to action button of the ad.
               :unique_clicks,         #The total number of unique people who have clicked on your ad. 
               :inline_link_clicks,    #Total number of clicks on links in the ad
               :cost_per_inline_link_click,      #The average cost per click on links in the ad
               :inline_post_engagement,#Total number of engagements on the post
               :cost_per_inline_post_engagement, #The average cost per engagement on the post
               :cost_per_total_action, #The average you've spent on actions.
               :cost_per_unique_click, #The average cost per unique click for these ads, calculated as the amount spent divided by the number of unique clicks received.
               :cpm,                   #The average cost you've paid to have 1,000 impressions on your ad.
               :cpp,                   #The average cost you've paid to have your ad served to 1,000 unique people.
               :ctr,                   #The number of clicks you received divided by the number of impressions.
               :website_ctr,           #An object containing the number of clicks you received on a link in the ad divided by the number of impressions broken down by action type.
               :unique_ctr,            #The number of people who clicked on your ad divided by the number of people you reached.
               :frequency,             #The average number of times your ad was served to each person.
               :impressions,           #The number of times your ad was served.
               :reach,                 #The number of people your ad was served to.
               # :relevance_score,     #BREAKS campaign.insights  #Ad relevance score is multiple metrics related to how your audience responded to your ad.
               :social_clicks,         #The number of clicks your ad receives when it's shown with social information
               :unique_social_clicks,  #The number of individuals who clicked this ad while it had social context.
               :social_impressions,    #The number of times your ad was served, with social information.
               :social_reach,          #The number of people your ad was served to with social information. 
               :spend,                 #The total amount you've spent so far.
               :total_action_value,    #The total revenue returned from conversions or Facebook credit spends that occurred on your website or app.
               :total_actions,         #The number of actions taken on your ad, Page, app or event after your ad was served to someone, even if they didn't click on it.
               :total_unique_actions,  #The number of unique people who took an action such as liking your Page or installing your app as a result of your ad.
               # action and video fields
               :action_values,
               :actions,
               :cost_per_action_type
               #video related fields
    parent_object :campaign
    list_path :insights
  end
end

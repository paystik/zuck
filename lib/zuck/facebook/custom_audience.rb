module Zuck
  require "digest/md5"
  class CustomAudience < RawFbObject
    known_keys :id,
               :name,
               :subtype, 
               :rule,
               :description,
               :opt_out_link,
               :retention_days


    parent_object :ad_account
    list_path     :customaudiences


    def emails=(emails)
      audience = emails.map{|email|
        {email_hash: Digest::MD5.hexdigest(email)}
      }
      add_users(audience, "md5")
    end

    def add_users(audience, hash_type)
      create_connection(graph, self.id, :users, {users: audience.to_json, hash_type: hash_type})
    end

  end
end
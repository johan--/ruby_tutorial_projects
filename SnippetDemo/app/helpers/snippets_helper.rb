module SnippetsHelper
  def fetch_snippets
    snippets =  $redis.get("snippets")
    if snippets.nil?
      snippets = Snippet.all.to_json
      $redis.set("snippets", snippets)
      # Expire the cache, every 5 hours
      $redis.expire("snippets",5.hour.to_i)
    end
    @snippets = JSON.load snippets
  end
end

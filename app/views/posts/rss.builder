xml.instruct! :xml, :version=>"1.0" 
xml.rss(:version=>"2.0"){
  xml.channel{
    xml.title("Eyes on your instruments")
    xml.link("http://sommer.alog.net/")
    xml.description("Shameless selfpromotion by Espen Sommer Eide")
    xml.language('en-us')
      @posts.each do |post|
        xml.item do
          xml.title(post.title)
          xml.description(post.content)
          xml.author(post.author)
          xml.pubDate(post.created_at.strftime("%a, %d %b %Y %H:%M:%S %z"))
          xml.link(post_url(:id=>post.id))
          xml.guid(post_url(:id=>post.id))
        end
      end
  }
}

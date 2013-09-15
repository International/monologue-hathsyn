Monologue::PostsRevision.class_eval do
  def content
    db_content = read_attribute(:content)
    doc = Nokogiri::HTML.fragment(CGI.unescapeHTML(String.new(db_content)))
    priv_output "Reading fragment :|#{db_content}|"
    puts "DOC=#{doc.inspect}"
    puts "CHILDREN:#{doc.children.inspect}"
    puts "RELEVANT:#{doc.children.search("[data-lang]").inspect}"

    doc.search("[data-lang]").each do |code_node|
      priv_output "found match #{code_node.inspect}"
      actual_lang = code_node["data-lang"]
      text = code_node.text
      replacement = CodeRay.scan(text, actual_lang).div
      code_node.replace(CodeRay.scan(text, actual_lang).div)
    end
    res = doc.to_html
    priv_output "Result:|#{res}|"
    res
  end


  def priv_output(msg)
    puts "Result:|#{msg}|"
    Rails.logger.info "Result:|#{msg}|"
  end
end

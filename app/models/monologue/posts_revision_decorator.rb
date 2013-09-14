Monologue::PostsRevision.class_eval do
  def content
    db_content = read_attribute(:content)
    doc = Nokogiri::HTML.fragment(db_content)
    doc.search("[data-lang]").each do |code_node|
      actual_lang = code_node["data-lang"]
      text = code_node.text
      replacement = CodeRay.scan(text, actual_lang).div
      code_node.replace(CodeRay.scan(text, actual_lang).div)
    end
    doc.to_html
  end
end

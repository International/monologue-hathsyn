module MonologueHathsyn
  class HathsynCodeFilter < HTML::Pipeline::Filter
    def call
      doc.search("[data-lang]").each do |code_node|
        puts "Found node #{code_node.text}"
        actual_lang = code_node["data-lang"]
        text = code_node.text
        replacement = CodeRay.scan(text, actual_lang).div
        puts "Replacing with #{replacement}"
        code_node.replace(CodeRay.scan(text, actual_lang).div)
      end

      doc
    end
  end
end

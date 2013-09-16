module MonologueHathsyn
  class HathsynCodeFilter < HTML::Pipeline::Filter
    def call

      doc.children.search("[data-lang]").each do |code_node|
        actual_lang = code_node["data-lang"]
        text = code_node.text
        replacement = Rails.cache.fetch([actual_lang, text].join("-")) do
          CodeRay.scan(text, actual_lang).div
        end
        code_node.replace(replacement)
      end

      doc
    end
  end
end

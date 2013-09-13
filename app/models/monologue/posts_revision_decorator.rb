Monologue::PostsRevision.class_eval do
  def content
    db_content = read_attribute(:content)
    pipeline = HTML::Pipeline.new([MonologueHathsyn::HathsynCodeFilter])
    result = pipeline.call(db_content)
    result[:output].to_s
  end
end

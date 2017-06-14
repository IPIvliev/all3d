module StaticPagesHelper
	def post_text(text)
        scrubber = Rails::Html::TargetScrubber.new
        scrubber.tags = ['img', 'p']
        html_fragment = Loofah.fragment(text)
        html_fragment.scrub!(scrubber)
        html_fragment.to_s
    end		
end

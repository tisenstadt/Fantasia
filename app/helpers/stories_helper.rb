module StoriesHelper

    def current_story(story)
        story.update_current_story(story)
    end
end

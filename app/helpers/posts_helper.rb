module PostsHelper
    def filter(tag)
      case tag
      when /^Breakfast$/
        return Post.where('time = ?','Breakfast').order('created_at DESC')
      when /^Lunch$/
        return Post.where('time = ?','Lunch').order('created_at DESC')
      when /^Dinner$/
        return Post.where('time = ?','Dinner').order('created_at DESC')
      when /^Snack$/
        return Post.where('time = ?','Snack').order('created_at DESC')
      when /^Coop$/
        return Post.where('location = ?','Coop').order('created_at DESC')
      when /^Frank$/
        return Post.where('location = ?','Frank').order('created_at DESC')
      when /^Donovan\'s Pub$/
        return Post.where('location = ?',"Donovan's Pub").order('created_at DESC')
      when /^Library Cafe$/
        return Post.where('location = ?','Library Cafe').order('created_at DESC')
      else
        return Post.all.order('created_at DESC')
      end
    end
end

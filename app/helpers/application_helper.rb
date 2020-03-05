module ApplicationHelper
    def resource_name
        :user
      end
      
      def resource
       @resource ||= User.new
      end
      
      def resource_class
       User
      end
      
      def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
      end

      def like_or_dislike_btn(post)
        like = Like.find_by(post: post, user: current_user)
        if like
          link_to('Dislike', post_like_path(id: like.id, post_id: post.id), method: :delete, class: "button")
        else
          link_to('Like', post_likes_path(post_id: post.id), method: :post, class:"button")
        end
      end
end

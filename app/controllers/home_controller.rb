class HomeController < ApplicationController
	before_filter :authenticate_user!
  def index
#  	@graph = Koala::Facebook::API.new(@current_user.token)
	### テスト用のアクセストークン
	### FacebookAppのGraph API Explorerのアクセストークン
	@graph = Koala::Facebook::API.new(ENV['FACEBOOK_ACCESS_TOKEN'])
  	@profile = @graph.get_object('me')
  	@friends = @graph.get_connections('me', 'friends', { :locale => 'ja-jp' })	# このアプリを登録している友達を取得する．
    # パラメータから人数の数値を受け取る．
    if params[:persons]
      friendnum = params[:persons].to_i
    else
      friendnum = 1
    end
  	@friends_info = []
    @friends.sort_by!{rand}   # 友達の情報が入っている配列をシャッフル
  	@friends.each_with_index do |friend, index|
      if index < friendnum
        @friends_info << {'id'=>friend['id'],'name'=>friend['name'],'picture'=>@graph.get_picture(friend['id'],:type => 'normal')}
      else
        break
      end
  	end
  end
end

class HomeController < ApplicationController
	before_filter :authenticate_user!
  def index
#  	graph = Koala::Facebook::API.new(@current_user.token)
	### テスト用のアクセストークン
	### FacebookAppのGraph API Explorerのアクセストークン
	@graph = Koala::Facebook::API.new(ENV['FACEBOOK_ACCESS_TOKEN'])
  	@profile = @graph.get_object('me')
  	@friends = @graph.get_connections('me', 'friends', { :locale => 'ja-jp' })	# このアプリを登録している友達を取得する．
  	@friends_info = []
  	@friends.each do |friend|
  		@friends_info << {'id'=>friend['id'],'name'=>friend['name'],'picture'=>@graph.get_picture(friend['id'],:type => 'normal')}
  	end
  end
end

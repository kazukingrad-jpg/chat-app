class UsersController < ApplicationController

 def edit
 end

 def update
  if current_user.update(user_params)
  # current_user→ログイン中のユーザー deviseに搭載済み
  # .updateはデータベースのレコードを更新するメソッド
  # (user_params)で更新を許可したパラメータのみ受け取る→セキュリティ対策
   redirect_to root_path
  else
   render :edit, status: :unprocessable_entity 
  end 
 end

 private

 def user_params
  params.require(:user).permit(:name, :email)
# params = 荷物が大量に届く
# require(:user) = その中から「ユーザー情報」の箱だけ開けろ
# permit(:name, :email) = 箱の中でも「触っていいもの」だけ取り出せ
# current_user.update = その内容で本人の情報を更新する
 end
end

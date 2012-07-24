class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_path, notice: 'Einstellungen akzeptiert.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @users.errors, status: :unprocessable_entity }
      end
    end
  end


  def charts
    temp = 0

    data1=0
    @schlafpost = Schlafpost.find_all_by_user_id(params[:user_id])
    data_c = (@schlafpost.first.ende - @schlafpost.first.anfang)/3600
    @schlafpost.each do |schlafblog|
      if schlafblog.date == temp
        data1 += (schlafblog.ende - schlafblog.anfang) /3600
        if schlafblog == @schlafpost.last
          data_c = (data_c + data1)/2
        end
      else
        data_c = (data_c + data1)/2
        data1=(schlafblog.ende - schlafblog.anfang) /3600
        temp = schlafblog.date
      end
    end
    data_c=data_c.round(2)
    @data = [data_c,(24-data_c)]
  end

  private
  def round_n(n)
    val = (self*10**n).round.to_f / 10**n
  end

end

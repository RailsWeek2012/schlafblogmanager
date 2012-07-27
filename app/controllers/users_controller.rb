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
    #berechnet die durchschnittliche Schlafdauer pro Tag

    temp = 0

    data1=0
    #alle Schlafposts vom current_user + rückwärtsgeordnet nach Datum
    @schlafpost = Schlafpost.find_all_by_user_id(params[:user_id],:order => "date DESC")
    data_c = (@schlafpost.first.ende - @schlafpost.first.anfang)/3600
    data_c += 24 if data_c<0
    @schlafpost.each do |schlafblog|
      dauer = (schlafblog.ende - schlafblog.anfang)/3600
      if dauer<0
        dauer += 24
      end
      if schlafblog.date == temp

        data1 += dauer
        if schlafblog == @schlafpost.last
          data_c = (data_c + data1)/2
        end
      else
        data_c = (data_c + data1)/2
        data1=dauer
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

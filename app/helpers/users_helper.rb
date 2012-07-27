module UsersHelper
    #vorgegeben von google-charts
    #errichtet einen Link!!!, der auf eine 3D-Kuchengrafik zeigt, die "daten" mit "beschriftung" sowie "title" widerspiegelt.
    def Go_Chart(daten,beschriftung,title)
      Gchart.pie_3d(:size => '600x200',
          :title => title,
          :labels => beschriftung,
          :data => daten,
      :bar_colors => 'A6121F,313436')

    end

    #falls der User sich einen Namen zugewiesen hat, wird dieser angezeigt, wenn nicht, dann seine uid vom CAS
    def if_user_has_a_name(user)
      if user.name
        user.name
      else
        user.uid
      end
    end

end

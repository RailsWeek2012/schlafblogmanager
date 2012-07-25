module UsersHelper

    def Go_Chart(daten,beschriftung1,beschriftung2)
      Gchart.pie_3d(:size => '600x200',
          :title => "durchschnittliche Schlafdauer",
          :labels => [beschriftung1,beschriftung2],
          :data => daten,
      :bar_colors => 'A6121F,313436')

    end

    def if_user_has_a_name
      if user.name
        user.name
      else
        user.uid
      end
    end

end

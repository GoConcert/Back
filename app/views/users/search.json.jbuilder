if @user.nil?
    json.set! :status, 'Error 404 : not found'
elsif
    json.extract! @user, :id, :user_name, :location
    json.pref @music_styles.each do |music|
        json.id music.first.id
        json.name music.first.name
    end
end
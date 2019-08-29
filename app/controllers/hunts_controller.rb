class HuntsController < ApplicationController
  def create
    hunt_already_exist = false
    monument = Monument.find(params[:monument_id])
    hunts = current_user.hunts
    hunts.each do |hunt|
      hunt.current_hunt = false
      if hunt.monument.id == monument.id
        hunt.current_hunt = true
        hunt_already_exist = true
      end
      hunt.save
    end
    Hunt.create(current_hunt: true, progress: 0, monument: monument, user: current_user) unless hunt_already_exist
    redirect_to monument_path(monument)
  end

  def scanned
    actual_hunt = nil
    hunt_already_exist = false
    monuments = Monument.where("qrcode = '#{params[:url]}'")
    if monuments.length > 0
      hunts = current_user.hunts
      hunts.each do |hunt|
        hunt.current_hunt = false
        if hunt.monument.id == monuments[0].id
          hunt.current_hunt = true
          hunt_already_exist = true
          hunt.progress = 1
          actual_hunt = hunt
        end
        hunt.save
      end
      actual_hunt = Hunt.create(current_hunt: true, progress: 1, monument: monuments[0], user: current_user) unless hunt_already_exist
      redirect_to monument_path(monuments[0])
    end
  end

  def show
    @hunt = Hunt.where(user_id: current_user, monument_id: params[:monument_id]).first
    @score = count_score(@hunt)
    @coins = count_coins(@score)
    @xp = count_xp(@score)

    current_user.coins += @coins
    @total_xp = current_user.exp + @xp
    current_user.level += @total_xp / 100
    @total_xp = @total_xp % 100
    current_user.exp = @total_xp
    @hunt.progress = 3
    current_user.save
    @current_user_total_xp = current_user.exp + (current_user.level * 100)
  end

  private

  def count_score(hunt)
    choices = hunt.choices
    count = 0
    choices.each { |choice| count += 1 if choice.success == true }
    return count
  end

  def count_coins(score)
    coins = 0
    case score
    when 6
      coins = 20
    when 7
      coins = 40
    when 8
      coins = 60
    when 9
      coins = 80
    when 10
      coins = 120
    end
    return coins
  end

  def count_xp(score)
    xp = 0
    case score
    when 1
      xp = 10
    when 2
      xp = 20
    when 3
      xp = 30
    when 4
      xp = 40
    when 5
      xp = 50
    when 6
      xp = 70
    when 7
      xp = 90
    when 8
      xp = 110
    when 9
      xp = 130
    when 10
      xp = 160
    end
    return xp
  end
end

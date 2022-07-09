require 'rails_helper'

RSpec.describe 'moves index page' do
  it 'displays all the moves in the game' do
    fox = Fighter.create!(name: "Fox The Boxer", rival: "true", rank: 3, style: "Paw-Boxing")
    turtle = Fighter.create!(name: "The Tilted Turtle", rival: "false", rank: 5, style: "Ninjutsu")
    mailman = Fighter.create!(name: "The Mailman", rival: "true", rank: 4, style: "Backyard Brawling")

    fox_l = Move.create!(name: "Slash (Light)", power: 41, speed: 93, grade: "77.0 - B Tier", top_tier: false, fighter_id: fox.id)
    tur_h = Move.create!(name: "Roundhouse (Heavy)", power: 60, speed: 62, grade: "71.0 - B Tier", top_tier: false, fighter_id: turtle.id)
    mail_h = Move.create!(name: "Dolly Smash (Heavy)", power: 77, speed: 54, grade: "76.5 - B Tier", top_tier: false, fighter_id: mailman.id)

    visit "/moves"

    expect(page).to have_content(fox_l.name)
    expect(page).to have_content(tur_h.grade)
    expect(page).to have_content(mail_h.power)
  end
end
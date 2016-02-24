require 'telegram'


class TelegramController < ApplicationController
  
  def incoming
  	# telegram parameters are stored in a hash
  	# we access them to get important information out of it
  	chat_id = params["message"]["chat"]["id"]
  	message = params["message"]["text"]

    # find the reviewer with that chat_id and if it doesn't exist create it
  	reviewer = Reviewer.find_or_create_by! telegram_id: chat_id
    # get the step that the reviewer is currently at
  	current_step = reviewer.current_step

    reviewer_details(chat_id, reviewer)

    render json: params
  end

  def reviewer_details chat_id, reviewer
  	# save the reviewer's info, in this case the name
    name = params["message"]["from"]["first_name"]
    # check if the reviewer's name is saved
    if reviewer.name.blank? == true
      reviewer.update(name: name)
      Telegram.send_message(chat_id, "Thank's #{name} for taking the survey!", true, [])
    else
      Telegram.send_message(chat_id, "Hi #{name} You can resume where you left off.", true, [])
    end
  end

  def reviewer_response
    
  end
end

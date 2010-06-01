class ListenerController < ApplicationController
  
  skip_before_filter :verify_authenticity_token
  
  def receive_email
    @params = params
    
    @inbound_email = Post.new(:title => clean_field(params["subject"]),
                              :picture => params["attachment1"]
                              )
                          
    respond_to do |format|
      if @inbound_email.save && request.post?
        flash[:notice] = 'Sucessful Post.'
        format.xml { render => @inbound_email.xml, :status => :created  }
      else
        flash[:error] = 'There was an error with saving the post'
        format.xml { render => @inbound_email.xml.errors, :status => :unprocessable_entry }
      end
    end
  
  end
  
  private
  def clean_field(input_string)
    input_string.gsub(/\n/, '') if input_string
  end
  
end

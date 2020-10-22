class Users
  include Mongoid::Document


  field :id, type: Integer
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  add_index({id: 1})

  def self.create_user_data(data)
    create(data) 
  end 

  def self.create_data(url,req_data,res_data,req_type,api_name,device_type_id=nil)
    begin
      Rails.logger.info "=========================req_data - #{req_data}==============="
      Rails.logger.info "=========================res_data - #{res_data}==============="
      new_data = {}
      new_data["api_url"] = url
      new_data["request_type"] = req_type
      new_data["request_data"] = req_data
      new_data["response_data"] = res_data
      new_data["api_name"] = api_name
      new_data["created_at"] = Time.now
      new_data["updated_at"] = Time.now
      new_data["device_type_id"] = device_type_id
      create_request_data(new_data)
    rescue Exception => e
    end
  end

end